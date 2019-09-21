---
layout: post
title:  🛠DojoPaaS のコードを node から Ruby に移行しました
thumbnail: bg-sky.jpg
author: Yuppyhappytoyou
categories: [blog]
tags: [CoderDojo, Ruby]
---

弊社メンバーの [@AnaTofuZ](https://twitter.com/AnaTofuZ) さんが [DojoPaaS](https://github.com/coderdojo-japan/dojopaas) の Ruby への移行を成功させました😆🎉

![Ruby移植成功](https://i.gyazo.com/3aaafd43da64b72ca9f9c2fd6bb63b90.png)

## 背景

インターネットインフラサービスを提供する[さくらインターネット株式会社](https://www.sakura.ad.jp/)は、子ども向けプログラミング道場「[CoderDojo](https://coderdojo.jp/)」を推進する一般社団法人 CoderDojo Japan を支援し、「さくらのクラウド」を無料で提供されています🎁(プレスリリース記事は[こちら](https://www.sakura.ad.jp/information/pressreleases/2017/07/20/90191/)📰✨)

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fcoderdojo.jp%2Fposts%2F673793186165170" width="100%" height="614" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

そこで、CoderDojo 向けにサーバー利用申請手続きが簡単にできる仕組み **[DojoPaaS](https://github.com/coderdojo-japan/dojopaas)** が宮内さん([@miya0001](https://twitter.com/miya0001))により作成されました🎉

この DojoPaaS は、GitHub のプルリクエストを利用し、 CSVに書いた設定を元に自動でさくらクラウドのサーバーを生成してくれるシステムになっています。(詳細は[コチラ](https://tarosky.co.jp/tarog/2086)の記事から)

DojoPaaS の使い方の動画はコチラ👇
<div class="video" style="margin-bottom: 80px;">
  <iframe width="560" height="315" src="https://www.youtube.com/embed/T037c5gajGo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

DojoPaaS はさくらクラウドのサーバー作成APIを利用していますが、 サーバーを作成する際のkernelのエラーや、予期せぬNICのエラーなどが発生してしまうことがあり、最近では、[このようなエラーを手動で直している](https://github.com/coderdojo-japan/dojopaas/issues/133)運用でした。

今後CoderDojo Japanの活動が活発になっていくに連れて、利用するサーバーの台数も増えていくことが考えられ、このような手動修正が増えていくことは運用上好ましくない状況なので、YassLab社のメンバーと宮内さんで話し合った結果、 宮内さんの多忙も踏まえて、CoderDojo Japan の活動を共に支えている YassLab社がメンテナンスを引き継ぐ形となりました。

今回は、この DojoPaaS を宮内さん了承の元、YassLab社が運営・開発しやすいように、node.js から Ruby に移行しました🔄💎

#### PaaSとは？
"Platform as a Service"の略で、読み方は「パース」です。PaaSは「サービスとしてのプラットフォーム」という意味で、お店で例えるならすでに電気・水道などのインフラがそろった、ショッピングセンターのテナントのようなものです。Railsチュートリアルで使用されている Heroku（へロク）もPaaS提供サービスの一つです✨

## まとめ

Ruby への移行作業、大変お疲れ様でした🎉日々、CoderDojo Japan の活動を支えてくださっている方々や企業には感謝です💓これから更に活動しやすくなるような仕組みになるように、YassLab社では日々改善・開発に励んでいます💪興味がある方は、まずは[お近くにある Dojo](https://coderdojo.jp/events) へ遊びに来ていただければ嬉しく思います😉

CoderDojo Japan: [https://coderdojo.jp/](https://coderdojo.jp/)

[![YassLab Inc.](/img/logos/800x200.png)](/)


