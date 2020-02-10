---
layout: plain_without_thumbnail
title:  月額制の Ruby/Rails 開発支援サービス
---

<section class="pageVisual">
  <div class="bg-dark">
  </div>
</section>

<section class="entry_content pt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="text-center">
          <h1 class="mb-5">月額制の<br class="ignore-sp">Ruby/Rails 開発支援</h1>
	  <h3 class="mb-5">経験豊富なチームで<br class="ignore-sp">御社の開発をサポートします</h3>
        </div>
	<img src="/img/team.png" alt="チーム開発イメージ" class="mt-3 mb-5">
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
  <div id="skills"><br></div>
</section>

<section class="entry_content pt-5">
  <div class="container">         
    <div class="row text-center">
      <div class="col-md-12">
        <h2 class="mb-5"><a href="#skills">得意なスキル・サービス</a></h2>
      </div>
      
      <div class="col">
	<a href="https://www.ruby-lang.org/" target="_blank">
          <img src="/img/icons/ruby.png" width="80%" alt="Ruby logo" /></a><br>
          Ruby / Rails
      </div> <!--//col-->
      
      <div class="col">
        <img src="/img/icons/test.png" width="80%" alt="test icon" /><br>Test
      </div>  <!--//col--> 
      
      <div class="col">
        <a href="https://github.com/" target="_blank">
          <img src="/img/icons/git.png" width="80%" alt="Git logo" /></a><br>Git / GitHub
      </div>  <!--//col--> 
      
      <div class="w-100"></div> 

      <div class="col">
        <img src="/img/icons/cloud.png" width="80%" alt="cloud icon" /><br>Heroku / AWS
      </div> <!--//col-->
      
      <div class="col">
        <img src="/img/icons/gear.png" width="80%" alt="Continuous Integration image" /><br>Continuous Integration
      </div>  <!--//col--> 
      
      <div class="col">
        <img src="/img/icons/agile.png" width="80%" alt="Agile Web Development image" /><br>Agile Web Development
      </div>  <!--//col-->  
      
      <div class="col-md-12">
        <p id="style" class="mt-5">上記の他、フロントエンドの技術 (HTML, CSS, JavaScript, jQuery, Vue.js) なども扱えますが、フロントエンドのみの開発支援は行っておりません。ご注意ください。</p>
      </div>
      
    </div><!--//row-->
  </div><!--//container-->
</section>

<section class="entry_content pt-5 bg-gray">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h2 class="mb-5"><a href="#style">契約スタイル</a></h2>
        <p>弊社では、IPAが公開しているアジャイル開発向けのモデル契約 (基本 + 個別契約) をベースにしております。</p>
        
        <div>
	  <img src="/img/contract-img.gif" alt="基本/個別契約モデルの概要" width="100%" />
	  <br><br>
          <center>参考: <a href="https://www.ipa.go.jp/files/000005404.pdf">アジャイル開発向けモデル契約案について</a> (IPA)</center>
	</div>
        
        <p>この契約の特徴は次の通りです:</p>
        <ul>
          <li>基本契約でNDAや著作権の譲渡などを取り扱います</li>
	  <li>個別契約で稼働数や金額の調整などを取り扱います</li>
          <li>準委任契約となり、成果物は作業報告書になります</li>
        </ul>
	<p>上記のモデル契約書を具体化した契約書が、次の契約書になります。特に、ユーザとベンダの定義、個別契約書と作業報告書の関係性などを具体化しています。</p>
        
        <p><a href="https://www.dropbox.com/sh/zqrdkmie0dambh1/AAD8ilSwPIBzrT09qu_9f4B3a" target="_blank">IPAのモデル契約をベースにした基本/個別契約書の例 (作成: YassLab 株式会社)</a></p>
        
        <p id="price">なお、本契約スタイルと似た契約であれば、上記の契約書でなくても問題ありません。</p>
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>

<section class="entry_content pt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h2 class="mb-5"><a href="#price">基本料金: 80〜120万/月 ×
	  稼働数</a></h2>
        <ul>
          <li>週30〜40時間相当の稼働数を『１』とした金額が基本料金となります</li>
      	  <li>安定的に価値を出すため、２名以上のチームによる稼働を推奨しています</li>
          <li>これまでの事例では、常時２〜３名相当の稼働数による開発支援が多いです</li>
        </ul>
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
  <div id="schedule"></div>
</section>

