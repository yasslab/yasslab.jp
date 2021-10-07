---
layout: plain
title:  事業実績
---

<section class="entry_content pt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h1>事業実績</h1>
	<br>
        <h2><a href="#top">創る・学ぶを支援する<br>３つの事業を展開</a></h2>
        <div class="col-md-8 offset-md-3" style="padding-bottom: 50px;">
          <ol>
	    <li><b><a href="https://railstutorial.jp/">Railsチュートリアル</a></b>の運営: <a href="http://railstutorial.jp/#text">書籍</a>・<a href="https://railstutorial.jp/screencast">動画</a>・<a href="https://railstutorial.jp/#learn-by">質問対応</a>など</li>
	    <li><b><a href="https://railsguides.jp/">Railsガイド</a></b>の運営: <a href="https://railsguides.jp/ebook">書籍</a>・<a href="https://railsguides.jp/pro">Proプラン</a>・<a href="https://railsguides.jp/team">Teamプラン</a>など</li>
	    <li>法人向け: <a href="https://railstutorial.jp/business">研修の内製化支援</a>・<a href="https://railstutorial.jp/partner">教材のライセンス契約</a>など</li>
          </ol>
	  <div id="story"></div>
        </div>

	<h2><a href="#story">創業ストーリー</a></h2>
	<div class="col-md-12 text-center" style="padding-bottom: 30px;">
	  早稲田大学の講演で使われたスライド資料です。<br class="ignore-sp">創業初期を時系列でまとめています。</div>
	<div class="col-md-8 offset-md-2" style="padding-bottom: 30px;">
	  <script async class="speakerdeck-embed"
	   data-id="ee19ff2514724ee2b345068cfd37581c"
	   data-ratio="1.33333333333333"
	   src="//speakerdeck.com/assets/embed.js"></script>
	  (<a href="https://www.youtube.com/watch?v=Fr2NGuc7R94" target="_blank" rel='noopener'>YouTube で見る</a>)
        </div><!--//col-md-8  offset-md--->
      </div><!--//col12-->
    </div><!--//row-->

    <div class="row"> 
      <div class="col-md-8 offset-md-2">
        <div class="text-center">
          <h2 id="achievements" class="mb-5 mt-5"><a href="#achievements">活動実績</a></h2>
        </div>
        <p id='2020'>以下、これまでの活動実績を箇条書きでまとめております。<br class="ignore-sp">取引先として弊社をご検討する際などにお役立てください。</p>

	<h3><a href='#2020'>2020年〜現在</a></h3>
	<p>
	  <a href="https://note.com/">note</a> から許諾を頂き『<strong><a href="/ja/news">お知らせ</a></strong>』ページに移行しました。<br class="ignore-sp">2020年以降の活動実績については下記をご参照ください。
	</p>
	<p>
	  お知らせ - YassLab 株式会社<br>
	  <a href="/ja/news">https://yasslab.jp/ja/news</a>
	</p>

	{%- capture achievements -%}{% include_relative achievements.md %}{%- endcapture -%}
	<div class="achievements" style="margin-bottom: 100px;">
	  {{ achievements | markdownify }}
	</div>

      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
  <div id="clients"></div>
</section>

<section class="entry_content pt-5 catchCopy">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
	<h2 class="text-center mt-5 mb-5"><a href="#clients">これまでの取引先</a></h2>

	<p>YassLab 社が展開する各種事業のこれまでの取引先をまとめております。カッコ内は取引の概略です。</p>

	{% include clients.html %}
        
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>

<section class="entry_content pt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-8 offset-md-2 company" id="company">
        <div class="text-center">
          <h2 class="mt-5 mb-5">会社情報</h2>
        </div>
	
	<div class="video">
	  <iframe width="560" height="315" data-src="https://www.youtube.com/embed/JZ0y2eOLC4I?rel=0"
	   class="lazyload" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>

	<div class="offset-md-1">
	  {% include profile_company.html benefits=true %}
	</div>
      </div>
    </div>
  </div>
</section>
