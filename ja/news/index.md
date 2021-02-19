---
layout: news
title:  📜 お知らせ
thumbnail: bg-sky.jpg
---

{% include news-search.html %}

<ul style="list-style: none; padding-top: 10px; padding-bottom: 70px;
	   margin-left: -30px; width: 105%;">
  <div style="text-align: center"><h2>2020年</h2></div>
  {% for news in site.data.news %}
    {% if news.this_year %}
      <div style="text-align: center"><h2>{{ news.this_year }}年</h2></div>
    {% endif %}

    {% include news.html %}
  {% endfor %}
</ul>

<hr>

{% include recent_tweets.html %}
