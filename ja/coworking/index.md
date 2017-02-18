---
layout: default
title:  コワーキング×試聴会の提案 – YassLab
lang:   ja
---

<script async class="speakerdeck-embed" data-id="a1f6637f449a482794c7c99d1b542ac3" data-ratio="1.33333333333333" src="//speakerdeck.com/assets/embed.js"></script>

<br />

## 試聴の仕組み

<img src="/img/coedo-system.png" width='100%' alt='Slides' />

1. コワーキングスペース内のLANにサーバーを設置する
	- UPnPに対応できるNASなどが既にあれば、そのまま活用できます
2. サーバーにUPnP対応できるソフトウェアを導入する
	- 例えば、[ReadyMedia](http://minidlna.sourceforge.net/) (旧MiniDLNA) でUPnP対応ができます
	- cf. [ReadyMedia - archlinux wiki](https://wiki.archlinuxjp.org/index.php/ReadyMedia)
	- cf. [MiniDLNA - Ubuntu Community Wiki](https://help.ubuntu.com/community/MiniDLNA)
3. YassLab 側が所有する解説動画を当該サーバーにコピーします
    - 準備ができたら yohei@yasslab.jp までご連絡ください :)
4. [Kodi](https://kodi.tv/) をインストールして、Kodi を通して動画を試聴できるかどうか確認します
	- 参考: [Railsライブ収録動画の試聴方法 - YassLab](https://yasslab.wistia.com/projects/ebtpo9ofbd)
5. コワーキングスペース利用者に対して、有償動画が試聴できることを周知します
	- 参考: [『Ruby on Rails チュートリアル』ライブ収録動画 視聴会](https://coedo-rails.doorkeeper.jp/events/54204)
	- 参考: [【営業日なら視聴可能】Ruby on Rails チュートリアル自習室](http://nilquebe.blogspot.jp/2016/12/ruby-on-rails.html)
<br /><br />

## 事例: 神戸の [Nilquebe](http://nilquebe.com/) の場合

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

<img src="/img/coedo-usecase.png" width='100%' alt='Co-Edoでの提携事例' />

- **参加者・利用者:** 有償の動画を試聴できる 👀
- **スペース提供者:** コンテンツを見に利用者が訪れる 🏃
- **解説動画提供者:** 有償動画の宣伝・コンバージョン 📹

上記は Co-Edo と YassLab 社における提携事例ですが、上の事例に限らず、状況に応じて様々な取り組みが考えられるかなと考えております🤔

<br />

## 事例: 神戸で動画試聴した人の感想

> 感覚として、無料の学習リソースがたくさんある中で、Ruby/Railsに限らず何かを学び始める時にお金を払うことについてはためらいががある、ということでした。
> 
> 地域や年齢で感覚は異なるかと思いますが、Nilquebeで平日夜２時間のイベントとしてRailsスクリーンキャストDaysを開催するのは、参加者からみたメリットが、あまりなさそうです。

<br />

<h3 id="contact">お問い合わせ</h3>

運営者: YassLab (代表: 安川 要平)  
メール: _yohei@yasslab.jp_   
事務所: 〒169-0075 東京都新宿区高田馬場1-28-10 三慶ビル4F [CASE Shinjuku](http://case-shinjuku.com/access/)  

もしご興味ありましたら、<i>yohei@yasslab.jp</i>または下記のフォームよりご連絡ください。  

<br /><br />
