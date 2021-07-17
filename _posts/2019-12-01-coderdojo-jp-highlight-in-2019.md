---
layout: post
title:  ☯️ 2019年の coderdojo.jp 開発ハイライト
thumbnail: coderdojo-japan.png
author: yasulab
categories: [blog]
tags: [CoderDojo, Rails]
---

おはようございます！😎☀️✨ [Railsチュートリアル](https://railstutorial.jp/)や[Railsガイド](https://railsguides.jp/)を運営している YassLab 株式会社の安川です。YassLab 社では [coderdojo.jp](https://coderdojo.jp/) というサイトの運営・開発も担っているのですが、毎年12月頃に１年のふりかえりをしています。

- [☯️ 開発目線で見る最近の CoderDojo Japan 2018](https://yasslab.jp/ja/news/CoderDojo-Japan-2018)
- [☯️ CoderDojo Japan の各種機能と実装について【2017年版】](https://qiita.com/yasulab/items/1d12e6b295c0a9e577f1)
- [☯️ CoderDojo Japan のバックエンドを更新しました 【2016年版】](https://coderdojo.jp/news/2016/12/12/new-backend)

2018年から少しアプローチを変えて**スクリーンキャスト風に GitHub 上の[コミットログ](https://github.com/coderdojo-japan/coderdojo.jp/commits/main)や[開発背景](https://github.com/coderdojo-japan/coderdojo.jp/pulls?utf8=%E2%9C%93&q=is%3Aclosed+)などを説明**してみたのですが、これが中々面白かったので、今回も動画を使って**開発の裏側にあるアレコレ**をまとめてみました 👀💭✨

動画もなるべく小分けして、説明している内容や詳細へのリンクも箇条書きでまとめておいたので、興味あるトピックから気軽に眺めてみていただければ 😉💖


## 🔰 0. はじめに
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/UVe1d0T9HpA?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- Web: [https://coderdojo.jp/](https://coderdojo.jp/)
- GitHub: [coderdojo-japan/coderdojo.jp](https://github.com/coderdojo-japan/coderdojo.jp)
- Pull Requests: [coderdojo.jp/pulls?q=is%3Apr+is%3Aclosed](https://github.com/coderdojo-japan/coderdojo.jp/pulls?q=is%3Apr+is%3Aclosed)


## 🎧 1. [DojoCast](https://coderdojo.jp/podcasts) の公式アプリ対応
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/xLb34e1UaWw?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [RSSフィード作成 by odlovesq · Pull Request #387](https://github.com/coderdojo-japan/coderdojo.jp/pull/387)
- [mp3 ファイルを SoundCloud に移行する by chicaco · Pull Request #431](https://github.com/coderdojo-japan/coderdojo.jp/pull/431)

<div id='ibb-widget-root-1458122473'></div><script>(function(t,e,i,d){var o=t.getElementById(i),n=t.createElement(e);o.style.height=250;o.style.width=300;o.style.display='inline-block';n.id='ibb-widget',n.setAttribute('src',('https:'===t.location.protocol?'https://':'http://')+d),n.setAttribute('width','300'),n.setAttribute('height','250'),n.setAttribute('frameborder','0'),n.setAttribute('scrolling','no'),o.appendChild(n)})(document,'iframe','ibb-widget-root-1458122473',"banners.itunes.apple.com/banner.html?partnerId=&aId=&bt=catalog&t=catalog_white&id=1458122473&c=jp&l=ja-JP&w=300&h=250&store=podcast");</script>

## 🔍 2. [CoderDojo Kata](https://coderdojo.jp/kata) に検索機能
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/b7IBC23q_0Y?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [Enable DocSearch in Kata powered by Algolia - by yasulab · Pull Request #400](https://github.com/coderdojo-japan/coderdojo.jp/pull/400)

## 📊 3. [統計情報](https://coderdojo.jp/stats)のグラフ改善・プロバイダ対応
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/-5myKgTroDE?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [開催回数の推移グラフ/１目盛の単位をtickInterval: 300に設定し見やすく by Yuppymam · Pull Request #415](https://github.com/coderdojo-japan/coderdojo.jp/pull/415)
- [イベント履歴収集スクリプトでプロバイダ指定を可能に by chicaco · Pull Request #392](https://github.com/coderdojo-japan/coderdojo.jp/pull/392)


## 📗 4. [CoderDojo Japan 公式ブック](https://coderdojo.jp/sotechsha2)のWebサイト改訂
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/ZS59hHrGHFo?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [第２版向けに新しくページを作成した by nanophate · Pull Request #450](https://github.com/coderdojo-japan/coderdojo.jp/pull/450)

## 📅 5. [近日開催の道場](https://coderdojo.jp/events)ページ
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/X2zs5J_A41k?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [直近の CoderDojo 開催情報を表示する by chicaco · Pull Request #460](https://github.com/coderdojo-japan/coderdojo.jp/pull/460)

## 📱 6. [統計情報](https://coderdojo.jp/stats)のモバイル対応
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/1XsaufJqvqU?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [統計情報ページのグラフをモバイルでも見やすく by Yuppymam · Pull Request #514](https://github.com/coderdojo-japan/coderdojo.jp/pull/514)

## ♻️ 7. [DojoPaaS](https://github.com/coderdojo-japan/dojopaas) の内部システム改善
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/w5ABFtR4wJ8?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [Translate Nodejs into Ruby scripts by AnaTofuZ · Pull Request #136](https://github.com/coderdojo-japan/dojopaas/pull/136)

## ✅ 8. 2019年の coderdojo.jp 開発まとめ
<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/LqzNUv8dzUI?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>


いかがでしたでしょうか? 毎年少しずつですが coderdojo.jp のシステムも改善されていますね 🛠💨✨ ソースコードは OSS として公開されているので、もし興味あれば GitHub 上の [coderdojo-japan/coderdojo.jp](https://github.com/coderdojo-japan/coderdojo.jp) を見てみてください！

YassLab 株式会社では、CoderDojo Japan の開発パートナーとして引き続き裏側から CoderDojo コミュニティを支援していきます 💪

<img src="/img/news/coderdojo-japan-partners.png" alt="図: CoderDojo Japan のパートナー法人 (一部)" />
<center>図: CoderDojo Japan の<a href="https://coderdojo.jp/#partners">パートナー法人</a> (一部)</center>
<br>

## 🎁 オマケ：RubyWorld Conference 2019 の発表動画

動画内で紹介した RubyWorld Conference 2019 における発表動画も公開されています 🆕✨ こちらももし興味あればぜひ！😆

<div class="video" style="margin-bottom: 40px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/3WdN2gRC7qo?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

<center>スライド資料は<a href="https://speakerdeck.com/yasulab/case-study-of-how-coderdojo-japan-uses-ruby">コチラ</a></center>

cf. [🤝 パートナーシップのご案内 - CoderDojo Japan](https://coderdojo.jp/partnership)


## PR・宣伝

YassLab 株式会社では全社員がリモートワークをしながら『{{ site.railstutorial }}』『{{ site.railsguides }}』『{{ site.coderdojo }}』を開発し、他社向けは『[月額制の開発支援事業](/ja/agile)』も提供しています。

Railsチュートリアルでは『[法人プラン](https://railstutorial.jp/business)』や『[お試しプラン](https://railstutorial.jp/trial)』、『[パートナー提携](https://railstutorial.jp/contact#license)』や『[解説動画・質問対応サービス](https://railstutorial.jp/#service)』なども提供しています。気になるプラン・サービスがあればぜひ気軽に試してみてください ;)

-----

上記の他にも様々な動画を YouTube から公開しているので、よければぜひチャンネル登録していただければ ;)

📹 YassLab チャンネル - YouTube
[https://www.youtube.com/user/YassLabChannel/](https://www.youtube.com/user/YassLabChannel/)

-----

[![YassLab Inc.](/img/logos/800x200.png)](/)


