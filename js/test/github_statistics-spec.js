describe('calcGitHubStatistics', function() {
  describe('10 repositories each have 100 stars', function () {
    var mock_http_result = {
      target: {
        responseText: ""
      }
    };

    before(function() {
      var prepare = [];
      for (var i = 0; i < 10; i++) {
        var repository_data = {
          id: i,
          stargazers_count: 100
        };
        prepare.push(repository_data);
      }
      mock_http_result.target.responseText = JSON.stringify(prepare);
    });

    it('return 10 repositories', function() {
      var result = calcGithubStatistics(mock_http_result);
      if (result.repositories === 10) {
      } else {
        throw new Error('repository count is not correct');
      }
    });

    it('return 1000 stars', function() {
      var result = calcGithubStatistics(mock_http_result);
      if (result.stars === 1000) {
      } else {
        throw new Error('total star count is not correct');
      }
    });
  });
});