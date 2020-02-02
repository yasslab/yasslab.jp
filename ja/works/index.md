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
        <h2>沖縄と東京を拠点に<br>次の3つの事業を展開</h2>
        <div class="col-md-8 offset-md-3" style="padding-bottom: 50px;">
          <ol>
            <li><a href="/ja/agile">Ruby/Rails 開発支援サービス</a>の提供</li>
            <li><a href="https://railstutorial.jp/">Railsチュートリアル</a>/<a href="https://railsguides.jp/">Railsガイド</a>の運営</li>
            <li id="story"><a href="https://speakerdeck.com/yasulab/how-we-continuously-translate-tech-docs">継続的翻訳</a>/<a href="https://speakerdeck.com/yasulab/continuous-integration-for-ebook">継続的組版システム</a>の開発</li>
          </ol>
        </div>

	<h2><a href="#story">創業ストーリー</a></h2>
	<div class="col-md-12 text-center" style="padding-bottom: 30px;">
	  早稲田大学の講演で使われたスライド資料です。<br class="ignore-sp">過去〜現在までの流れが時系列でまとめられています。</div>
	<div class="col-md-8 offset-md-2" style="padding-bottom: 30px;">
	  <script async class="speakerdeck-embed"
	   data-id="ee19ff2514724ee2b345068cfd37581c"
	   data-ratio="1.33333333333333"
	   src="//speakerdeck.com/assets/embed.js"></script>
	  (スライドが表示されない場合は<a href="https://speakerdeck.com/yasslab/learn-by-your-own-projects" target="_blank">コチラ</a>から)
        </div><!--//col-md-8  offset-md--->
      </div><!--//col12-->
    </div><!--//row-->

    <div class="row"> 
      <div class="col-md-8 offset-md-2">
        <div class="text-center">
          <h2 id="achievements" class="mb-5 mt-5"><a href="#achievements">活動実績</a></h2>
        </div>
        
        <p>以下、これまでの活動実績を箇条書きでまとめております。<br class="ignore-sp">
	  取引先として弊社をご検討する際などにお役立てください。</p>

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
	  <iframe width="560" height="315" src="https://www.youtube.com/embed/JZ0y2eOLC4I?rel=0"
       frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>

	<div class="offset-md-1">
	  {% include profile_company.html benefits=true %}
	</div>
      </div>
    </div>
  </div>
</section>
