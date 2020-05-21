---
layout: plain_without_thumbnail
---

<section class="mainVisual">
  <div class="jumbotron">
    <picture>
      <source media="(min-width: 600px)" srcset="/img/cover-photo.jpg">
      <img src="/img/cover-photo-mobile.jpg" alt="{{ site.company.vision }}">
    </picture>

    <div class="logo-catch">
      <!-- <img src="/img/icons/yasslab.svg" width="270" alt="YassLab Logo"> -->
      <h1 style="padding-bottom: 40px; font-size: 200%;">{{ site.company.vision }}</h1>
    </div>
  </div>
</section>

<section class="catchCopy entry_content" id="vision">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><a href="#vision">創って学ぶ、学んで創る</a></h2>
        <p class="text-md-center" style="text-align: center;">誰もがプロダクトを創り、磨き、語れる時代に。<br>個人・法人向けに各種サービスを提供しています。</p>
      </div>
    </div>
  </div>
</section>

<section class="products entry_content" id="products">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h3 style="line-height: 1.0em;"><a href="#products">《プロダクト開発の学びを支える》</a></h3>
	<p class="text-center"><a href="/ja/works/#story">創りながら学ぶ</a>ための書籍・動画・検索サービス</p>

        <div class="row">
          <div class="col-md-4 offset-md-1">
            <a href="https://railstutorial.jp/" target="_blank" rel="noopener">
	      <img class="books"
	       src="/img/logos/rails-tutorial.png"
               alt="Ruby on Rails チュートリアル">
	    </a>
	    <a href="https://railstutorial.jp/" target="_blank" rel="noopener"><h4>Railsチュートリアル</h4></a>
            <a href="https://railstutorial.jp/" target="_blank" rel="noopener">
              <button class="btn btn-ruby">初級・中級者向け</button>
            </a>
            <p>SNS 開発が題材の大型チュートリアル。プロダクト開発の<span style="background-color: #AA4536; color: white; border-radius: 2px;">
	      0→1
	    </span>を創りながら学びます。<a href="https://railstutorial.jp/screencast">解説動画</a>や<a href="https://railstutorial.jp/#service">質問対応</a>、法人向け<a href="https://railstutorial.jp/training">研修支援</a>や<a href="https://railstutorial.jp/partner">協業サービス</a>も提供</p>
          </div>
          <div class="col-md-4 offset-md-2">
            <a href="https://railsguides.jp/" target="_blank" rel="noopener">
              <img class="books"
	       src="/img/logos/rails-guides.png"
	       alt="Ruby on Rails ガイド">
            </a>
	    <a href="https://railsguides.jp/" target="_blank" rel="noopener"><h4>Railsガイド</h4></a>
            <a href="https://railsguides.jp/" target="_blank" rel="noopener">
              <button class="btn btn-ruby">中級・上級者向け</button>
            </a>

            <p>プロダクト開発の生産性を高める、Ruby on Rails に特化した<span style="background-color: #AA4536; color: white; border-radius: 2px;"> 1,600 </span>ページ超えの大型リファレンスガイド。<a href="https://railsguides.jp/ebook">電子書籍</a>や<a href="https://railsguides.jp/pro">全文検索</a>、<a href="https://railsguides.jp/team">法人向けサービス</a>も提供</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="news"></div>
</section>

<article>
  <div id="main_content_wrap" class="outer container" style="margin-top: 20px;">
    <section id="main_content" class="inner row justify-content-md-center pb-5 mb-5">
      <div class="col-12 col-md-9 entry_content text-center">
	{% include recent_news.html %}
      </div>
    </section>
  </div>
</article>

