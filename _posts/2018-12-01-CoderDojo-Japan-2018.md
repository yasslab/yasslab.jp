---
layout: post
title:  開発目線で見る最近の CoderDojo Japan 2018
thumbnail: coderdojo-japan.png
author: 安川 要平
categories: [Blog]
tags: [CoderDojo, Rails]
permalink: /ja/posts/coderdojo-japan-2018
---

<div class="video" style="margin-bottom: 30px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/fts1ogmYJ6M?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

どうも、[安川](https://twitter.com/yasulab)です。開発支援パートナーとして YassLab 株式会社が CoderDojo Japan の Web 開発を継続的にサポートしているのですが、毎年少しずつ、様々な部分がアップデートされています。

cf. [CoderDojo Japan の各種機能と実装について【2017年版】](https://qiita.com/yasulab/items/1d12e6b295c0a9e577f1)   
cf. [CoderDojo Japan のバックエンドを更新しました 【2016年版】](https://coderdojo.jp/news/2016/12/12/new-backend)

上記の流れに続けて、本記事でも2018年に行われたアップデートを紹介していきます。ただ今回は少しアプローチを変えて、**スクリーンキャスト風に GitHub 上の[コミットログ](https://github.com/coderdojo-japan/coderdojo.jp/commits/master)や[開発背景](https://github.com/coderdojo-japan/coderdojo.jp/pulls?utf8=%E2%9C%93&q=is%3Aclosed+)などを説明**してみようかなと思います。

動画もなるべく小分けしていて、説明している内容や詳細へのリンクも箇条書きでまとめているので、興味あるトピックから気軽に眺めてみていただければ ;) 

<br><br>

## 1. README・<br class="pc-hidden">トップページ改善

<div class="video" style="margin-bottom: 30px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/pHFRHN-wGYU?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [README の日本語化](https://github.com/coderdojo-japan/coderdojo.jp/commit/6e459fa1e9c322fbafa77cd293c3e2276dbe4b1f)
   - Dojo 情報の修正方法
   - Kata の執筆・編集方法
   - Web 開発に関わるための手順
- [CoderDojo ガイダンス](https://coderdojo.jp/#welcome)のリニューアル
- [Google Map 検索できるページ](https://zen.coderdojo.com/find)への導線設置
- Twitter 仕様変更に伴う [最近の CoderDojo](https://coderdojo.jp/#timeline) の対応
- [問い合わせフォーム](https://coderdojo.jp/#contact)の改善

<br>

## 2. 統計情報の改善・見える化

<div class="video" style="margin-bottom: 30px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/K85x6tAHC10?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [統計情報 - CoderDojo Japan](https://coderdojo.jp/stats)
- [開発者向けドキュメント](https://github.com/coderdojo-japan/coderdojo.jp/blob/master/docs/how-to-add-dojo.md)の整備
- [Add 'dumper' gem to backup database #326](https://github.com/coderdojo-japan/coderdojo.jp/pull/326)

<br>

## 3. ドキュメントの整備・充実

<div class="video" style="margin-bottom: 30px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/9NAlTauTrwQ?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [パートナーシップのご案内](https://coderdojo.jp/docs/about-partnership)
- [パートナーシップの存続期間について](https://coderdojo.jp/docs/term-of-partnership)
- [CoderDojo Japan 決算報告書](https://coderdojo.jp/financial-report)
- [CoderDojo ブランドガイドライン](https://coderdojo.jp/docs/brand-guidelines) / [報道関係者向け資料
](https://coderdojo.jp/docs/for-press)
- [CoderDojo の運営が難しくなったときのガイドライン](https://coderdojo.jp/docs/how-to-suspend-your-dojo)

<br>

## 4. システム・インフラ環境改善

<div class="video" style="margin-bottom: 30px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/zs1H7dXR_9c?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [アクティブではない Dojo の非表示化 #310](https://github.com/coderdojo-japan/coderdojo.jp/issues/310)
- [Zen API 連携の調査 #330](https://github.com/coderdojo-japan/coderdojo.jp/issues/330)
- [Docker 環境の整備 #347](https://github.com/coderdojo-japan/coderdojo.jp/pull/347)
- [テスト環境の整備 #352](https://github.com/coderdojo-japan/coderdojo.jp/pull/352)
- [Trailing Slash などのバグ対応](https://github.com/coderdojo-japan/coderdojo.jp/issues/290)
- [他、各種バグ対応](https://github.com/coderdojo-japan/coderdojo.jp/issues?q=label%3ABug+is%3Aclosed)

<br>

## 5. 今後、実装してみたい機能

<div class="video" style="margin-bottom: 30px;">
<iframe width="560" height="315" src="https://www.youtube.com/embed/k2tKZkVDkEM?rel=0&autoplay=0&showinfo=0&controls=1&fs=1&modestbranding=0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

- [直近の CoderDojo 開催情報を表示したい #258](https://github.com/coderdojo-japan/coderdojo.jp/issues/258)
- [トップページにCoderDojo Mapを埋め込む #32](https://github.com/coderdojo-japan/coderdojo.jp/issues/32)
- 統計情報の登録フローを簡略化したい
- 統計情報の対応可能サービスを増やす
- デザインの改善

<br>

## まとめ

いかがでしたでしょうか? 毎年少しずつですが CoderDojo Japan のシステムも改善されていますね ;) 

ソースコードは OSS として公開されているので、もし興味あれば GitHub 上の [coderdojo-japan/coderdojo.jp](https://github.com/coderdojo-japan/coderdojo.jp) を見てみてください！

YassLab 株式会社では、CoderDojo Japan の開発支援パートナーとして引き続き裏側から支援していきます 💪

[![開発パートナー](https://coderdojo.jp/img/partners-on-web.png)](https://coderdojo.jp/#partners)

<br>

### オマケ

CoderDojo 五反田の会場スポンサーでもある[freee株式会社](https://www.freee.co.jp/)にご招待されて、「[ミッション・ビジョン・理念ナイト](https://jobs.freee.co.jp/recruitblog/aboutus/freee_club_5/)」で上記の YassLab × CoderDojo Japan 開発支援パートナーの取り組みについて発表させていただきました。

法人として CoderDojo Japan と提携を検討している方がいらっしゃれば、ぜひこちらもご参考にしていただければ ;)

<script async class="speakerdeck-embed" data-id="ba5d69d07474453eaf7e34a8b924851e" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

cf. [コミュニティと共に成長する: 全国150ヶ所ある CoderDojo と企業の共創](https://speakerdeck.com/…/growing-up-together-with-community)   
cf. [パートナーシップのご案内 - CoderDojo Japan](https://coderdojo.jp/docs/about-partnership)
