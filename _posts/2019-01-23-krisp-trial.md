---
layout: post
title:  🎧 環境音などのノイズを軽減できる Krisp を試してみた
thumbnail: bg-sky.jpg
author: yasulab
categories: [Blog]
tags: [リモートワーク, Zoom]
permalink: /ja/posts/krisp-trial
---

「Krisp」というアプリをご存知でしょうか? 弊社のようなリモートワーク主体で動く会社では、ビデオ会議を頻繁に行いますが、場所によっては周りの環境音が気になってしまい、スムーズにコミュニケーションが取れなくなってしまうときがあります。[指向性のあるマイク](http://www.amazon.com/Audio-Technica-ATR2100-USB-Cardioid-Dynamic-Microphone/dp/B004QJOZS4)などを使うと改善できるのですが、常にマイクを持って移動するのも手間ですよね >< 💦

そういった場面で役立つのが「Krisp」というアプリです。[機械学習を使ってデジタル信号を改善](https://krisp.ai/technology.html)し、環境音などのノイズを軽減してくれるアプリです。2019年1月には Product Hunt でも取り上げられたため、これからどんどん使われる場面も増えていきそうです 👀

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Great news! <a href="https://twitter.com/krispHQ?ref_src=twsrc%5Etfw">@krispHQ</a> won the 1st place as the Audio &amp; Voice Product of the Year in the <a href="https://twitter.com/ProductHunt?ref_src=twsrc%5Etfw">@ProductHunt</a> Golden Kitty Awards!! 🥇🏆🎉🎉🎉 <a href="https://t.co/q2CHo6jG8I">https://t.co/q2CHo6jG8I</a><br><br>Thanks to everyone for your participation and support!❤️😻 <a href="https://t.co/ZNHDOS3udA">pic.twitter.com/ZNHDOS3udA</a></p>&mdash; krisp (@krispHQ) <a href="https://twitter.com/krispHQ/status/1086301046954184705?ref_src=twsrc%5Etfw">January 18, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>


## 実際に試してみた

ということで早速 Krisp を試してみました。[Krisp の公式サイト](https://krisp.ai/)からアプリをダウンロードして、画面に指示に従ってセットアップを進めていきます (執筆時点では macOS のみ対応でした)。

[![Krisp Website](/img/posts/krisp-setup-0.png)](https://krisp.ai/)

セットアップが終わると、メニューバーに次のようなアプリが表示されるようになります。「Mute Noise」というトグルボタンからノイズを軽減するかどうか切り替えできるので、もし OFF になっていたら忘れずに ON にしておきましょう。

![Krisp Menu Bar](/img/posts/krisp-setup-1.png)

あとは、使いたいビデオ会議アプリの設定画面から、マイクの設定を Krisp に変更します。YassLab 社では普段 [Zoom](https://zoom.us/) を使っているので、Zoom の設定画面から次のように設定しました。

![Krisp Setup in Zoom](/img/posts/krisp-setup-2.png)

これで準備完了です。メニュー画面から「Mute Noise」を ON/OFF にして実際に試してみた音声が次のとおりになります。

<audio id="player2" preload="none" controls style="max-width:100%;">
  <source src="/audio/krisp-trial.mp3" type="audio/mp3" />
</audio>

<br>
<br>

## まとめ

いかがでしょうか? 執筆時点ではまだバージョン 1.0 ではないため、OS によっては不具合などもあるかもしれませんが、少なくとも現時点で環境音などのノイズはほぼ削除できているように聴こえます。また、プライバシーにも配慮されており、[サーバーに音声データを送らない設計](https://krisp.ai/faq.html)にもなっているそうです。

もし興味あればぜひ試してみてください 😆

Mute Background Noise | krisp   
[https://krisp.ai/](https://krisp.ai/)

<br>

## 追記: 公式アカウントから<br class="ignore-sp">コメントもらいました 😻

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Thanks for putting this together and sharing Yohei, we love hearing that Krisp is useful for you! 🤗</p>&mdash; krisp (@krispHQ) <a href="https://twitter.com/krispHQ/status/1088755410918608896?ref_src=twsrc%5Etfw">January 25, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

