# frozen_string_literal: true

# CSS Visual Regression Check
# ---------------------------
# Compares the *rendering* of the compiled CSS against a saved snapshot.
#
# Why tuples instead of a byte/diff comparison?
#   Selector order (`.a,.b` vs `.b,.a`) and rule grouping do NOT affect how a
#   page renders, but they DO change the bytes. To detect only meaningful
#   (visual) changes we normalize each rule into a set of
#   `media-context || selector || declaration` tuples — i.e. "which element gets
#   which property value, under which media query". Two builds with the same
#   tuple set render identically, even if their CSS bytes differ.
#
# Usage:
#   ruby tasks/css_visual_check.rb snapshot [snapshot_path]  # save current as baseline
#   ruby tasks/css_visual_check.rb diff     [snapshot_path]  # compare current vs baseline
#
# Or via Rake:
#   bundle exec rake css:snapshot
#   bundle exec rake css:diff
#
# Exit code of `diff` is non-zero when the rendering differs, so it can gate CI.

require "set"

module CssVisualCheck
  CSS_GLOB        = "_site/css/*.css"
  DEFAULT_SNAPSHOT = "test/css_snapshot.txt"

  module_function

  # Parse one CSS string into a sorted, de-duplicated array of
  # "context || selector || declaration" tuples.
  #
  # The parser is intentionally simple (not a full CSS spec parser): it only
  # needs to be *deterministic* and capture selector→declaration associations,
  # so that the SAME imperfection applies to both sides of a diff.
  # `@media` / `@supports` preludes are tracked as nestable context; other rules
  # (style rules, `@font-face`, ...) contribute their declarations directly.
  # Known limitation: nested at-rules like `@keyframes` (which contain nested
  # `0% { ... }` blocks) are parsed shallowly. That is acceptable here — the
  # parser is deterministic, so an animation change still surfaces as a tuple
  # diff, and the current compiled CSS contains no @keyframes.
  def tuples_from_css(css)
    tuples  = []
    context = []   # stack of @media/@supports preludes currently open
    buffer  = +""
    chars   = css.chars
    i = 0
    n = chars.length

    while i < n
      c = chars[i]
      if c == "{"
        prelude = buffer.strip
        buffer  = +""
        if prelude.start_with?("@media", "@supports")
          context.push(normalize_ws(prelude))
        else
          # Style rule (or @font-face etc.): body has no nested braces.
          body = +""
          i += 1
          while i < n && chars[i] != "}"
            body << chars[i]
            i += 1
          end
          ctx = context.join(" ")
          # Split on top-level delimiters only, so `;` inside a data-URI
          # (e.g. url("data:image/svg+xml;charset=utf8,...")) or `,` inside a
          # functional selector (`:not(...)`) is NOT treated as a separator.
          selectors    = split_top_level(prelude, ",").map { |s| normalize_ws(s) }.reject(&:empty?)
          declarations = split_top_level(body, ";").map { |d| normalize_ws(d) }.reject(&:empty?)
          selectors.each do |sel|
            declarations.each { |decl| tuples << "#{ctx} || #{sel} || #{decl}" }
          end
        end
      elsif c == "}"
        context.pop unless context.empty?
      else
        buffer << c
      end
      i += 1
    end

    tuples.sort.uniq
  end

  def normalize_ws(str)
    str.gsub(/\s+/, " ").strip
  end

  # Split `str` on `delim`, but only at the top level — ignore the delimiter
  # while inside (), [], {} or a quoted string. Keeps data URIs and functional
  # selectors intact.
  def split_top_level(str, delim)
    parts   = []
    current = +""
    depth   = 0
    quote   = nil
    str.each_char do |c|
      if quote
        current << c
        quote = nil if c == quote
      elsif c == '"' || c == "'"
        quote = c
        current << c
      elsif c == "(" || c == "[" || c == "{"
        depth += 1
        current << c
      elsif c == ")" || c == "]" || c == "}"
        depth -= 1 if depth.positive?
        current << c
      elsif c == delim && depth.zero?
        parts << current
        current = +""
      else
        current << c
      end
    end
    parts << current
    parts
  end

  # Build the tuple set across every compiled CSS file (file name included so a
  # rule moving between files is still detected).
  def current_tuples
    files = Dir[CSS_GLOB].sort
    if files.empty?
      abort "No compiled CSS found at #{CSS_GLOB}. Run `bundle exec jekyll build` first."
    end
    files.flat_map do |path|
      name = File.basename(path)
      tuples_from_css(File.read(path)).map { |t| "#{name} :: #{t}" }
    end.sort
  end

  def snapshot(path = DEFAULT_SNAPSHOT)
    tuples = current_tuples
    File.write(path, tuples.join("\n") + "\n")
    puts "✅ Snapshot saved: #{path} (#{tuples.size} tuples from #{Dir[CSS_GLOB].size} files)"
  end

  def diff(path = DEFAULT_SNAPSHOT)
    unless File.exist?(path)
      abort "No snapshot at #{path}. Create one first: `bundle exec rake css:snapshot`."
    end
    base    = File.read(path).split("\n").reject(&:empty?).to_set
    current = current_tuples.to_set

    removed = (base - current).to_a.sort
    added   = (current - base).to_a.sort

    if removed.empty? && added.empty?
      puts "✅ No visual changes: compiled CSS renders identically to the snapshot (#{current.size} tuples)."
      return true
    end

    puts "🔴 Visual change detected vs snapshot #{path}"
    puts "   removed (in snapshot, gone now): #{removed.size}"
    puts "   added   (new, not in snapshot):  #{added.size}"
    puts
    unless removed.empty?
      puts "--- removed (#{[removed.size, 40].min}/#{removed.size} shown) ---"
      puts removed.first(40)
    end
    unless added.empty?
      puts "--- added (#{[added.size, 40].min}/#{added.size} shown) ---"
      puts added.first(40)
    end
    false
  end
end

if $PROGRAM_NAME == __FILE__
  mode = ARGV[0]
  path = ARGV[1] || CssVisualCheck::DEFAULT_SNAPSHOT
  case mode
  when "snapshot"
    CssVisualCheck.snapshot(path)
  when "diff"
    exit(CssVisualCheck.diff(path) ? 0 : 1)
  else
    abort "Usage: ruby tasks/css_visual_check.rb {snapshot|diff} [snapshot_path]"
  end
end
