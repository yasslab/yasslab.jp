---
layout: default
title:  Railsチュートリアル試聴会
---

<script async class="speakerdeck-embed" data-id="5839a71956c44bf2891511e4f041fc76" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

<br />


Railsチュートリアル試聴会は、有償のRailsチュートリアル解説動画を<b>特定の場所のみ</b>で試聴可能にする取り組みです。試聴会は、次のような動画のストリーミング視聴の仕組みを整えることで実施することができます。

## 試聴の仕組み

<img src="/img/spinner.svg" data-src="/img/coedo-system.png" width='100%' alt='試聴の仕組み' class="lazyload" />

1. オフィス内の LAN に社内サーバーを立てます
	- UPnP 対応の NAS などが既にあれば、そのままご活用できます
2. サーバーに UPnP 対応のソフトウェアを導入する
	- 例えば、[ReadyMedia](http://minidlna.sourceforge.net/) (旧MiniDLNA) でUPnP対応ができます
	- cf. [ReadyMedia - archlinux wiki](https://wiki.archlinuxjp.org/index.php/ReadyMedia)
	- cf. [MiniDLNA - Ubuntu Community Wiki](https://help.ubuntu.com/community/MiniDLNA)
3. Railsチュートリアル解説動画を当該サーバーにコピーします
    - 準備ができたら {{ site.company.email }} までご連絡ください :)
4. [Kodi](https://kodi.tv/) をインストールして、Kodi を通して動画を試聴できるかどうか確認します
	- 参考: [Rails解説動画の試聴方法 - YassLab](https://yasslab.wistia.com/projects/ebtpo9ofbd)
5. 解説動画を使ったイベントを立て、周知をします
	- イベント例: [【営業日なら視聴可能】Ruby on Rails チュートリアル自習室](http://nilquebe.blogspot.jp/2016/12/ruby-on-rails.html) @ Nilquebe
	- イベント例: [【年末年始】Rails/Git/GitHub解説動画 視聴会【5日間定期券】
](https://coedo-dev.doorkeeper.jp/events/67821) @ Co-Edo
<br /><br />

## [Nilquebe](http://nilquebe.com/) のシステム構成例

> システム構成ですが、サーバには10年ほど前の自作PC（Intel Core2 Duo 2.5GHz, 4GB/500GB）を使用しました。メディアサーバは、ubuntu 12.04 + minidlnaです。
> 
> minidlnaはネット上の情報を参考にインストールしましたが、特にハマりどころはないかと思います。強いて言えば、ストリーミングデータを置くディレクトリの所有者を、minidlnaデーモンの実行ユーザと同じにしておくことぐらいでしょうか。
> 
> クライアントにはKodi（旧XBMC）を使用しました。Kodiは、Mac, Win, Linux版だけでなく、iOS版やAndroid版もあるので、今回は試していませんが、タブレットでスクリーンキャストを観ることも、技術的には可能です。
> 
> メディアサーバには、New RelicやMackerelなどの、いわゆるサーバ監視サービスを入れて、ホストの基本的なメトリクスを参照してみました。ホスト１台だけの監視なら、New Relic、Mackerelどちらも無料枠で試せました（ログは１日で消えていしまいますが）。取得できるメトリクスに大差はありませんが、ダッシュボードのビジュアライゼーションはNew Relicのほうがあか抜けていて見やすいという印象でした。
> 
> ストリーミングに必要なネットワーク帯域は、実測値で１ユーザあたり300kB/sec程度でした。Nilquebeはインターネットの上位回線があまり太くないのでローカルにメディアサーバを立てていますが、回線に余裕があれば、メディアサーバを利用する時のみクラウドで起動するという運用もありかもしれません（コスト的なところは、細かく計算していませんが）。
> 
> クライアントの接続によって、CPUの負荷が急に上がるような感じもありませんでした。（ディスクアクセスがメインだからでしょうか）。参加者が少なかったこともあり、あくまで感覚的な話になってしましますが、今のNilquebeのシステム構成でも、10人程度の同時視聴は問題なく捌けそうな印象でした。

<br />

# ビジネス側の仕組み

<img src="/img/spinner.svg" data-src="/img/coedo-usecase.png" width='100%' alt='Co-Edoでの提携事例' class="lazyload" />

- **参加者・利用者:** 有償の動画を試聴できる 👀
- **スペース提供者:** コンテンツを見に利用者が訪れる 🏃
- **解説動画提供者:** 有償動画の宣伝・コンバージョン 📹

上記の事例に限らず、状況に応じて様々な取り組みに対応可能です。もしご興味あれば下記フォームよりお問い合わせください。

<br />

<h3 id="contact">お問い合わせ</h3>

運営者: YassLab 株式会社 (代表取締役: 安川 要平)  
事務所: 東京都新宿区高田馬場1-28-10 三慶ビル4F [CASE Shinjuku](http://case-shinjuku.com/access/)  