<section id="services" class="service entry_content" >
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h3><a href="#services" style="color: white;">《サービス紹介》</a><br></h3>
	<h4 style="color: white;">『学び』を支える様々なサービスをご提供しています</h4>

	<div class="slides">
	  <script async class="speakerdeck-embed" data-id="6e92c58f2c664d89b10b54d6db00d750" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
	</div>

	<!--
        <div class="row mb-5">
          <div class="col-4">
            <figure id="ruby">
              <img src="/img/icons/ruby-pale.png" width="80%" alt="Ruby logo" />
               <figcaption>Ruby / Rails</figcaption>
            </figure>
          </div>
          <div class="col-4">
            <figure id="cloud">
              <img src="/img/icons/cloud-pale.png" width="80%" alt="cloud icon" />
              <figcaption>Heroku / AWS</figcaption>
            </figure>
          </div>
          <div class="col-4">
            <figure id="agile">
              <img src="/img/icons/agile-pale.png" width="80%" alt="Agile Development image" />
              <figcaption>Agile Development</figcaption>
            </figure>
          </div>
        </div>
	-->

      </div><!--//col-->
    </div><!--//row-->

   <div class="row">
      <div class="col-md-6">
        <div class="developmentSupport__more text-center">
            <a href="/ja/about" class="btn btn-primary btn-block mt-2">会社概要を見る</a>
          </div>
        </div><!--//col-->
        <div class="col-md-6">
        <div class="developmentSupport__more text-center">
            <a href="/ja/works" class="btn btn-primary btn-block mt-2">過去の実績を見る</a>
          </div>
        </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
  <div id="partners"></div>
</section>


<section class="services-for-team">
  <h2>👥 法人・チーム向けサービス</h2>
  <div class="service-business">
    <a href="https://railstutorial.jp/business" class="service-business-one" id="tutorial" target="_blank" rel="noopener">
      <img src="/img/thumbnail-tutorial-business.png" alt="Railsチュートリアル 法人プラン">
      <h3>Railsチュートリアル 法人プラン</h3>
      <ul>
        <li>社員研修で利用する方向け</li>
        <li>管理者向けの購入管理画面</li>
        <li>月額無料。980円から利用可</li>
      </ul>
      <p><b>社員研修などのチーム利用に特化</b>したサービスです。Webテキストや解説動画をチームで利用する場合に最適です。</p>
    </a>
    <a href="https://railstutorial.jp/partner" class="service-business-one" target="_blank" rel="noopener">
      <img src="/img/thumbnail-tutorial-partner.png" alt="Railsチュートリアル 協業プラン">
      <h3>Railsチュートリアル 協業プラン</h3>
      <ul>
        <li>教材として利用する方向け</li>
        <li>事業者向けダッシュボード</li>
        <li>人数に応じたライセンス料</li>
      </ul>
      <p>Railsチュートリアルを<b>教材として利用 (質問対応やメンタリング含む)</b> する方向けのライセンス契約サービスです。</p>
    </a>
    <a href="https://railsguides.jp/team" class="service-business-one" id="guides" target="_blank" rel="noopener">
      <img src="/img/thumbnail-guides-team.png" alt="Railsガイド Teamプラン">
      <h3>Railsガイド Teamプラン</h3>
      <ul>
	<li>開発チーム向け</li>
        <li>全文検索などに対応</li>
        <li>人数に応じた月額利用</li>
      </ul>
      <p>1,400ページ以上ある大型コンテンツ<b>『Railsガイド』をチームで最適に利用</b>するためのサービスです。</p>
    </a>
  </div>
