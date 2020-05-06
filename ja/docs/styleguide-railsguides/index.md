---
layout: legal
title:  Railsガイドの配色ガイドライン
---
<div class="text-center">
  <h1 id="top"><a href="#top"><a href="http://railstutorial.jp/">Railsガイド</a><br class="ignore-sp">の配色ガイドライン</a></h1>
</div>

## カラーパレット🎨
クリックで16進数カラーコードがコピーできます。
{% for colors in site.data.styles.railsguides %}
  {% if colors.name %}<h3>{{colors.name}}</h3>{% endif %}
  {% if colors.dsc %}<p>{{colors.dsc}}</p>{% endif %}
  <div class="colors">
    {% for color in colors.colors %}
      <div class="color">
        <div class="one-color" style="background-color: #{{ color.code }}" onclick="Copy('#{{color.code}}')"><p  style="{% if color.txt == 'white' %} color: #fff; {% endif %}">{{ color.name }}<br>#{{ color.code }}</p></div>
      </div>
    {% endfor %}
  </div>
{% endfor %}

## 色の適用ルール

### テキスト
#### 基本色
本文及び見出しの文字色はblack( )を使用してください。
背景色の輝度(HSLでいうL)が50%未満の場合は、白(#fff)を使用してください。

#### リンク


色彩Tips: 色の見え方は様々なので、色による区別のみではなく、プラス明るさや形での区別がおすすめです！

#### 特別な文字色

### ボタン

### イラスト・グラフ
色相は4色以内がベターです。※同じ色で明るさが違うものを使うのはOKです🙆‍
### アイコン

<style media="screen">
  .color {
    margin: 4px;
    width: calc(25% - 8px);
  }
  .one-color {
    height: 100px;
    cursor: pointer;
    border-radius: 4px;
    padding: 8px;
  }
  .colors {
    display: flex;
    flex-wrap: wrap;
  }
</style>
<div id='copy' style='color:#fff;opacity:0;'>
</div>
<script type="text/javascript">
  function Copy(color) {
    var div = document.getElementById('copy');
    div.innerHTML = '';
    var text = document.createTextNode(color);
    div.appendChild(text);
    window.getSelection().selectAllChildren(div);
    document.execCommand('copy');
  }
</script>
