let retry_count = 0;
const MAX_RETRY = 3;

const error_stats = {
  repositories:  "65",
  stars:        "408"
};

const modifyDom = function (stats) {
  const repositories = document.getElementById("github__repositories");
  const stars        = document.getElementById("github__stars");

  if (repositories && stars) {
    repositories.textContent = stats.repositories;
    stars.textContent        = stats.stars;
  }
}

function calcGithubStatistics(result) {
  const github_json_data = JSON.parse(result.target.responseText);
  const repo_count       = github_json_data.length;

  const github_statistics = {
    repositories: repo_count,
    stars: 0
  };

  for (let i = 0; i < repo_count; i++) {
    github_statistics.stars += github_json_data[i].stargazers_count;
  }

  return github_statistics;
}

function successCallback(result) {
  let is_succeed = false;
  if (result.target.status != 200) {
    if (retry_count < MAX_RETRY) {
      retry_count++;
      getGithubData();
    } else {
      modifyDom(error_stats);
    }
  } else {
    const github_statistics = calcGithubStatistics(result);
    modifyDom(github_statistics);
    is_succeed = true;
  }

  return is_succeed;
}

function errorCallback(result) {
  let is_retried = true;
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
  const uri     = 'https://api.github.com/orgs/yasslab/repos?per_page=100';

  request.open('GET', uri);
  request.setRequestHeader('Accept', 'application/vnd.github.preview')
  request.addEventListener('load',  successCallback, false);
  request.addEventListener('error',   errorCallback, false);
  request.send();
}

getGithubData();
