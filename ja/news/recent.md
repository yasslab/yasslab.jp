---
layout: news
title:  📜 最近のお知らせ
thumbnail: bg-sky.jpg
---

```
{% for news in site.data.news limit:20 %}
- [{{ news.date | date: "%m/%d" }} {{ news.title }}]({{ news.url }}){% endfor %}
```

