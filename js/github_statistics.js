var retry_count = 0;
const MAX_RETRY = 3;

var error_stats = {
  repositories: "🙏",
  stars: "🙇"
};

const modifyDom = function (stats) {
  var repositories = document.getElementById("github__repositories");
  var stars = document.getElementById("github__stars");

  if (repositories && stars) {
    repositories.textContent = stats.repositories;
    stars.textContent = stats.stars;
  }
}

function calcGithubStatistics(result) {
  var github_json_data = JSON.parse(result.target.responseText);
  var repo_count = github_json_data.length;

  var github_statistics = {
    repositories: repo_count,
    stars: 0
  };

  for (var i = 0; i < repo_count; i++) {
    github_statistics.stars += github_json_data[i].stargazers_count;
  }

  return github_statistics;
}

function githubSuccessCallback(result) {
  var is_succeed = false;
  if (result.target.status != 200) {
    if (retry_count < MAX_RETRY) {
      retry_count++;
      getGithubData();
    } else {
      modifyDom(error_stats);
    }
  } else {
    var github_statistics = calcGithubStatistics(result);
    modifyDom(github_statistics);
    is_succeed = true;
  }

  return is_succeed;
}

function githubErrorCallback(result) {
  var is_retried = true;
  if (retry_count < MAX_RETRY) {
    retry_count++;
    getGithubData();
  } else {
    modifyDom(error_stats);
    is_retried = false;
  }

  return is_retried;
}

function getGithubData() {
  const request = new XMLHttpRequest();
  const uri = 'https://api.github.com/orgs/yasslab/repos';

  request.open('GET', uri);
  request.setRequestHeader('Accept', 'application/vnd.github.preview')
  request.addEventListener('load', githubSuccessCallback, false);
  request.addEventListener('error', githubErrorCallback, false);
  request.send();
}

getGithubData();
