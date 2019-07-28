---
layout: post
title:  💳 解説動画のカード決済がシンプルになりました
thumbnail: bg-sky.jpg
author: Yuppyhappytoyou
categories: [press]
tags: [Railsチュートリアル, Stripe, Gumroad]
permalink: /ja/posts/change-payment-system-to-stripe
---

Railsチュートリアル解説動画の決済システムが2019年8月1日より Gumroad から Stripe に切り替わりました 🎉

Gumroad の仕様上、これまでの決済システムでは購入時に所在地などを入力する必要がありました。Stripe を使った新しい決済システムでは、そういった皆様の大切な個人情報を渡すことなく、メールアドレスとクレジットカードのみ (デビットカードでも可) で決済できるようになりました 💳✨

<div class="center">
  <a href="https://railstutorial.jp/screencast"><img alt="Railsチュートリアル解説動画" src="https://i.gyazo.com/23546677545e3d1573625baca121b004.png" /></a>
  <a href="https://railstutorial.jp/screencast">
    <h5 style="margin-top: 20px;">🆕 解説動画購入ページ</h5>
  </a>
  <br><br><br>
</div>

## 以前からの構想を実現

YassLab 社が提供する新しいサービス『[法人プラン](https://railstutorial.jp/business)』『[Proプラン](https://railsguides.jp/pro)』『[Teamプラン](https://railsguides.jp/pro)』はすべて Stripe に移行しており、ようやく、[古くから動いている Gumroad の決済システム](https://qiita.com/yasulab/items/63cb3dea01ebc89fa81c)も移行できる体制になりました。

[![Stripeを使った決済システム](https://i.gyazo.com/f5bbd1c240a7b10a96998fe1abeabc6d.jpg)](https://speakerdeck.com/yasulab/case-studies-of-rails-applications?slide=25)
<div class="center" style="margin-top: -20px;">
  📜 引用元: <a href="https://speakerdeck.com/yasulab/case-studies-of-rails-applications">プロダクトの成長と決済システム</a>
</div>

<br>

## より分かりやすい購入フロー

これまででは特定のタグのみしか使えなかったためテキストが多かったですが、新しい購入ページでは CSS や JavaScript が使えるため、より分かりやすく、改善しやすい体制になりました ♻️🔧✨

![CSS例: Three-block photos](https://i.gyazo.com/627cf8f1b32a791132d1cf18a5e45da5.png)
<div class="center" style="margin-top: -30px;">図: CSS を使ったレイアウトの例</div>

<br>

![JS例: よくある質問](https://i.gyazo.com/a1d4c5405a2a11c47656cc8bae03ecd0.png)
<div class="center" style="margin-top: -30px;">図: JavaScript を使ってスクロールを最小限に</div>

<br>

## アクション数が減りました 💓

上記に加え、「数量」や「住所」などの不要な入力欄もすべて削除しました。

![数量は不要](https://i.gyazo.com/c5bc271cd1f16dc30b41f1d76c91a1e8.png)
<div class="center" style="margin-top: -30px;">図: 「数量」は<a href="https://railstutorial.jp/business">法人プラン</a>で解決したため不要</div>

<br>

![郵便番号も不要](https://i.gyazo.com/9a65faf313165b27036110a76b34aa54.png)
<div class="center" style="margin-top: -30px;">図: 「住所」も Stripe に移行したため不要</div>

<br>

## まとめ

いかがでしたでしょうか？ 興味がある方は Gumroad から Stripe に切り替えた背景を説明したスライド資料「[プロダクトの成長と決済システム](https://speakerdeck.com/yasulab/case-studies-of-rails-applications)」をご参照ください。

<div style="margin-bottom: 80px;">
  <script async class="speakerdeck-embed" data-id="30289234a2f743b6b2827602cfbc5991" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>
</div>

先日の[第11回フクオカRuby大賞でAWS賞を受賞](https://yasslab.jp/ja/posts/ceremony-of-fukuoka-ruby-award-2019)した『[Railsチュートリアル法人プラン](https://railstutorial.jp/business)』でも使われている当解説動画をぜひご視聴いただければ嬉しく思います。

[https://railstutorial.jp/screencast](https://railstutorial.jp/screencast) 解説動画-Railsチュートリアル

[![YassLab Inc.](/img/logos/800x200.png)](/)


