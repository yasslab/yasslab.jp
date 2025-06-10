---
layout: plain_without_thumbnail
---

<section class="mainVisual">
  <div class="jumbotron">
    <picture>
      <!--<source media="(max-width: 600px)" srcset="/img/cover-photo-mobile.jpg">-->
      <img src="/img/cover-photo.min.webp" data-src="/img/cover-photo.webp" width="100%"
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
        <h3><a href="#vision">誰もが創り、語れる時代に</a></h3>
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
        <img class="books lazyload" src="/img/spinner.svg" data-src="/img/logos/rails-tutorial.webp"
               alt="Ruby on Rails チュートリアル" loading="lazy"></a>
        <a href="https://railstutorial.jp/" target="_blank" rel="noopener">
    <h4>Railsチュートリアル</h4></a>
            <a href="https://railstutorial.jp/" target="_blank" rel="noopener">
              <button class="btn btn-ruby">初級・中級者向け</button>
            </a>
            <p>SNS 開発が題材の大型チュートリアル。プロダクト開発の<span style="background-color: #AA4536; color: white; border-radius: 2px;">
              0→1
	    </span>を創りながら学びます。<a href="https://railstutorial.jp/screencast">解説動画</a>や<a href="https://railstutorial.jp/ebook">電子書籍</a>、法人向け<a href="https://railstutorial.jp/business">研修支援</a>や<a href="https://railstutorial.jp/partner">教材連携</a>サービスも提供</p>
          </div>
          <div class="col-md-4 offset-md-2">
            <a href="https://railsguides.jp/" target="_blank" rel="noopener">
              <img class="books lazyload" src="/img/spinner.svg" data-src="/img/logos/rails-guides.webp"
         alt="Ruby on Rails ガイド" loading="lazy">
            </a>
      <a href="https://railsguides.jp/" target="_blank" rel="noopener"><h4>Railsガイド</h4></a>
            <a href="https://railsguides.jp/" target="_blank" rel="noopener">
              <button class="btn btn-ruby">中級・上級者向け</button>
            </a>

            <p>プロダクト開発の生産性を高める、Ruby on Rails に特化した<span style="background-color: #AA4536; color: white; border-radius: 2px;"> 1,600 </span>ページ超えの大型リファレンスガイド。<a href="https://railsguides.jp/ebook">電子書籍</a>や<a href="https://railsguides.jp/pro">全文検索</a>、法人向け<a href="https://railsguides.jp/sponsors">協賛プラン</a>も提供</p>
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
{% include clients_and_partners.html %}

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
	  {% for member in site.data.members %}
	  <div class="col-6 col-md-4 {{ member.add_style }}">
	    <div class="card cardMember">
	      <div class="cardMember__thumbnail">
		<img src="/img/spinner.svg" data-src="/img/photos/{{ member.username }}.webp"
		     alt="{{ member.username }}" class="rounded-circle lazyload">
	      </div>
	      <div class="cardMember__content">
		<span style='font-size: smaller;'>
		  <a href="{% if member.link_to %}{{ member.link_to }}{% else %}https://x.com/{{ member.username }}{% endif %}"
		   class="cardMember__account" target="_blank">@{{ member.username }}</a></span>
		<p class="cardMember_summary" style='margin-top: 10px;'>{{ member.profile_ja | markdownify }}</p>
	      </div>
	    </div>
	  </div>
	  {% endfor %}
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
                <img src="/img/spinner.svg" data-src="/img/logos/mitoujr.webp" alt="未踏ジュニア - 独創的アイデアと卓越した技術を持つ小中高生クリエイター支援プログラム" class="lazyload" loading="lazy">
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
                <img src="/img/spinner.svg" data-src="/img/logos/doorkeeper.webp"
         alt="Doorkeeper スポンサーシップ" class="lazyload" loading="lazy">
              </a>
              <figcaption><a href="/ja/doorkeeper/">イベント管理サービス代の補助</a></figcaption>
            </figure>
          </div>
          <div class="col-md-4">
            <figure>
              <a href="/ja/about/#culture" target="_blank" rel="noopener">
                <img src="/img/spinner.svg" data-src="/img/logos/coderdojo-japan.webp"
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
