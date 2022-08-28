# See the following 'Custom Tests' section to add tests ;)
# https://github.com/gjtorikian/html-proofer#custom-tests

class QiitaTeam < ::HTMLProofer::Check
  # Links to Qiita:Team should be failed due to access limitations

  def run
    @html.css('a').each do |node|
      link = create_element(node)
      next if link.ignore?

      if link.href.include? 'yasslab.qiita.com'
        return add_failure("Links to Qiita:Team does NOT work for visitors.", line: link.line)
      end
    end
  end
end
