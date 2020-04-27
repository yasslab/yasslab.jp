---
layout: legal
title:  Railsチュートリアル配色ガイドライン
---
<div class="text-center">
  <h1 id="top"><a href="#top">配色ガイドライン</a></h1>
</div>

## カラーパレット🎨
クリックで16進数カラーコードがコピーできます。
{% for colors in site.data.styles.railstutorial %}
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
本文及び見出しの文字色はblack(#111111)を使用してください。
背景色の輝度(HSLでいうL)が50%未満の場合は、白(#fff)を使用してください。

#### リンク
チュートリアル外: 通常はmainで、ホバー時はmain-lighterを使用してください。
チュートリアル内: 通常はnavyで、ホバー時はnavy-lightを使用してください。

色彩Tips: 色の見え方は様々なので、色による区別のみではなく、プラス明るさや形での区別がおすすめです！

#### 特別な文字色
背景色がmainのとき、その中でコンテンツそのものでなく、理解を補助する文字(キャプション等)を入れたい場合は、不透明度が0.7の白(#fff)を使用してください。

### ボタン
背景色はmain-light, 文字色は#fffを使用してください。

### イラスト・グラフ
色相は4色以内がベターです。※同じ色で明るさが違うものを使うのはOKです🙆‍
### アイコン
背景色の輝度が50%以上の場合、main-lightを使用してください。50%未満の場合は白(#fff)を使用してください。


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
