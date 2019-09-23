---
layout: post
title:  ☯️ DojoPaaS の内部システムを移行しました
thumbnail: bg-sky.jpg
author: Yuppyhappytoyou
categories: [blog]
tags: [CoderDojo, DojoPaaS, Ruby]
---

CoderDojo コミュニティに向け簡易 PaaS『[DojoPaaS](https://github.com/coderdojo-japan/dojopaas)』の内部システムを移行しました 🚜💨

![DojoPaaS Porting](https://i.gyazo.com/3aaafd43da64b72ca9f9c2fd6bb63b90.png)

## DojoPaaS とは

インターネットインフラサービスを提供する[さくらインターネット株式会社](https://www.sakura.ad.jp/)は、子ども向けプログラミング道場「[CoderDojo](https://coderdojo.jp/)」を推進する一般社団法人 CoderDojo Japan を支援し、[「さくらのクラウド」を無料で提供](https://www.sakura.ad.jp/information/pressreleases/2017/07/20/90191/)されています 🎁

<iframe src="https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fcoderdojo.jp%2Fposts%2F673793186165170" width="100%" height="614" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe>

この提携に際し、CoderDojo 向けにサーバー利用申請手続きが簡単にできる仕組みのプロトタイプ『[DojoPaaS](https://github.com/coderdojo-japan/dojopaas)』が、[@miya0001](https://twitter.com/miya0001) さんによって開発されました 🛠💨

この DojoPaaS は、GitHub のプルリクエストを利用し、 CSVに書いた設定を元に自動でさくらクラウドのサーバーを生成してくれるシステムとなっています。([詳細記事](https://tarosky.co.jp/tarog/2086))

## DojoPaaS の課題

DojoPaaS はさくらクラウドのサーバー作成APIを利用しておりますが、 サーバーを作成する際の Kernel エラーや、予期せぬ NIC エラーなどが発生してしまうことがあり、これらの不具合への対応が未着手のままでした。このため[エラーが発生する度に手動で対応](https://github.com/coderdojo-japan/dojopaas/issues/133)しており、運用面での負担が課題でした。

今後 CoderDojo コミュニティの活動が活発になっていくにつれて、利用するサーバー台数も増えていくことが予想されるため、このような負担が増え続けていくことは好ましくありません。そこで @miya0001 さんと YassLab 社メンバーと協議した結果、今後の継続的な開発と運用を考慮して [YassLab 社でメンテナンスを引き継ぐ](https://github.com/coderdojo-japan/dojopaas/issues/110)形となりました。

#### 移植に関するご相談

![miya さんから承諾を得た様子](https://i.gyazo.com/d4c28a383b52079cd9e8cb1c8770339d.png)

#### 移行作業の様子
[![移行作業の様子](https://i.gyazo.com/f496cdb67ce9e1f2f106663c2a47eaea.png)](https://github.com/coderdojo-japan/dojopaas/issues/110#issuecomment-495046878)



#### PaaSとは？
"Platform as a Service"の略で、読み方は「パース」です。PaaSは「サービスとしてのプラットフォーム」という意味で、お店で例えるならすでに電気・水道などのインフラがそろった、ショッピングセンターのテナントのようなものです。Railsチュートリアルで使用されている Heroku（へロク）もPaaS提供サービスの一つです✨

## まとめ

DojoPaaS の移行作業、大変お疲れ様でした🎉 日々、CoderDojo の活動を支えてくださっている方々や企業には感謝です💓

これから更に活動しやすくなるような仕組みになるように、YassLab社でも日々改善・開発に励んでいます💪 興味がある方は、まずは[お近くにある CoderDojo](https://coderdojo.jp/events) へ遊びに来ていただければ嬉しく思います😉

CoderDojo Japan: [https://coderdojo.jp/](https://coderdojo.jp/)

[![YassLab Inc.](/img/logos/800x200.png)](/)


