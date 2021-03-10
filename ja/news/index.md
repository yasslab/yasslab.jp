---
layout: news
title:  📜 お知らせ
thumbnail: bg-sky.jpg
---

{% include news-search.html %}

<ul style="list-style: none; padding-top: 10px; padding-bottom: 70px;
	   margin-left: -30px; width: 105%;">

  <!-- Show this year before the top of news in each year-->
  {% assign this_year = site.data.news.first.date | date: '%Y' | to_integer %}

  {% for news in site.data.news %}
    {% assign news_year = news.date | date: '%Y' | to_integer %}
    {% if this_year == news_year %}
      <div style="text-align: center"><h2>{{ this_year }}年</h2></div>
      {% assign this_year = this_year | minus: 1 %}
    {% endif %}

    {% include news.html %}
  {% endfor %}
</ul>

<hr>

{% include recent_tweets.html %}