</section>

  <div class="container tutorial">
    <h3><span class="emoji">🤝</span>
      利用実績・提携法人</h3>
    <div class="col-12 text-center" style="margin-top: 10px;">
      <ul class="flex-container">
        <li class="item"><a href="https://enpit.coins.tsukuba.ac.jp/"><img src="/img/partners/tukuba.png" alt="筑波大学"></a></li>
        <li class="item"><a href="/ja/news/univ-of-ryukyus-with-railstutorial"><img src="/img/partners/ryukyu.png" alt="琉球大学"></a></li>
        <li class="item"><a href="http://syllabus.sc.kogakuin.ac.jp/syllabus/daigaku/2019/1J13/3H15.html"><img src="/img/partners/kogakuin.png" alt="工学院大学"></a></li>
        <li class="item"><a href="https://aiit.ac.jp/master_program/isa/lecture/pdf/h31/3_2.pdf"><img src="/img/partners/aiit.png" alt="産業技術大学院大学"></a></li>
      </ul>

      <ul class="flex-container">
        <li class="item"><a href="/ja/news/learning-by-making"><img src="/img/partners/money-forward.png" alt="マネーフォワード"></a></li>
        <li class="item"><a href="/ja/news/railstutorial-at-members-career"><img src="/img/partners//members-career.png" alt="メンバーズキャリア"></a></li>
        <li class="item"><a href="https://yasslab.jp/ja/news/partnership-with-nilquebe"><img src="/img/partners/nilquebe_rect.png" alt="Nilquebe"></a></li>
        <li class="item"><a href="/ja/news/partnership-with-techtraining"><img src="/img/partners/techtraining.png" alt="TechCommit"></a></li>
      </ul>

      <ul class="flex-container">
        <li class="item"><a href="/ja/news/partnership-with-haj-empowerment"><img src="/img/partners/haj.png" alt="ジョブキタ"></a></li>
        <li class="item"><a href="https://prtimes.jp/main/html/rd/p/000000036.000015015.html"><img src="/img/partners/progate.png" alt="Progate"></a></li>
        <li class="item"><a href="https://note.com/yasslab/n/n8383778e38a3"><img src="/img/partners/sharewis.png" alt="ShareWis"></a></li>
        <li class="item"><a href="https://prtimes.jp/main/html/rd/p/000000004.000021148.html"><img src="/img/partners/potepan.png" alt="ポテパンキャンプ"></a></li>
      </ul>

      <ul class="flex-container">
        <li class="item"><img src="/img/partners/empty.png" alt="Empty Space"></li>
        <li class="item"><a href="/ja/news/partnership-with-codebase"><img src="/img/partners/codebase.jpg" alt="CODE BASE"></a></li>
        <li class="item"><a href="https://www.osakac.ac.jp/project_now/cs/208"><img src="/img/partners/osakac.png" alt="大阪電気通信大学"></a></li>
        <li class="item"><img src="/img/partners/empty.png" alt="Empty Space"></li>
      </ul>

      <div class="tutorial">
        <a href="https://railstutorial.jp/partner">
          <button class="btn btn-ruby btn-padding external-link">詳細を見る</button>
        </a>
      </div>
    </div>
  </div>

<section class="aboutVisual entry_content" id="members">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><a href="#members">沖縄
		×
		東京</a></h2>
        <p class="text-md-center h5">YassLab 社はソフトウェアエンジニアのリモートチームです。<br class="ignore-sp">フルタイム・パートタイム・複業、様々な関わり方があります。</p>
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>


