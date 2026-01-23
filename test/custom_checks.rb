# See the following 'Custom Tests' section to add tests ;)
# https://github.com/gjtorikian/html-proofer#custom-tests

class QiitaTeam < ::HTMLProofer::Check
  # Links to Qiita:Team should be failed due to access limitations

  def run
    @html.css('a').each do |node|
      link = create_element(node)
      next if link.ignore?

      if link.href.match? /yasslab\.qiita\.com/
        return add_failure("Links to Qiita:Team does NOT work for visitors.", line: link.line)
      end
    end
  end
end

# Custom checks for HTML-Proofer
class TrailingSlash < HTMLProofer::Check
  def run
    @html.css('a').each do |node|
      href = node['href']
      next if href.nil? || href.empty?

      # 外部リンクを除外（httpで始まるものをスキップ）
      next if href.start_with?('http://', 'https://')

      # アンカーがある場合はパス部分のみを取得、ない場合はhref全体
      base_path = href.include?('#') ? href.split('#').first : href

      # trailing slashで終わる内部リンクをチェック
      next unless base_path.end_with?('/')

      # ルートパス（/）は除外
      next if base_path == '/'

      # 絶対パスの場合は _site からの相対パスに変換
      file_path = if base_path.start_with?('/')
                    File.join('_site', base_path, 'index.html')
                  else
                    # 相対パスの場合は現在のファイルからの相対位置を計算
                    current_dir = File.dirname(@path)
                    File.join(current_dir, base_path, 'index.html')
                  end

      # ファイルが存在しない場合はエラー
      unless File.exist?(file_path)
        add_failure("Link with trailing slash '#{href}' points to non-existent path (expected: #{file_path})", line: node.line)
      end
    end
  end
end
