---
layout: post
title:  Railsエンジニアのためのウェブセキュリティ入門に参加 🔐
thumbnail: bg-sky.jpg
author: yasulab
categories: [blog]
tags: [セキュリティ, Rails, Railsチュートリアル]
permalink: /ja/posts/secure-programming-with-rails
---

[銀座Rails#8](https://ginza-rails.connpass.com/event/121889/)で行われた徳丸 浩さん ([@ockeghem](https://twitter.com/ockeghem)) の講演『Railsエンジニアのためのウェブセキュリティ入門』に参加してきました! 🏃💨

<div style="margin-bottom: 50px;">
  <blockquote class="twitter-tweet" data-lang="en"><p lang="ja" dir="ltr">本日19時から銀座にてですが、キャンセルのためお席の余裕ができたようです。Railesアプリのセキュリティについてトークします / “銀座Rails#8 @リンクアンドモチベーション - connpass” <a href="https://t.co/1DBQfEBoXk">https://t.co/1DBQfEBoXk</a></p>&mdash; 徳丸 浩 (@ockeghem) <a href="https://twitter.com/ockeghem/status/1120955276339757056?ref_src=twsrc%5Etfw">April 24, 2019</a></blockquote>
</div>

徳丸さんとは[エンジニアのための法律勉強会](https://koyhogetech.hatenablog.com/entry/20150528/coedo-lawstudy)で初めてお会いし、2019年12月から始まる[ウェブ・セキュリティ試験](https://prtimes.jp/main/html/rd/p/000000076.000018759.html)の運営団体『[BOSS-CON JAPAN](https://www.boss-con.jp/aboutus/)』を通して軽くお話しすることがあります。といっても、YassLab社は[Rails技術者認定試験で協力](https://railscp.com/text/)していて、PHPやPythonなどの試験には直接関わっていないので、徳丸さん達が隣で面白いことをやっているなーというぐらいの距離感ですが 😅

今回はその徳丸さんのお話『Railsエンジニアのためのウェブセキュリティ入門』を聞いてきたので、その内容の一部をご紹介してみようと思います 📝💨

　

## 題材にRailsチュートリアル...!!

![railstutorial.jp](https://i.gyazo.com/ea9e68c7f30c75ea6a2f7a63f4b6e860.jpg)

今回の講演では「脆弱性のあるコードを入れてしまうとどんなことが起こるのか？」という DEMO がいくつか行われたのですが、なんとその題材の1つに弊社が運営する『[Railsチュートリアル](https://railstutorial.jp/)』を選んでいただきました!! 😻

具体的にはRailsチュートリアルで開発するSNS (通称: [Sample App](https://github.com/yasslab/sample_apps)) に**誤ったコードを入れてしまうとどんなことが実現できてしまうのか**という方向で様々な DEMO が行われました。

![Sample App Demo](https://i.gyazo.com/4834fd6d34e8fd161b3413bc29f59a4e.jpg)

例えば次のように `protect_from_forgery` のコードをいじったり、`csrf_meta_tags` を削除したり、`has_secure_password` を使わずにパスワードを保存した場合にどんなことが起こり得るのか、といった様々な例 (CSRF, XSS, OS/SQLインジェクションなど) を実演していました。

![Sample App Hacking](https://i.gyazo.com/8e9926d608bc9c143bcce5533835c9dd.jpg)

本講演のスライドは今回が初披露で、フィードバックを参考に今後さらに改善していく予定とのことです。講演の全容は改善版を見ていただくこととして、本記事ではその中でも印象に残った例を１つご紹介しますね。

　

## 😈 例: パスワードを<br>ハッシュ化しないで保存する

Railsチュートリアルでも[暗号化とハッシュ化の違い](https://railstutorial.jp/chapters/modeling_users#sec-a_hashed_password)や、なぜパスワードは暗号化ではなくハッシュ化なのかと言った説明がされていますが、本講演でもその概要を分かりやすく説明されていました。技術的な攻撃方法やその対策も紹介されていましたが、個人的には**「実際に流失した場合どんなことが起こるのか？」**といった事例が印象的でした。

最近だと[宅ふぁいる便](https://www.filesend.to/)の件が記憶に新しいですが、パスワードを含む情報流出の事件は過去にもあり、中には**訴訟およびその判決が出ている事例**もあります。

[📜 SQLインジェクション対策もれの責任を開発会社に問う判決 \| 徳丸浩の日記](http://blog.tokumaru.org/2015/01/sql.html)

ざっくりと簡単にまとめると、情報流出したサービスの受託開発会社に対して約3131万円の損害賠償の訴訟が起こった。契約書では損害賠償責任制限を定めていたが**『SQLインジェクション対策を怠ったことは重過失である』**という結果になったためその制限も無効となり、次のような判決が命じられたというものです。

```
結果、3131万9568円の損害を認定し、
その3割を控除して、2262万3697円の損害賠償をY社に命じた

(※ 上記記事からの引用です)
```

<br>こういった判決文を見ると『セキュリティ対策を頑張る価値は十分にある...!!』という気にもなりますね 😆🔐✨

なお、この判決については YassLab 社の顧問弁護士でもある[野島 梨恵](http://nojimarie.naganoblog.jp/)氏が『[エンジニアのための法律勉強会](https://koyhogetech.hatenablog.com/entry/20150528/coedo-lawstudy)』で解説しています。[@koyhoge](https://twitter.com/koyhoge) さんがまとめた次の記事を読むとさらに詳しい状況が分かるので、もし興味あればぜひチェックしてみてください 👀✅

[📜 エンジニアのための法律勉強会#2『判例に学ぶ、受託開発時の注意事項』参加メモ - Gist](https://gist.github.com/koyhoge/1ee02b354968e8910604)

　

## Railsにおける基本対策は<br>『バージョンを上げる』

徳丸さんの講演ではもちろん対策についても触れています。簡潔にまとめると『Railsのフレームワークは (セキュリティの観点から見て) よく出来ている』、『Railsのバージョンを上げよう』、『Railsのレールから外れる場合は慎重に』という話が中心だったかなと感じています。

例えば徳丸さんが以前に見つけたSQL周りの脆弱性もRailsの5系以上では既に直っていたり、冒頭で述べた `protect_from_forgery` や `csrf_meta_tags`、`has_secure_password` などのレールにうまく乗っている限りにおいては脆弱性は簡単には見つけられない、とのことでした。

実際、今回の題材としていただいたRailsチュートリアルの『Sample App』についても、アプリケーションコードからは脆弱性を見つけられなかったと懇親会で伺いました。ただし、あくまでもRailsチュートリアルで書くことになるコード部分についてのみで、Gemfile を通して導入される各種ライブラリまでじっくり調べていけば、脆弱な部分は見つけられるかもしれません 🤔💭

**Railsチュートリアルでは読者が自力で解決しづらいエラーに遭遇しないように Gemfile でバージョンを固定しています。**もちろん[書籍内でもその旨を明示](https://railstutorial.jp/chapters/beginning#sec-bundler)していますが、導入しているライブラリのバージョンが古いために、最新バージョンでは既に対策済みの脆弱性が残っていてもおかしくはありません。

最後の[拡張編](https://railstutorial.jp/chapters/following_users#sec-guide_to_extensions)でも紹介していますが、Railsチュートリアルでは**完走後の演習課題として Sample App の Gemfile や Rails 自身のアップグレードをオススメ**しています。Railsチュートリアル完走後にプロダクト開発を始める方々も多いと思いますが、そのときは徳丸さんからのアドバイス**『Railsのバージョンを上げよう』『Railsのレールから外れる場合は慎重に』**を意識していくと良さそうですね 😆

　

## 最後に

徳丸さんの講演の最後では、RailsチュートリアルやRailsガイドの『[Railsセキュリティガイド](https://railsguides.jp/security.html)』 をオススメしていただけました 😻 (嬉しい!)

<div style="margin-bottom: 50px;">
  <blockquote class="twitter-tweet" data-lang="en"><p lang="ja" dir="ltr">徳丸さんの講演『Railsエンジニアのためのウェブセキュリティ入門』で <a href="https://twitter.com/hashtag/Rails%E3%83%81%E3%83%A5%E3%83%BC%E3%83%88%E3%83%AA%E3%82%A2%E3%83%AB?src=hash&amp;ref_src=twsrc%5Etfw">#Railsチュートリアル</a> が紹介されてたー！やったー！嬉しい！！😻✨ <a href="https://twitter.com/hashtag/ginzarails?src=hash&amp;ref_src=twsrc%5Etfw">#ginzarails</a> <br><br>&gt; Rails Tutorial を勉強しましょう <a href="https://t.co/kEMpH2weKx">pic.twitter.com/kEMpH2weKx</a></p>&mdash; 安川要平/Yohei Yasukawa (@yasulab) <a href="https://twitter.com/yasulab/status/1121016150182096896?ref_src=twsrc%5Etfw">April 24, 2019</a></blockquote>
</div>

とはいえセキュリティに関するトピックは『１回対策したら終わり』というわけではなく、日々の情報のキャッチアップも重要です。例えば [RubyKaigi 2019](https://yasslab.jp/ja/posts/rubykaigi-2019-report) でアナウンスされた [RubyGems.org](https://rubygems.org/) の MFA 設定がありましたが、皆さんはもう設定されましたか? 🔐✅

[📜 RubyGems.org に多要素認証（MFA）を設定してください - TechRacho](https://techracho.bpsinc.jp/hachi8833/2019_04_22/73587)

YassLab 社ではプロダクト開発をする様々な方々に『[Railsチュートリアル](https://railstutorial.jp/)』や『[Railsガイド](https://railsguides.jp/)』をお届けしているので、引き続き徳丸さんにも納得していただける良質なコンテンツを維持していきたいと思います 📚✨

今後ともよろしくお願いします...!! (＞人＜ )✨

-----

<br>🐣 合わせて読みたい: 銀座rails #8 - Togetter
[https://togetter.com/li/1341460](https://togetter.com/li/1341460)

-----

<br>📣 【PR】YassLab 社では社員研修に特化したRailsチュートリアルの『[法人プラン](https://railstutorial.jp/business)』、Rails開発の生産性を高めるRailsガイドの『[Proプラン](https://railsguides.jp/pro)』を提供しています。ぜひお試しして頂けると嬉しいです ;)

[![YassLab Inc.](/img/logos/800x200.png)](/)

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