<section class="members" id="members" style="margin-top: 50px;">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h3><a href="#members"><span class="emoji">🏢</span>
	  メンバー紹介</a></h3>
        <div class="row">
          {% include member.html username='himajin315' link_to='twitter'
             caption='プロの手相占い師兼エンジニア。<a href="https://ie.u-ryukyu.ac.jp/enpit/">enPiT</a>講師' %}
          {% include member.html username='nanophate'  link_to='twitter'
             caption='<a href="https://sechack365.nict.go.jp/">SecHack365</a> 採択者。バイリンガル、写真家' %}

	  {% comment %}
	  {% include member.html username='AnaTofuZ'   link_to='twitter'
             caption='Perlが好きなエンジニア。<a href="https://ie.u-ryukyu.ac.jp/%E5%AD%A6%E7%A7%91%E7%B4%B9%E4%BB%8B/%E7%A0%94%E7%A9%B6%E5%AE%A4%E7%B4%B9%E4%BB%8B/%E4%B8%A6%E5%88%97%E7%A0%94%E7%A9%B6%E5%AE%A4%EF%BC%88%E6%B2%B3%E9%87%8E%E7%A0%94%EF%BC%89/">並列研 (河野研)</a>' %}
          {% include member.html username='aokabin_' link_to='twitter' offset='offset-md-4'
          caption='<a href="https://www.ryukyu-frogs.com/">Ryukyufrogs</a>5期生のエンジニア。沖縄高専卒' %}
	  {% endcomment %}


	  {% include member.html username='yasulab'   link_to='twitter'
	  caption='IPA認定<a href="https://www.ipa.go.jp/jinzai/mitou/kinkyou/creator.html">未踏スーパークリエータ</a>。代表取締役' %}
	  {% include member.html username='hachi8833' link_to='twitter'
	  caption='<a href="https://techracho.bpsinc.jp/">TechRacho</a>ライター。翻訳家、Go言語が好き' %}

	  {% include member.html username='crafter_gene' link_to='twitter'
	  caption='品質管理が得意。趣味は広くそこそこ深く' %}
	  {% include member.html username='Yuppyhappytoyou' link_to='twitter'
	  caption='楽しいこと大好き✌️
	  エンジニアママ😚 ' %}

	  {% include member.html username='megane9988' link_to='twitter'
	  caption='(株) mgn代表。Team LENS。LT職人' %}
	  {% include member.html username='shoko_webdesign' link_to='twitter'
	  caption='専門学校講師。Team LENS。Webデザイナー' %}
    {% include member.html username='YukiMihashi' link_to='twitter'
	  caption='Webデザイナー' %}

	  {% comment %}
	  {% include member.html username='nalabjp'   link_to='twitter' offset='offset-md-2'
	  caption='Railsエンジニア。スノーボードと沖縄が好き' %}

	  {% include member.html username='shishi4tw' link_to='twitter'
	  caption='プログラマー。 <a href="https://twitter.com/hashtag/shinjukurb">Shinjuku.rb</a> 発起人' %}
	  {% endcomment %}

        </div>
	<div class="text-center pt-5" style="margin: 30px 0;">
          <a href="/ja/join-forces" class="btn btn-primary">
	    採用情報を見る
	  </a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="sns">
  <div class="container">
    <div class="row gutter-10">
      <div class="col-6">
        <div class="card card__qiita">
          <div class="card__icon">
            <a href="https://qiita.com/organizations/yasslab"><img src="/img/logos/qiita.png" alt="YassLab organization in Qiita"></a>
          </div>
          <dl class="row">
            <dt class="col-md-6">投稿数</dt>
            <dd class="col-md-6">{% qiita_stats items %}</dd>
            <dt class="col-md-6">いいね</dt>
            <dd class="col-md-6">{% qiita_stats likes %}</dd>
          </dl>
        </div>
      </div>
      <div class="col-6">
        <div class="card card__github">
          <div class="card__icon">
            <a href="https://github.com/yasslab"><img src="/img/logos/github.png" alt="Yasslab organization in GitHub"></a>
          </div>
          <dl class="row">
            <dt class="col-md-6">リポジトリ数</dt>
            <dd id="github__repositories" class="col-md-6">{% github_stats repos %}</dd>
            <dt class="col-md-6">スター数</dt>
            <dd id="github__stars" class="col-md-6">{% github_stats stars %}</dd>
          </dl>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="community entry_content" id="community">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><a href="#community" style="color: white;">
	  <span class="emoji">💎</span>
	  コミュニティ活動</a></h2>
        <p class="text-md-center">YassLab 社ではコミュニティを Hub とした様々な繋がりを大切にしています。<br class="ignore-sp">コミュニティの一員として、継続的にできることを積極的に提案します。</p>
        <div class="row">
          <div class="col-md-4">
	    <figure>
              <a href="https://jr.mitou.org/" target="_blank" rel="noopener">
                <img src="/img/logos/mitoujr.png" alt="未踏ジュニア - 独創的アイデアと卓越した技術を持つ
小中高生クリエイター支援プログラム">
              </a>
              <figcaption><a href="https://jr.mitou.org/#sponsors">Webサービス開発教材の提供</a></figcaption>
            </figure>
	    <!--
            <figure>
              <a href="https://ruby.okinawa/" target="_blank" rel="noopener">
                <img src="/img/logos/okinawarb.gif" alt="Okinawa Ruby User Group">
              </a>
              <figcaption><a href="https://ruby.okinawa/okrk02/">沖縄Ruby会議などの運営支援</a></figcaption>
            </figure>
	    -->
          </div>
          <div class="col-md-4">
            <figure>
              <a href="/ja/doorkeeper/">
                <img src="/img/logos/doorkeeper.gif" alt="Doorkeeper スポンサーシップ">
              </a>
              <figcaption><a href="/ja/doorkeeper/">イベント管理サービス代の補助</a></figcaption>
            </figure>
          </div>
          <div class="col-md-4">
            <figure>
              <a href="/ja/about/#culture" target="_blank" rel="noopener">
                <img src="/img/logos/coderdojo-japan.gif" alt="CoderDojo Japan - 子どものためのプログラミング道場">
              </a>
              <figcaption><a href="/ja/agile">Webサービスの開発支援</a></figcaption>
            </figure>
          </div>
        </div>

	<!--
	<div class="text-center pt-5">
          <a href="/ja/about">
            <button class="btn btn-primary">会社概要を見る</button>
          </a>
        </div>
	-->

      </div>
    </div>
  </div>
</section>

<!--
<section class="partner">
  <div class="container">
    <div class="row">
      <div class="col-4">
        <a href="https://jr.mitou.org/" target="_blank" rel="noopener">
          <img src="/img/logos/mitoujr.png" alt="未踏ジュニア">
        </a>
      </div>
      <div class="col-4">
        <a href="https://franliber.co.jp/" target="_blank" rel="noopener">
          <img src="/img/logos/franliber.png" alt="FranLiber" class="bd-bk">
        </a>
      </div>
      <div class="col-4">
        <a href="https://railscp.com/" target="_blank" rel="noopener">
          <img src="/img/logos/railscp.png" alt="（社）Rails技術者認定試験運営委員会" class="bd-bk">
        </a>
      </div>
    </div>
  </div>
</section>
-->

<section class="press" id="press">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><a href="#press">
	  <span class="emoji">📜</span>
	  プレスリリース</a></h2>
        <ul>
	  <li><a href="https://prtimes.jp/main/html/rd/p/000000002.000057664.html" target="_blank" rel="noopener">就職直結型プログラミングスクール「RUNTEQ」、Railsチュートリアルを運営する YassLab 社と業務提携し、さらなるWebエンジニアの拡大を促進へ</a></li>
	  <li><a href="https://prtimes.jp/main/html/rd/p/000000055.000004979.html" target="_blank" rel="noopener">シェアウィズ、Ruby on Rails 6.0に対応したRailsチュートリアル解説動画の質問対応版を提供開始</a></li>
	  <li><a href="https://prtimes.jp/main/html/rd/p/000000005.000043589.html" target="_blank" rel="noopener">コミュニティ型IT学習環境の「TechCommit」、Railsチュートリアルと業務提携でITエンジニアの創出促進へ</a></li>
          <li><a href="https://www.members.co.jp/company/news/2018/0806_2.html" target="_blank" rel="noopener">常駐型デジタルプロフェッショナルサービスのメンバーズキャリア、技術顧問体制を強化～新たに2名が技術顧問に就任、社員育成によるサービス向上を目指す～</a></li>
          <li><a href="https://prtimes.jp/main/html/rd/p/000000036.000015015.html" target="_blank" rel="noopener">オンラインプログラミング学習のProgateが「Ruby on Rails チュートリアル」のコンテンツ提供でYassLabと提携</a> </li>
          <li><a href="https://prtimes.jp/main/html/rd/p/000000004.000021148.html" target="_blank" rel="noopener">転職特化型Rubyプログラミングスクールの「ポテパンキャンプ」、Railsチュートリアルと業務提携しエンジニア創出を促す</a></li>
          <li><a href="https://prtimes.jp/main/html/rd/p/000000013.000016641.html" target="_blank" rel="noopener">プログラミングスクールの「DIVE INTO CODE」、Railsチュートリアルと公式提携した「DIC Railsチュートリアルコース」を発表</a></li>
        </ul>

      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>

<div id="contact"></div>
