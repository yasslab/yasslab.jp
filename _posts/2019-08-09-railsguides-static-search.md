---
layout: post
title:  🔍 Railsガイドで検索結果の一覧が見られるようにました
thumbnail: bg-sky.jpg
author: Yuppyhappytoyou
categories: [press]
tags: [Railsガイド, Proプラン, Teamプラン]
---

Railsガイドの[Proプラン](https://railsguides.jp/pro)/[Teamプラン](https://railsguides.jp/team)に検索結果の一覧機能が追加されました 🎉

これまでの検索機能では URL に変化がなく、例えば検索結果をあとで見返したり、検索結果を共有することができませんでした。

![これまでの検索画面](https://i.gyazo.com/5a2de6b4fb1516310987bbc404861f37.png)

<br>

## 🔍 検索専用のページ

これまで通り「`/`」で検索を開始すると、フィールドの右端に新たなボタンが追加されました。このボタンをクリックするか、もしくは検索キーワード入力後に `Enter` キーを入力することで、検索専用のページに移動できるようになります。

![検索ボタン](https://i.gyazo.com/df0e98e09cf8007e659fbc82138e10e6.png)

検索専用ページ（`/search`）では、検索結果がURLに反映されます。例えば「`リクエスト`」を入力して検索一覧ページに飛ぶと、URL が `/search?q=リクエスト` となります。URLから検索結果を復元することもできるため、検索結果のURLを保存したり、もしくはProプランまたはTeamプランのユーザーと共有することもできます。

![demo動画](https://i.gyazo.com/5617dc0c1e13a6bec0d62a748fc54954.png)<!-- demo動画に変える -->


## 🎩 検索専用ページの活用例

検索専用ページができたため、例えば [Alfred](https://www.alfredapp.com/) のような Launcher アプリと連携させることもできます。

![Alfred設定方法](https://i.gyazo.com/88773e8121a41ea31dfbbb6ac36a15e5.png)

Alfred はほんの一例ですが、色々なアプリと組み合わせてみることで、皆さんのプロダクト開発のお役に立てば嬉しいです。

<!-- Alfred demo を入れる -->

## まとめ
いかがでしたか？何か気になる点がございましたらお気軽に[フィードバック機能](https://yasslab.jp/ja/news/feature-request-form)をご利用ください 💌

Rails特化の全文検索サービスの「[Proプラン](https://railsguides.jp/pro)」、チーム全体の作業効率を向上させる「[Teamプラン](https://railsguides.jp/team)」を今後ともよろしくお願いします。

[![Pro/Team バナー画像](https://i.gyazo.com/83f4b789ec3a255533d96cced1f9bcbb.png)](https://railsguides.jp/#pr)


