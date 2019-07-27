---
layout: post
title:  💰 解説動画の決済システムを Gumroad から Stripe へ変更しました
thumbnail: bg-sky.jpg
author: Yuppyhappytoyou
categories: [press]
tags: [登壇, Rails]
permalink: /ja/posts/change-payment-system-to-stripe
---

Railsチュートリアル解説動画の決済システムが 2019年8月1日より、これまでの Gumroad から Stripe に切り替わります 🎉購入までの流れは今までとほぼ変わりありませんが、決済先のURLが変更となります。Gumroad の仕様上、購入時に入力しなければならかった入力項目が減るなど以前よりも購入するまでのアクション数が減ったことで、よりユーザーに寄り添ったシステムになりました✨

<div class="center">
  <a href="https://railstutorial.jp/screencast"><img alt="Railsチュートリアル解説動画" src="https://i.gyazo.com/23546677545e3d1573625baca121b004.png" /></a>
  <a href="https://railstutorial.jp/screencast">
    <h5 style="margin-top: 20px;">🆕解説動画購入ページ</h5>
  </a>
  <br><br><br>
</div>

## 以前からの構想を実現

これまでに、[Railsチュートリアル『法人プラン』](https://railstutorial.jp/business)や、[Railsガイド『Proプラン』](https://railsguides.jp/pro)などの様々な決済を Stripe で実装してきており、知見も増えてきたことから「コードは増えるが、柔軟に対応できるシステムを作りたい」を解説動画でも実現させました。

![stripeを使った決済図](https://i.gyazo.com/9e00e666211666f177e9fabf384f18ae.png)
<div class="center">
  <a href="https://speakerdeck.com/yasulab/case-studies-of-rails-applications">よりユーザーに寄り添ったシステムに</a>
</div>

<br>

## 動画購入がより分かりやすく

- 図解を入れることで動画購入方法が分かりやすくなりました✨

![視聴までの流れ](https://i.gyazo.com/0213e06d6793f0878cc42bbb64b209b0.png)

-----
<br>

- 購入するまでのアクション数が減りました💓

![Gumroad視聴までの流れ](https://i.gyazo.com/c5bc271cd1f16dc30b41f1d76c91a1e8.png)

<br>
- Gumroad の仕様上、購入時に入力しなければならかった項目が減りました ✂️

![不要になった入力](https://i.gyazo.com/9a65faf313165b27036110a76b34aa54.png)

## 参考

いかがでしたでしょうか？ 興味がある方は Gumroad から Stripe に切り替えた具体的な背景が分かる、弊社の「プロダクトの成長と決済システム」についてまとめたスライドもご覧下さい。

<div style="margin-bottom: 80px;">
  <script async class="speakerdeck-embed" data-id="30289234a2f743b6b2827602cfbc5991" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
</div>

先日の[第11回フクオカRuby大賞でAWS賞を受賞](https://yasslab.jp/ja/posts/ceremony-of-fukuoka-ruby-award-2019)した『Railsチュートリアル法人プラン』でも使われている当解説動画をぜひご視聴いただければ嬉しく思います。

[https://railstutorial.jp/screencast](https://railstutorial.jp/screencast) 解説動画-Railsチュートリアル

[![YassLab Inc.](/img/logos/800x200.png)](/)


