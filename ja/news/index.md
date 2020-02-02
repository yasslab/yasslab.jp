---
layout: news
title:  📜 お知らせ
thumbnail: bg-sky.jpg
lang: ja
---

<ul style="list-style: none; padding-top: 10px; padding-bottom: 70px;
	   margin-left: -30px; width: 105%;">
  {% for news in site.data.news %}
    {% include news.html %}
  {% endfor %}
</ul>

<hr>

{% include recent_tweets.html %}
