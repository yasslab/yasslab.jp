---
layout: news
title:  📜 お知らせ
thumbnail: bg-sky.jpg
---

<ul style="list-style: none; padding-top: 10px; padding-bottom: 70px;
	   margin-left: -30px; width: 105%;">
  {% for post in site.data.news %}
    {% include post.html %}
  {% endfor %}
</ul>

<hr>

{% include recent_tweets.html %}
