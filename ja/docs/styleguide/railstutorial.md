---
layout: legal
title:  Railsチュートリアル配色ガイドライン
---
<div class="text-center">
  <h1 id="top"><a href="#top">配色ガイドライン</a></h1>
</div>


{% for colors in site.data.styles.railstutorial %}
  <h2>{{colors.name}}</h2>
  <p>{{colors.dsc}}</p>
  <div class="colors">
    {% for color in colors.colors %}
      <div class="color">
        <div class="one-color" style="background-color: #{{ color.code }}"></div>
        <p>{{ color.name }} #{{ color.code }}</p>
        <p>{{ color.dsc }}</p>
      </div>
    {% endfor %}
  </div>
{% endfor %}


<style media="screen">
  .color {
    margin: 12px;
    width: calc(33% - 24px);
  }
  .one-color {
    height: 100px;
  }
  .colors {
    display: flex;
    flex-wrap: wrap;
  }
</style>
