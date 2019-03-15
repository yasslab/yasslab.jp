---
layout: post
title:  DojoCast を Jekyll から Rails に移行しました 🚜💨
thumbnail: dojocast-cover.jpg
author: 安川 要平
categories: [Blog]
tags: [CoderDojo, Jekyll, Rails]
permalink: /ja/posts/migrate-dojocast-from-jekyll-to-rails
---

[Okinawa.rb Advent Calendar 2018](https://qiita.com/advent-calendar/2018/okinawarb) 25日目の記事です。

2018年12月に僕が司会を務めるポッドキャスト「DojoCast」の英語収録を行ったところ、海外でも聴いてくれている人がいるようで嬉しいです ;)

YassLab 社には「トライ」という[「まずはやってみようよ!」という文化](/ja/join-forces#flow)がありますが、僕自身も新しいことにチャレンジするのは好きだし、遊びながら学んだ方が (少なくとも僕は) 楽しいと感じるので常にそうできるよう心がけています 😆

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">How wonderful to hear from our co-founder James <a href="https://twitter.com/Whelton?ref_src=twsrc%5Etfw">@Whelton</a> who spoke to the brilliant <a href="https://twitter.com/CoderDojoJapan?ref_src=twsrc%5Etfw">@CoderDojoJapan</a>  podcast <a href="https://twitter.com/hashtag/DojoCast?src=hash&amp;ref_src=twsrc%5Etfw">#DojoCast</a>.<br><br>Give it a listen from 1.35 (for english speakers)! <a href="https://t.co/dGcYZOcHMP">https://t.co/dGcYZOcHMP</a> <a href="https://t.co/wpjBOVJrVJ">pic.twitter.com/wpjBOVJrVJ</a></p>&mdash; ☯CoderDojo☯ (@CoderDojo) <a href="https://twitter.com/CoderDojo/status/1075677404419506176?ref_src=twsrc%5Etfw">December 20, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>

<div style="text-align: center">
<img alt="DojoCast - Highlight people around CoderDojo communities by Podcast" src="/img/dojocast-cover.jpg" />
<a href="https://coderdojo.jp/podcasts/10](https://coderdojo.jp/podcasts/10">DojoCast #10 - Programming is Beyond a Job For Me</a>
<br><br>
</div>


さて、DojoCast や英語収録の内容については上記リンクから聴いていただくこととして、本記事ではこの収録を公開するために裏側で色々と動いていたので、今回はその技術的な背景と実装したことを軽くまとめておきますね。

*NOTE: YassLab 社と CoderDojo Japan との関係性については[前回の記事](https://yasslab.jp/ja/posts/coderdojo-japan-2018)をご参照ください。*

<br>

## 移行の技術的な背景

DojoCast も「まずはやってみるか🤔」という気持ちで始めたプロジェクトの１つですが、当初は「どういった層が聞くのか」「そもそも価値はあるのか」などが分からなかったので、当初は必要最低限の機能を [GitHub Pages](https://pages.github.com/) (Jekyll) で雑に実装し、dojocast.coderdojo.jp というドメインから公開していました。

<div style="text-align: center">
  <script async class="speakerdeck-embed" data-slide="2" data-id="8e6dae291abd4dc3ad36ca779c0e106e" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
  <a href="https://github.com/coderdojo-japan/dojocast">[Outdated] github.com/coderdojo-japan/dojocast 📻✨   </a>
  <br><br>
</div>

実際にやってみるとメンターやチャンピオンを中心に聴きたい人や、CoderDojo コミュニティ同士の知見の共有、[パートナー企業のPR](https://coderdojo.jp/podcasts/6)に繋がったりと、色々な場面で価値を感じることがありました。

「価値があるならもうちょっと頑張ってみるか」と思う一方で、当時の技術スタックでは次のような課題もありました。

- モバイルアプリから購読できるようにするために [RSS を実装したい](https://github.com/coderdojo-japan/coderdojo.jp/issues/363)
- 音声ファイルは Amazon S3 などの適切な外部サービスに置きたい
- Jekyll でも出来るけど辛そう (だし[個別に SSL 対応](https://qiita.com/yasulab/items/792dc0048bbd0b5ca96e)するのもなぁ...🤔💭)

もちろんいずれの課題も手動でやれば解決できますが、リソースは有限で出来る事も限られているので、やればやるほど楽になっていくようなカタチを目指していきたいです。そこで考えたのが、Rails 製の [coderdojo.jp](https://coderdojo.jp/) に DojoCast の機能を移行するプロジェクトです。

CoderDojo Japan official website integrated with Cloud-based Rails CMS   
[https://github.com/coderdojo-japan/coderdojo.jp](https://github.com/coderdojo-japan/coderdojo.jp)

Rubyのエコシステムは巨大なので、上記のような課題を解決するためのライブラリも豊富です。また、coderdojo.jp は既に SSL 対応済みなので、[Jekyll で SSL 周りに対応する必要](https://qiita.com/yasulab/items/d900bb47bf73beada855)も無くなります。

<br>

## 移行作業

上記の背景のもと、実際に行った作業が次のPRです。

<div style="text-align: center">
  <img alt="Migration PR" src="/img/migration-pr.png" />
  <a href="https://github.com/coderdojo-japan/coderdojo.jp/pull/362">Migrate DojoCast to coderdojo.jp #362 - GitHub</a>
  <br><br>
</div>

具体的には上記PRで次のような作業を行っています。

- Markdown を描画する仕組みの再利用
- 各エピソードを扱うモデルを作成
- 各エピソードのファイル移行・一部更新
- 新エピソードの編集・公開
- デザイン改善、ナビゲーションの設置など

CoderDojo Japan には既に Markdown を描画する仕組み ([Docs](https://coderdojo.jp/docs)) とデザイン ([Keiyaku CSS](https://cognitom.github.io/keiyaku-css/)) があるので、基本的には既存の仕組みを再利用しながら簡単に実装することができました。

仕組みを再利用しているので共通化できる部分もいくつかあるのですが、ひとまず新エピソードを公開したいという目論見があったので、現時点ではリファクタリングは後回しにしています。というのも、冒頭で共有したツイートですが、実はそのツイートの数日前に [CoderDojo Foundation の人達](https://coderdojo.com/foundation/)とミーティングする機会があって、そこで直接共有したから紹介してもらえたという背景があるからです (言い換えるとその日までに公開できる状態まで持っていきたかった)。

結果としてはうまく [@CoderDojo アカウントからも共有](https://twitter.com/CoderDojo/status/1075677404419506176)してもらえたので、移行作業に取り掛かるタイミング・優先順位の付け方としては良かったかなと考えています ☺️

[![Screenshot of Episode 10](/img/dojocast-ss.png)](https://coderdojo.jp/podcasts/10)

<br>

## 次にやりたいこと

上記の PR で無事に Jekyll から Rails に移行できたので、あとは大体なんでもできそうです 🤔💭 個人的には iTunes Store に登録したいなぁという気持ちもあるので、そのために必要な仕様と実装も調べてみようかなとは考えています。

DojoCastのRSSフィードを実装してiTunesから購読できるようにする #363   
[https://github.com/coderdojo-japan/coderdojo.jp/issues/363](https://github.com/coderdojo-japan/coderdojo.jp/issues/363)

[Railsチュートリアル](https://railstutorial.jp/)や[Railsガイド](https://railsguides.jp/)もそうですが、最初は少人数で始めた開発プロジェクトが少しずつ大きくなっていくのは楽しいですね 📈✨ coderdojo.jp も最初は一人で始めた小さいプロジェクトでしたが、年々より多くの人たちに利用されるようになってきています。

<div style="text-align: center">
  <script async class="speakerdeck-embed" data-slide="44" data-id="0150cf89a4d94bc7ab41c14b851de0bc" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
  <a href="https://speakerdeck.com/yasulab/case-study-rails-cms-for-coderdojo">CoderDojo を支える Rails CMS の活用事例</a>
  <br><br>
</div>

今回実装した Podcast 機能に限らず、やるべき方針を見定め、今後も coderdojo.jp でできることがあれば少しずつ改善していきたいと思います。ただし[次にやるべきことが常に開発であるとは限らない](https://yasslab.jp/ja/posts/coderdojo-japan-2018)ので、開発だけでなく、「CoderDojo コミュニティにとって役立つことは何なのか」から考えて、そこから効果的なアクションを模索・実行していきたいなと考えています。

<br>

### 開発視点から見る次のアクション<br><br>

次のアクションはまだ決めていませんし、上述の通り開発が常に最優先になるとは限らないのですが、「もし開発に絞ったとするとどんなアクションがありうるか」について、執筆時点での状況を最後にまとめておきますね ;)

最近は自社で[Railsチュートリアル法人プラン](https://railstutorial.jp/business)を始めたこともあり、決済周りの知見が増えてきているので、例えば CoderDojo 専用の決済サービスなんかも実装できたりするのかもなぁとは考えています。他にも、メンテナンスしやすい状態にするために現在運用されている [DojoPaaS を node から Ruby に移行するプロジェクト](https://github.com/coderdojo-japan/dojopaas/issues/110)とか、[直近のイベント情報を表示する仕組み](https://github.com/coderdojo-japan/coderdojo.jp/pull/297)なんかも少しずつですが動いていたりします。

DojoPaaS のコードを node から Ruby に移植したい #110   
[https://github.com/coderdojo-japan/dojopaas/issues/110](https://github.com/coderdojo-japan/dojopaas/issues/110)

直近のイベント情報を集計するtaskの追加 #297   
[https://github.com/coderdojo-japan/coderdojo.jp/pull/297](https://github.com/coderdojo-japan/coderdojo.jp/pull/297)

いずれのプロジェクトも PR/Issue などでまとめているので、もし興味あれば気軽に覗いてみてください 📜👀✨

上記の他にも、もし「coderdojo.jp でこんなことやってみたい」「こういうアプリ作ろうと思いますがどうですか?」などのご相談があれば [@yasulab](https://twitter.com/yasulab) までお気軽にご連絡ください 📧✨ 開発環境に関するドキュメントは [GitHub の README](https://github.com/coderdojo-japan/coderdojo.jp) から公開していて、[開発目線で見たソースコードの動き](https://yasslab.jp/ja/posts/coderdojo-japan-2018)も１年単位で記事にしているので、開発に関する情報のキャッチアップはしやすい状況になっているかなとは思います ☺️

それでは、よいお年を！   
Happy Coding ;)

