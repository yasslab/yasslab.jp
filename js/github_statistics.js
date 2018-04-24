var retry = 0;
const MAX_RETRY = 3;

var statistics;

const modifyDom = function (stat) {
  // write to modify dom code
  console.log(stat);
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

  statistics = github_statistics;
  return github_statistics;
}

function githubSuccessCallback(result) {
  if (result.target.status != 200) {
    retry++;
    if (MAX_RETRY < retry) {
      console.log(retry);
      getGithubData();
    }
    return
  }

  var github_statistics = calcGithubStatistics(result);
  modifyDom(github_statistics);
}

function getGithubData() {
  const request = new XMLHttpRequest();
  const uri = 'https://api.github.com/orgs/yasslab/repos';

  request.open('GET', uri);
  request.setRequestHeader('Accept', 'application/vnd.github.preview')
  request.addEventListener('load', githubSuccessCallback, false);
  request.send();
}

getGithubData();
console.log(statistics); // すぐには反映されない