<section class="entry_content pt-5 pb-5">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h2 class="mb-5"><a href="#schedule">現在のスケジュール</a></h2>
	<!--
	     reserved:  'ありがとうございました'
	     adjusting: 'お問い合わせください'
	     available: 'ご相談お待ちしております'
	-->
	{% include agile-schedule.html
	    started_month=2
	     plus_0='reserved'
	     plus_1='reserved'
	     plus_2='adjusting'
	     plus_3='adjusting'
	     plus_4='adjusting'
	     plus_5='adjusting'
	%}
        
        <table class="caption">
          <tr>
            <th><img src="/img/agile-available.png" alt="Available" /></th>
            <td>現在ご対応が可能です。ご相談お待ちしております。</td>
          </tr>
          <tr>
            <th><img src="/img/agile-adjusting.png" alt="Adjusting" /></th>
            <td>各社と予定調整中です。まだ間に合いますので、お気軽に<a href="#contact">お問い合わせ</a>ください。</td>
          </tr>
          <tr>
            <th><img src="/img/agile-reserved.png"  alt="Reserved" /></th>
            <td>契約が締結されました。様々なお問い合わせ、ありがとうございました。</td>
          </tr>
        </table>
	<br><br>
	
	<h4>メールでお知らせ</h4>
	<p class="text-center">弊社のスケジュールが空き次第、いち早くメールにてお届けします。<br class="ignore-sp">開発支援サービスを検討中のご担当者さまは、ぜひご登録ください。</p>
	<!-- Begin Mailchimp Signup Form -->
	<link href="//cdn-images.mailchimp.com/embedcode/horizontal-slim-10_7.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	 #mc_embed_signup{background:#fff; clear:left; font:14px Helvetica,Arial,sans-serif; width:100%;}
	 /* Add your own Mailchimp form style overrides in your site stylesheet or in this style block.
	    We recommend moving this block and the preceding CSS link to the HEAD of your HTML file. */
	</style>
	<div id="mc_embed_signup">
	  <form action="https://yasslab.us7.list-manage.com/subscribe/post?u=87929ed80d217471e88115dc6&amp;id=bcd0bfb7da" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
	    <div id="mc_embed_signup_scroll">
	      
	      <input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="example@your-company.co.jp" required>
	      <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
	      <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_87929ed80d217471e88115dc6_bcd0bfb7da" tabindex="-1" value=""></div>
	      <div class="clear"><input type="submit" value="登録する" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
	    </div>
	  </form>
	</div>
	<!--End mc_embed_signup-->

      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
  <div id="faq"></div>
</section>

<section class="entry_content pt-5 pb-5 frequently-asked-questions">
  <div class="container">
    <div class="row">
      <div class="col-md-12 text-center">
        <h2 class="mb-5"><a href="#faq">よくある質問</a></h2>
        <dl class="faq">
          <dt>１ヶ月だけの個別契約も可能ですか？</dt>
          <dd>はい、可能です。ただし翌月以降の契約の更新は保証されません。<br>一定期間の継続した開発支援をご希望の場合は、２〜６ヶ月単位でお申し込みください。まずは１〜２ヶ月のみ、その後に３ヶ月または６ヶ月単位で更新していく事例が多いです。</dd>
	  <br><br>
	  
	  <dt>対応可能な時間帯は決まっていますか？</dt>
	  <dd>基本的には 10:00〜19:00 としております (休憩１時間、打ち合わせや作業報告書の作成時間なども含まれます)。朝会がこの時間帯より早く始まるなどの理由で、対応時間を変更したい場合は<a href="#contact">お問い合わせ</a>ください。</dd>
	  <br><br>

	  <dt>各社との調整はどのように決まりますか？</dt>
	  <dd>『金額の高さ』や『期間の長さ』で決めさせて頂くことが多いです。複数社から同じ金額、同じ期間を提示して頂いた場合は、『過去に取引をしたことがあるか』『弊社が価値を出しやすい内容か』などを考慮することもあります。</dd>
	  <br><br>
	  
	  <dt>弊社のオフィスに常駐できますか？</dt>
	  <dd>オンラインでの開発支援を基本としており、オフィス常駐は行っておりません。代わりに、定期的なオンラインミーティングを推奨しております。東京近辺であれば、具体的な進め方をご説明しに伺うことも可能です。</dd>
        </dl>
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

	<p>YassLab 社が展開する各種事業 (開発支援サービス含む) のこれまでの取引先をまとめております。カッコ内は取引の概略です。こちらも合わせてご参考にしていただけると幸いです。</p>

	{% include clients.html %}
        
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
  <div id="references"></div>
</section>

<section class="entry_content pt-5">
  <div class="container">
    <div class="row">
      <div class="col-md-8 offset-md-2 company">
	<div class="text-center">
          <h2 class="mb-5"><a href="#references">会社情報</a></h2>
	</div>
	<div class="offset-md-1">
	  {% include profile_company.html %}
	</div>
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>
