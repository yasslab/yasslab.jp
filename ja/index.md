---
layout: plain_without_thumbnail
---

<section class="mainVisual">
  <div class="jumbotron">
    <picture>
      <!--<source media="(max-width: 600px)" srcset="/img/cover-photo-mobile.jpg">-->
      <img src="/img/cover-photo.min.jpg" data-src="/img/cover-photo.jpg" width="100%"
       alt="{{ site.company.vision }}" class="lazyload" loading="lazy">
    </picture>

    <div class="logo-catch">
      <!-- <img src="/img/spinner.svg" data-src="/img/icons/yasslab.svg" width="270" alt="YassLab Logo" class="lazyload" loading="lazy"> -->
      <h1>{{ site.company.vision }}</h1>
    </div>
  </div>
</section>

<section class="catchCopy entry_content" id="vision">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h3><a href="#vision">誰もがプロダクトを創り、<br class="ignore-pc">磨き、語れる時代に。</a></h3>
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
        <img class="books lazyload" src="/img/spinner.svg" data-src="/img/logos/rails-tutorial.png"
               alt="Ruby on Rails チュートリアル" loading="lazy"></a>
        <a href="https://railstutorial.jp/" target="_blank" rel="noopener">
    <h4>Railsチュートリアル</h4></a>
            <a href="https://railstutorial.jp/" target="_blank" rel="noopener">
              <button class="btn btn-ruby">初級・中級者向け</button>
            </a>
            <p>SNS 開発が題材の大型チュートリアル。プロダクト開発の<span style="background-color: #AA4536; color: white; border-radius: 2px;">
        0→1
      </span>を創りながら学びます。<a href="https://railstutorial.jp/screencast">解説動画</a>や<a href="https://railstutorial.jp/#service">質問対応</a>、法人向け<a href="https://railstutorial.jp/business">研修支援</a>や<a href="https://railstutorial.jp/partner">教材連携</a>サービスも提供</p>
          </div>
          <div class="col-md-4 offset-md-2">
            <a href="https://railsguides.jp/" target="_blank" rel="noopener">
              <img class="books lazyload" src="/img/spinner.svg" data-src="/img/logos/rails-guides.png"
         alt="Ruby on Rails ガイド" loading="lazy">
            </a>
      <a href="https://railsguides.jp/" target="_blank" rel="noopener"><h4>Railsガイド</h4></a>
            <a href="https://railsguides.jp/" target="_blank" rel="noopener">
              <button class="btn btn-ruby">中級・上級者向け</button>
            </a>

            <p>プロダクト開発の生産性を高める、Ruby on Rails に特化した<span style="background-color: #AA4536; color: white; border-radius: 2px;"> 1,400 </span>ページ超えの大型リファレンスガイド。<a href="https://railsguides.jp/ebook">電子書籍</a>や<a href="https://railsguides.jp/pro">全文検索</a>、<a href="https://railsguides.jp/team">法人向けサービス</a>も提供</p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div></div>
</section>

<section id="news">
  <div id="main_content_wrap" class="outer container" style="margin-top: 20px;">
    <section id="main_content" class="inner row justify-content-md-center pb-5 mb-5">
      <div class="col-12 col-md-9 entry_content text-center">
        {% include recent_news.html %}
      </div>
    </section>
  </div>
</section>

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
              <img src="/img/spinner.svg" data-src="/img/icons/ruby-pale.png" width="80%" alt="Ruby logo"
              class="lazyload" loading="lazy" />
              <figcaption>Ruby / Rails</figcaption>
            </figure>
          </div>
          <div class="col-4">
            <figure id="cloud">
              <img src="/img/spinner.svg" data-src="/img/icons/cloud-pale.png" width="80%"
             alt="cloud icon" class="lazyload" loading="lazy" />
              <figcaption>Heroku / AWS</figcaption>
            </figure>
          </div>
          <div class="col-4">
            <figure id="agile">
              <img src="/img/spinner.svg" data-src="/img/icons/agile-pale.png" width="80%"
             alt="Agile Development image" class="lazyload" loading="lazy" />
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
          <a href="/ja/works" class="btn btn-primary btn-block mt-2">活動実績を見る</a>
	</div>
      </div><!--//col-->
      <!--
      <div class="col-md-4">
	<div class="developmentSupport__more text-center">
          <a href="https://railstutorial.jp/business" class="btn btn-primary btn-block mt-2" target='_blank' rel='noopener'>導入相談を見る</a>
	</div>
      </div>--> <!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>

{% include services_for_team.html    %}
{% include partners_and_clients.html %}

<section class="aboutVisual entry_content" id="remote-team">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><a href="#remote-team">
    リモート
    ×
    チーム</a></h2>
        <p class="text-md-center h5">YassLab 社はフルリモートでプロダクトを開発するチームです。<br class="ignore-sp">フルタイム・パートタイム・複業、様々な関わり方があります。</p>
      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>

