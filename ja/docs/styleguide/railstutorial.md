---
layout: legal
title:  Railsチュートリアル配色ガイドライン
---
<div class="text-center">
  <h1 id="top"><a href="#top">配色ガイドライン</a></h1>
</div>


{% for colors in site.data.styles.railstutorial %}
  {% if colors.name %}<h3>{{colors.name}}</h3>{% endif %}
  <p>{{colors.dsc}}</p>
  <div class="colors">
    {% for color in colors.colors %}
      <div class="color">
        <div class="one-color" style="background-color: #{{ color.code }}"></div>
        <p>{{ color.name }} #{{ color.code }}</p>
      </div>
    {% endfor %}
  </div>
{% endfor %}


<style media="screen">
  .color {
    margin: 12px;
    width: calc(25% - 24px);
  }
  .one-color {
    height: 100px;
  }
  .colors {
    display: flex;
    flex-wrap: wrap;
  }
</style>
