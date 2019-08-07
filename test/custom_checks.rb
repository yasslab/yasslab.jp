# See the following 'Custom Tests' section to add tests ;)
# https://github.com/gjtorikian/html-proofer#custom-tests

class QiitaTeamCheck < ::HTMLProofer::Check
  # Links to Qiita:Team should be failed due to access limitations
  def yasslab_qiita_team_links?
    return false if @link.data_proofer_ignore || @link.href.nil?
    @link.href.match /yasslab\.qiita\.com/
  end

  def run
    @html.css('a').each do |node|
      @link = create_element(node)
      line = node.line

      if yasslab_qiita_team_links?
        return add_issue("Don't link to Qiita:Team directly!", line: line)
      end
    end
  end
end