<section id="members" class="members" style="margin-top: 50px;">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h3><a href="#members"><i class="fad fa-user-friends"></i> 
    メンバー紹介</a></h3>
        <div class="row">
          {% include member.html username='himajin315' link_to='twitter'
             caption='プロの手相占い師兼エンジニア。<a href="https://ie.u-ryukyu.ac.jp/enpit/">enPiT</a>講師' %}
          {% include member.html username='nanophate'  link_to='twitter'
             caption='<a href="https://sechack365.nict.go.jp/">SecHack365</a> 採択者。バイリンガル、写真家' %}

	  {% include member.html username='yasulab'   link_to='twitter'
	     caption='IPA認定<a href="https://www.ipa.go.jp/jinzai/mitou/kinkyou/creator.html">未踏スーパークリエータ</a>。代表取締役' %}
	  {% include member.html username='hachi8833' link_to='twitter'
	     caption='<a href="https://techracho.bpsinc.jp/">TechRacho</a>ライター。翻訳家、Go言語が好き' %}

	  {% include member.html username='Yuppyhappytoyou' link_to='twitter'
	     caption='楽しいこと大好き✌️ エンジニアママ😚 ' %}
	  {% include member.html username='rakudaSanDesu' link_to='twitter'
	     caption='エンジニアとして歩き始めたらくだ🐫' offset='' %}

	  <!--
	  {% include member.html username='YukiMihashi' link_to='twitter'
	     caption='Webデザイナー。お絵かきとCSSが好き' %}
	  {% include member.html username='shishi4tw' link_to='twitter' offset=''
	     caption='プログラマー。<a href="https://twitter.com/shinjukurb">Shinjuku.rb</a> ファウンダー' %}
	  {% include member.html username='crafter_gene' link_to='twitter'
	     caption='品質管理が得意。趣味は広くそこそこ深く' offset='' %}
	  {% include member.html username='megane9988' link_to='twitter'
	     caption='(株) mgn代表。Team LENS。LT職人' %}
	  {% include member.html username='shoko_webdesign' link_to='twitter'
	     caption='専門学校講師。Team LENS。Webデザイナー' %}
	  -->

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

<section class="sns" id="stats">
  <div class="container">
    <div class="row gutter-10">
      <div class="col-6">
        <div class="card card__qiita">
          <div class="card__icon">
            <a href="https://qiita.com/organizations/yasslab"><img src="/img/spinner.svg" data-src="/img/logos/qiita.png" alt="YassLab organization in Qiita" class="lazyload" loading="lazy"></a>
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
            <a href="https://github.com/yasslab"><img src="/img/spinner.svg" data-src="/img/logos/github.png" alt="Yasslab organization in GitHub" class="lazyload" loading="lazy"></a>
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
	  <i class="fas fa-gem"></i> コミュニティ活動</a></h2>
        <p class="text-md-center">YassLab 社ではコミュニティを Hub とした様々な繋がりを大切にしています。<br class="ignore-sp">コミュニティの一員として、継続的にできることを積極的に提案します。</p>
        <div class="row">
          <div class="col-md-4">
	    <figure>
              <a href="https://jr.mitou.org/" target="_blank" rel="noopener">
                <img src="/img/spinner.svg" data-src="/img/logos/mitoujr.png" alt="未踏ジュニア - 独創的アイデアと卓越した技術を持つ小中高生クリエイター支援プログラム" class="lazyload" loading="lazy">
              </a>
              <figcaption><a href="https://jr.mitou.org/#sponsors">Webサービス開発教材の提供</a></figcaption>
            </figure>
	    
	    <!--
            <figure>
              <a href="https://ruby.okinawa/" target="_blank" rel="noopener">
                <img src="/img/spinner.svg" data-src="/img/logos/okinawarb.gif"
         alt="Okinawa Ruby User Group" class="lazyload" loading="lazy">
              </a>
              <figcaption><a href="https://ruby.okinawa/okrk02/">沖縄Ruby会議などの運営支援</a></figcaption>
            </figure>
	    -->
          </div>
          <div class="col-md-4">
            <figure>
              <a href="/ja/doorkeeper/">
                <img src="/img/spinner.svg" data-src="/img/logos/doorkeeper.png"
         alt="Doorkeeper スポンサーシップ" class="lazyload" loading="lazy">
              </a>
              <figcaption><a href="/ja/doorkeeper/">イベント管理サービス代の補助</a></figcaption>
            </figure>
          </div>
          <div class="col-md-4">
            <figure>
              <a href="/ja/about/#culture" target="_blank" rel="noopener">
                <img src="/img/spinner.svg" data-src="/img/logos/coderdojo-japan.gif"
         alt="CoderDojo Japan - 子どものためのプログラミング道場"
         class="lazyload" loading="lazy">
              </a>
              <figcaption><a href="/ja/about/#culture">Webサービスの開発支援</a></figcaption>
            </figure>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>

<section class="press" id="press">
  <div class="container">
    <div class="row">
      <div class="col-12">
        <h2><a href="#press">
	  <i class="fad fa-rocket"></i> プレスリリース</a></h2>
	<ul>
	  {% for press in site.data.press  %}
	  <li><a href="{{ press.url }}" target="_blank" rel="noopener">{{ press.title }}</a></li>
	  {% endfor %}
	</ul>

      </div><!--//col-->
    </div><!--//row-->
  </div><!--//container-->
</section>

<div id="contact"></div>
