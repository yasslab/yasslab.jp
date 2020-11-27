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
### 色の使い方
基本的にはこのパレットにあるものを使ってください。ただし、グレースケールの色(彩度が0のもの)を使う場合はこの限りではありません。
### テキスト
#### 基本色
本文及び見出しの文字色はgray-dark(#333333)を使用してください。
背景色の輝度(HSLでいうL)が50%未満の場合は、白(#fff)を使用してください。

#### リンク
通常時はmain-dark、ホバー時はmain-lightを使用してください。

色彩Tips: 色の見え方は様々なので、色による区別のみではなく、プラス明るさや形での区別がおすすめです！

#### 特別な文字色
背景色が main-dark ~ main のとき、その中でコンテンツそのものでなく、理解を補助する文字(キャプション等)を入れたい場合は、不透明度が0.6の白(#fff)を使用してください。

### ボタン
背景色はmain, 文字色は#fffを使用してください。
ホバー時は背景色をmain-lightにしてください。

### イラスト・グラフ
色相は4色以内がベターです。※同じ色で明るさが違うものを使うのはOKです🙆‍

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

<div id='copy' style='color:#fff;opacity:0;'></div>

<script type='text/javascript' src="/js/bootstrap-notify.min.js"></script>
<script type="text/javascript">
  function Copy(color) {
    var div = document.getElementById('copy');
    div.innerHTML = '';
    var text = document.createTextNode(color);
    div.appendChild(text);
    window.getSelection().selectAllChildren(div);
    document.execCommand('copy');

    // Bootstrap Notify: https://github.com/mouse0270/bootstrap-notify/releases/tag/3.1.3
    $.notify({
      // options
      message: 'コピーしました'
    },{
      // settings
      type: 'info',
      placement: {
	from: "bottom",
	align: "right"
      },
    });
  }
</script>
