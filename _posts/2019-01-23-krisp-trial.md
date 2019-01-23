---
layout: post
title:  環境音などのノイズを軽減できる Krisp を試してみた
thumbnail: bg-sky.jpg
author: 安川 要平
categories: [blog]
tags: [remote, zoom]
permalink: /ja/posts/krisp-trial
---

「Krisp」というアプリをご存知でしょうか? 弊社のようなリモートワーク主体で動く会社では、ビデオ会議を頻繁に行いますが、場所によっては周りの環境音が気になってしまい、スムーズにコミュニケーションが取れなくなってしまうときがあります。[指向性のあるマイク](http://www.amazon.com/Audio-Technica-ATR2100-USB-Cardioid-Dynamic-Microphone/dp/B004QJOZS4)などを使うと改善できるのですが、常にマイクを持って移動するのも手間ですよね >< 💦

そういった場面で役立つのが「Krisp」というアプリです。[機械学習を使ってデジタル信号を改善](https://krisp.ai/technology.html)し、環境音などのノイズを軽減してくれるアプリです。2019年1月には Product Hunt でも取り上げられ他ので、これからどんどん使われる場面も増えていきそうです 👀

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Great news! <a href="https://twitter.com/krispHQ?ref_src=twsrc%5Etfw">@krispHQ</a> won the 1st place as the Audio &amp; Voice Product of the Year in the <a href="https://twitter.com/ProductHunt?ref_src=twsrc%5Etfw">@ProductHunt</a> Golden Kitty Awards!! 🥇🏆🎉🎉🎉 <a href="https://t.co/q2CHo6jG8I">https://t.co/q2CHo6jG8I</a><br><br>Thanks to everyone for your participation and support!❤️😻 <a href="https://t.co/ZNHDOS3udA">pic.twitter.com/ZNHDOS3udA</a></p>&mdash; krisp (@krispHQ) <a href="https://twitter.com/krispHQ/status/1086301046954184705?ref_src=twsrc%5Etfw">January 18, 2019</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

<br>

<ol class="snsb" style="margin-left: 0px">
  <li><div class="fb-like" data-href="{{ page.url }}" data-layout="standard" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></li>
  <li><a href="https://twitter.com/share" class="twitter-share-button" data-url="https://yasslab.jp/ja/posts/krisp-trial" data-text="{{ page.title }}" data-lang="ja" data-hashtags="YassLab" data-via="YassLab" width="100">Tweet</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></li>
  <li><a href="https://b.hatena.ne.jp/entry/s/{{ page.url }}" class="hatena-bookmark-button" data-hatena-bookmark-title="{{ page.title }} - YassLab" data-hatena-bookmark-layout="standard-balloon" data-hatena-bookmark-lang="ja" title="このエントリーをはてなブックマークに追加"><img src="https://b.st-hatena.com/images/entry-button/button-only@2x.png" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" /></a><script type="text/javascript" src="https://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script></li>          
</ol>

<br>

## 実際に試してみた

ということで早速 Krisp を試してみました。[Krisp の公式サイト](https://krisp.ai/)からアプリをダウンロードして、画面に指示に従ってセットアップを進めていきます (執筆時点では macOS のみ対応でした)。

[![Krisp Website](/img/krisp-setup-0.png)](https://krisp.ai/)

セットアップが終わると、メニューバーに次のようなアプリが表示されるようになります。「Mute Noise」というトグルボタンからノイズを軽減するかどうか切り替えできるので、もし OFF になっていたら忘れずに ON にしておきましょう。

![Krisp Menu Bar](/img/krisp-setup-1.png)

あとは、使いたいビデオ会議アプリの設定画面から、マイクの設定を Krisp に変更します。YassLab 社では普段 [Zoom](https://zoom.us/) を使っているので、Zoom の設定画面から次のように設定しました。

![Krisp Setup in Zoom](/img/krisp-setup-2.png)

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

<ol class="snsb" style="margin-left: 0px">
  <li><div class="fb-like" data-href="{{ page.url }}" data-layout="standard" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></li>
  <li><a href="https://twitter.com/share" class="twitter-share-button" data-url="https://yasslab.jp/ja/posts/krisp-trial" data-text="{{ page.title }}" data-lang="ja" data-hashtags="YassLab" data-via="YassLab" width="100">Tweet</a><script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script></li>
  <li><a href="https://b.hatena.ne.jp/entry/s/{{ page.url }}" class="hatena-bookmark-button" data-hatena-bookmark-title="{{ page.title }} - YassLab" data-hatena-bookmark-layout="standard-balloon" data-hatena-bookmark-lang="ja" title="このエントリーをはてなブックマークに追加"><img src="https://b.st-hatena.com/images/entry-button/button-only@2x.png" alt="このエントリーをはてなブックマークに追加" width="20" height="20" style="border: none;" /></a><script type="text/javascript" src="https://b.st-hatena.com/js/bookmark_button.js" charset="utf-8" async="async"></script></li>          
</ol>

