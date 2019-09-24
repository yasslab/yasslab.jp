---
layout: post
title:  ☯️ DojoPaaS 内部システムを移行しました
thumbnail: bg-sky.jpg
author: Yuppyhappytoyou
categories: [blog]
tags: [CoderDojo, DojoPaaS, Ruby]
---

CoderDojo コミュニティ向け簡易 PaaS 『[DojoPaaS](https://github.com/coderdojo-japan/dojopaas)』の内部システムを移行しました 🚜💨

![DojoPaaS Porting](https://i.gyazo.com/3aaafd43da64b72ca9f9c2fd6bb63b90.png)

## DojoPaaS とは

インターネットインフラサービスを提供する[さくらインターネット株式会社](https://www.sakura.ad.jp/)は、子ども向けプログラミング道場『[CoderDojo](https://coderdojo.jp/)』を推進する一般社団法人 CoderDojo Japan を支援し、[『さくらのクラウド』を無料で提供](https://www.sakura.ad.jp/information/pressreleases/2017/07/20/90191/)されています 🎁

この提携に際し、CoderDojo 向けにサーバー利用申請手続きを簡単にする仕組み『[DojoPaaS](https://github.com/coderdojo-japan/dojopaas)』が [@miya0001](https://twitter.com/miya0001) さん達によって開発されました 🛠

この DojoPaaS は、GitHub のプルリクエストを利用し、 CSV に書いた設定を元に自動でさくらクラウドのサーバーを生成してくれるシステムとなっています。

<div class="center" style="margin-bottom: 100px;" align="center">
  <blockquote class="twitter-tweet"><p lang="ja" dir="ltr">さくらインターネット様からご支援していただいたサーバーを、全国の <a href="https://twitter.com/hashtag/CoderDojo?src=hash&amp;ref_src=twsrc%5Etfw">#CoderDojo</a> に即時お届けする仕組みが整いました! 🤖✨<a href="https://t.co/gER1dsPyKG">https://t.co/gER1dsPyKG</a><br><br>開発に尽力された <a href="https://twitter.com/miya0001?ref_src=twsrc%5Etfw">@miya0001</a> さん、<a href="https://twitter.com/yasulab?ref_src=twsrc%5Etfw">@yasulab</a> さん、ありがとうございました! 😆🎉 <a href="https://t.co/6iQTL4PZpW">https://t.co/6iQTL4PZpW</a></p>&mdash; CoderDojo Japan ☯️ (@CoderDojoJapan) <a href="https://twitter.com/CoderDojoJapan/status/889346596797784066?ref_src=twsrc%5Etfw">July 24, 2017</a></blockquote>
  </div>

## DojoPaaS の課題

DojoPaaS はさくらクラウドのサーバー作成 API を利用しておりますが、API の仕様は更新されていくため、基本的にはそれらの更新に継続的に追従する必要があります。旧システムでは API 更新への対応が遅れていたため、サーバーを作成する際の Kernel エラーや、予期せぬ NIC エラーなどが発生してしまうことがあり、結果として[エラー発生の度に手動で対応する](https://github.com/coderdojo-japan/dojopaas/issues?q=is%3Aissue+is%3Aclosed)といった運用面での負担が課題でした。

今後 CoderDojo コミュニティが発展するにつれて、利用するサーバー台数も増えていくことが予想されるため、このような負担が増加していくことはできれば避けたいです。そこで DojoPaaS の開発者である [@miya0001](https://twitter.com/miya0001) さんと協議し、今後の継続的な開発と運用を考慮して [YassLab 社でメンテナンスを引き継ぐ](https://github.com/coderdojo-japan/dojopaas/issues/110)形となりました。

#### 移行に関するご相談

![miya さんから承諾を得た様子](https://i.gyazo.com/d4c28a383b52079cd9e8cb1c8770339d.png)

#### 移行作業の様子
[![移行作業の様子](https://i.gyazo.com/f496cdb67ce9e1f2f106663c2a47eaea.png)](https://github.com/coderdojo-japan/dojopaas/issues/110#issuecomment-495046878)

  移行作業の具体的な様子は [coderdojo-japan/dojopaas#110](https://github.com/coderdojo-japan/dojopaas/issues/110) をご参照ください。現在は無事に内部システムが移行され、これまで通り DojoPaaS が動くことも確認済みです。

  なお、内部システムが変わっただけなので、利用者側への影響は特にありません。 **DojoPaaS を利用している CoderDojo 運営者が特別な対応をする必要はありませんので、ご安心ください 😌** 

<!--
##### オマケ: PaaS って何？
"Platform as a Service"の略で、読み方は「パース」です。PaaSは「サービスとしてのプラットフォーム」という意味で、お店で例えるならすでに電気・水道などのインフラがそろった、ショッピングセンターのテナントのようなものです。Railsチュートリアルで使用されている Heroku（へロク）もPaaS提供サービスの一つです✨
-->

## まとめ

これから更に活動しやすくなるような仕組みになるように、YassLab 社でも日々改善・開発に励んでいます💪 CoderDojo に興味がある方は、まずは[お近くにある道場](https://coderdojo.jp/events) へぜひ 😉

CoderDojo Japan: [https://coderdojo.jp/](https://coderdojo.jp/)

[![YassLab Inc.](/img/logos/800x200.png)](/)


