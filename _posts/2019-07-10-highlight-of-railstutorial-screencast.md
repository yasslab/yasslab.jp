---
layout: post
title:  🎓 Railsチュートリアル解説動画の見所まとめ
thumbnail: news/cover-highlight-of-railstutorial-screencast.png
author: Yuppyhappytoyou
categories: [blog]
tags: [Railsチュートリアル]
---

<br>

Railsチュートリアル解説動画は約36時間以上の大ボリュームとなっており、１周終わってこれから２周目、３周目という方や、他言語から学ばれてきた方にも役立つ情報がたくさんあります。動画は授業形式になっており、何度も繰り返し見ることが可能です。テキスト版の予習・復習に、自分好みの使い方で理解を深めるのにきっと役立つはずです。

> 本記事は第4版 (Rails 5.1 対応) の紹介記事です。第6版 (Rails 6.0 対応) の見所については<a href='https://note.com/yasslab/n/n1c9375a76ffa' target='_blank'>2020年12月の記事</a>をご参照ください ✅

もちろん始めから全てを見てもらうのが一番なのですが、まずはその中で **「おすすめの解説箇所」**を厳選してみたので、[**30分の無料視聴**](https://railstutorial.jp/trial?utm_source=yasslab_trial)を有効に使っていただくのに、良ければ参考にしてみてください。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>

## 目次

##### 第１章〜第３章

- [Railsって何だろう？](#railsって何だろう)
- [Railsチュートリアルを始める](#railsチュートリアルを始める)
- [Gitを分かりやすくイメージする](#gitを分かりやすくイメージする)
- [MVCを理解する](#mvcを理解する)
- [テスト何のためにするの？](#テスト何のためにするの)

##### 第４章〜第７章

- [Rubyについて知る](#rubyについて知る)
- [データベースを理解する](#データベースを理解する)
- [変数の種類](#変数の種類)
- [form_for の中身](#form_for-の中身)

##### 第８章〜第９章

- [Sessions について知る](#sessions-について知る)
- [Helper はこうやって使う](#helper-はこうやって使う)
- [Ruby「&&」とは？](#rubyとは)
- [Ruby 自己代入演算子](#ruby-自己代入演算子)
- [クラス or インスタンスメソッド？](#クラス-or-インスタンスメソッド)
- [Cookies を使った認証の仕組み](#cookies-を使った認証の仕組み)
- [Ruby 複雑な if 文](#ruby-複雑な-if-文)
- [テストで活躍 「raise」](#テストで活躍-raise)
- [private メソッド とは？](#private-メソッド-とは)

##### 第１０章

- [HTTPリクエスト patch と delete](#httpリクエスト-patch-と-delete)
- [before フィルターについて](#before-フィルターについて)
- [フレンドリーフォワーディング](#フレンドリーフォワーディング)
- [２段階のリファクタリング](#２段階のリファクタリング)
- [Ruby の「!」と Rails の「!」は別物](#ruby-のと-rails-のは別物)

##### 第１１章〜第１２章

- [メール認証の仕組み](#メール認証の仕組み)
- [create と save の違い](#create-と-save-の違い)
- [メタプログラミングに触れる](#メタプログラミングに触れる)
- [テストで便利な「assigns」](#テストで便利なassigns)
- [beforeフィルターでリファクタリング](#beforeフィルターでリファクタリング)
- [Ruby 「不等号を使った時間」の読み方](#ruby-不等号を使った時間の読み方)

##### 第１３章

- [DB設計（モデリング）を体験する](#db設計モデリングを体験する)
- [Ruby「->」この矢印は何だ？](#ruby-この矢印は何だ)
- [親クラスへ移動させるリファクタリング](#親クラスへ移動させるリファクタリング)
- [パーシャルのエラーメッセージを使い回す](#パーシャルのエラーメッセージを使い回す)
- [一つ前のURLを返す request.referrer](#一つ前のurlを返す-requestreferrer)
- [accept でフロント側にもバリデーション](#accept-でフロント側にもバリデーション)

##### 第１４章

- [フォロー&フォロワーのモデル設計](#フォローフォロワーのモデル設計)
- [resourcesの新たな使い方](#resourcesの新たな使い方)
- [異なるアクションを１つのビューで実装](#異なるアクションを１つのビューで実装)
- [Ajax で Follow ボタンを実装する](#ajax-で-follow-ボタンを実装する)
- [SQL に触れる](#sql-に触れる)

##### 最後に

- [あとがき](#あとがき)

<!-- /TOC -->

## Railsって何だろう？

自分が今から学ぶものが世の中ではどのように利用されているのか、どんな特徴があるかを知っておくのは大事なことだと思います。**そもそもRailsとはどういうものなんだろう？** Railsを使ってどんなサービスが作れるようになるのだろう？という疑問を抱いている方に是非見てもらいたいのが、**「第２章 後編 １４.オマケ」**の部分です。

![Ruby/Railsの良い点・悪い点](/img/news/highlight-of-railstutorial-screencast-01.png)

Railsを利用する上で、知っておいたほうがいいことがギュッと詰まっているので、これからRailsを学ぶという方に是非知っておいて欲しいところです。

![学習時間と生産性](/img/news/highlight-of-railstutorial-screencast-02.png)

🔼Railsを使いこなせるようになるには、Railsチュートリアル１週した程度では程遠いよ、というのが分かる図。様々なデータと比較していて面白いし、奥が深いです。


## Railsチュートリアルを始める

今回**初めてRailsチュートリアルに挑戦**するという方に絶対見て欲しいと思うところが **「第１章 前編 Railsチュートリアルの進め方」**です。特に、**５. 前提知識 〜**を見ておくと、今後のRailsチュートリアル学習に役立つことがたくさん出てきます。

![大事な心構え](/img/news/highlight-of-railstutorial-screencast-03.png)

初心者に向けて心構えや、モチベーションを保つ為の方法など、これからの学習方法の参考になる話は興味深いです。Ruby / Rails の構造についても勉強になります。「rbenv」、使いこなそう！


## Gitを分かりやすくイメージする

Railsチュートリアルを進める上で **「 Git 」**につまづく方はかなり多いと思います。その「Git」について丁寧に説明されているのが **「第１章 後編 ９. Git によるバージョン管理」**です。ゲームのセーブ機能に例えて分かりやすく説明されています。

![Gitによるバージョン管理](https://i.gyazo.com/e13c49b678195becab42ec6431bcc83e.png)

初めてだとよく分からない部分も１行ずつ丁寧に教えてくれます。

![git-logターミナル](https://i.gyazo.com/7fc4e2eece80ed59eef0522aa44d6ea2.png)

実際に安川さんの操作するターミナルを見ながら学習できるので、とても分かりやすいです。有名なGitHubなどの説明もあります。その流れで「Heroku」についての解説もあるので、本番環境についてスムーズに理解できるようになっています。（本番環境にあげるための「Git」なんですね...！）


##  MVCを理解する

**「MVC」**の流れを理解したい方は **「第２章 前編 １１. MVCの挙動に触れてみる」**を見てみましょう。

![Railsのルーティング](https://i.gyazo.com/19f68c43655390035d6c771accddaf72.png)

MVC 全体の流れをスライド付きで説明してくれて、Rails ルーティングについての全体像についても分かります。この一通りの流れをrailsチュートリアルで少しずつやっていくので、初めての方はこの全てを今の段階では理解していなくても大丈夫です。**MVCの全体像を理解したい**方や、**Railsについてざっと復習したい**方におすすめです。


## テスト何のためにするの？

テストなんて一人で勉強してると使う場面はあまり出てこないし、そもそも**テストって必要なの？**とお思いの方は **「第３章 後編 １０. TDDの紹介とまとめ」**からの話を一度聞いてみると良いと思います。

テストは先に書くべき？後がいいの？などが分かりやすく解説されています。

![テストはいつ行う？](/img/news/highlight-of-railstutorial-screencast-07.png)

これからRailsを使ってお仕事をしたい！という方は「テスト」は必須になる知識だと思うので要チェックの箇所です。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>

## Rubyについて知る

Rubyって他の言語とどう違うのだろう？ **Rubyの特徴を知って上手に使いこなしたい**という方には **「第４章 前編 ９. Rubyの特徴」**から見るのがおすすめです。

![Rubyの特徴](/img/news/highlight-of-railstutorial-screencast-08.png)

安川さんの説明だとコードが「擬人化」されていて面白いので、テキストだけだと眠くなってしまいそうな話でも頭にすっと入ってきます。Pythonとの特徴の違いの話も参考になりますよ。Ruby は人間に寄り添った自由な言語だなと感じました。更に深い説明があるのが **「第４章 後編」**です。

![Ruby/Railsにおけるクラス階層](/img/news/highlight-of-railstutorial-screencast-09.png)

処理速度を計算して比べたり、結構深くRubyについて知ることができるので、何となくしか理解していなかった部分が腑に落ちるかもしれないですね。


## データベースを理解する

**データベース**は、これからの章を理解していくのに非常に大切な部分なので **「６章 前編 ３. Userモデルを生成する」**から、集中できる時にしっかり見ると良いです。**マイグレーションファイルの扱い方**などについても詳しい説明があります。

![Userモデル](/img/news/highlight-of-railstutorial-screencast-10.png)

説明を聞くと、Active Record を使うとデータベースとのやりとりが、こんなに楽になるんだ！ということが分かります。

![一意性の問題](/img/news/highlight-of-railstutorial-screencast-11.png)

興味深いのが、**「６章 後編 ８. 一意性の問題 」**のところです。ユーザーが同時に登録されないように回避させる方法の説明は非常に勉強になります。

パスワードの扱い方のお作法も学べます。便利なものがたくさんある Rails 凄いですね。ここでは、**「正規表現」**にも触れられます。初めての方には難しく感じられる部分だと思いますが、動画を見ながらなんとなくでも理解出来ると嬉しいですね。


## 変数の種類

**ローカル変数とインスタンス変数の違い**、例えば、`user` と `@user` の違い、皆さん分かりますか？それを見事に解決してくれるのが **「７章 前編 １０. 変数を定義する」〜** です。

![変数を定義する](/img/news/highlight-of-railstutorial-screencast-12.png)

短い説明で分かりやすく、変数のところは30分以内で聞けます。

![byebug](/img/news/highlight-of-railstutorial-screencast-13.png)

７章では HTTP リクエストについてや、if文の使い分け（前置・後置）、デバックの使い方、RESTful にコードを作るポイントやそのメリットなど、勉強になることが盛りだくさんです。自分の気になるところがあれば是非、覗いてみて下さい。


## form_for の中身

Railsは色々便利なのですが、formの中身はちゃんとHTMLで理解することが大事です。**form_for の中身**の確認方法が分かる **「７章 後半 ４. エラーメッセージを表示 」の後半部分**（44:50〜）が参考になります。

![ディベロッパーツール](/img/news/highlight-of-railstutorial-screencast-14.png)

ディベロッパーツールを使ってHTML化したものを見ながら、分からないものは更に調べたりしてみるとかなり理解が深まると思います。Railsで書いたものが、どのようにHTMLに変換されるのかが分かると嬉しいですね。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>


## Sessions について知る

**Sessions** も難しく感じる方が多いと思います。**「８章  前編 ２. Sessions リソースについて」**で詳しく見てみましょう。

![Sessionsリソース](/img/news/highlight-of-railstutorial-screencast-15.png)

ログインや、ログアウトは頻繁に行われることなので、毎回データベースにアクセスするよりもいい方法はありそう...🤔というところからの話、納得できます。これが分かれば「Sessions」について説明できるようになれますね。

![よく知られている攻撃の手口](/img/news/highlight-of-railstutorial-screencast-16.png)

また **「９章 １. セッション有効期限」**や、**「２. 攻撃手口の紹介」**の説明も短くて分かりやすいのでおすすめです。サービスごとに適切な期限を設けていなければならないことや、どのような攻撃の手口があるのか勉強になります。


## Helper はこうやって使う

**「８章  前編 １０. コントローラでヘルパーを使う 」1:20:08〜**を見ると、**Helper** についての説明が短くまとまっています。

![underfined_method_error](/img/news/highlight-of-railstutorial-screencast-17.png)

解説動画内では、スムーズにエラーなくすんなり進んでいくだけ、という訳ではありません。実際にエラー画面が出てきて、そこから安川さんが解決していくのを見ていくのが結構勉強になります。ここでは、Helper がうまく読み込まれていなかったので、それを解決しながらの実装です。

**＜おまけ＞**
この後、Bootstrap のJavaScript がうまく動かない、というトラブルに見舞われます。が、次の８章後編の冒頭でちゃんと解決されてるのでご安心を...！(どう解決したかもこれまた勉強になります。)


## Ruby「&&」とは？

プログラミングって、とりあえず同じ動きにするだけなら何通りも書き方がありますが、Rubyだと「if」文がこんなにシンプルに書けちゃうぞ、と関心させられるのが **「８章  前編 ５. ユーザーの検索と認証」32:25〜** からの説明です。

![ユーザーの検索と検証](https://i.gyazo.com/29507ccf1c0830228d9221537b543d76.png)

🔼結構難しいテクニックが使われているコードなのです。

![ユーザーの検索と検証を詳しく](/img/news/highlight-of-railstutorial-screencast-19.png)

一から噛み砕いて説明してくれるので、テキストだけじゃ分からないな...という方は、一度見てみると良さそうです。


## Ruby 自己代入演算子

![current_userメソッド](/img/news/highlight-of-railstutorial-screencast-20.png)

この記号を使ったコードも、戸惑う方は多いと思います。これを丁寧に分解して説明してくれるのが **「８章  前編 ８. session の使い方」の終わり 1:05:36〜** からです。

![current_userメソッド解説](/img/news/highlight-of-railstutorial-screencast-21.png)

これは先ほど上で紹介した[Ruby「&&」とは？](#rubyとは)を知っているとより分かりやすいと思うので、そちらと合わせて覗いてみるといいかと思います。こういう記法を取得できると、**コンピュータに無駄な処理をさせない**、一歩進んだプログラミングができそうですね。


## クラス or インスタンスメソッド？

解説動画には、各章の終わり（または安川さんが設けたほうが良いと思われる箇所）に質問コーナーがあり、動画内の生徒さんが良い質問を投げかけてくれます。これは Web テキスト版には無い内容で、動画を見ないと知れない様々な解説があります。

**「８章  後編 ７.  質問コーナー」**では、**メソッドの種類**について、生徒さんからの回答に答えながら分かりやすい説明があります。

![メソッドの種類解説](/img/news/highlight-of-railstutorial-screencast-22.png)

何気なく使っているメソッドが「こういうのがインスタンス（またはクラス）メソッドだったのか」と気付かされると思います。なんとなくで使っているよりも、ちゃんと理解して使えると嬉しくなりますね。


## Cookies を使った認証の仕組み

**Cookie** を利用して認証を行うのは結構複雑な内容になっていて、理解に苦しむ方も多いと思います。**「９章 ３. ログイン状態の保持」**を見てもらうと、セッションとクッキーの違いについて分かりやすく説明されています。

![Log_in完成予想図](/img/news/highlight-of-railstutorial-screencast-23.png)

🔼この「Remember me」の部分ですね。ログイン状態をどのように保持するのか？というところです。

![仮想敵カラム](/img/news/highlight-of-railstutorial-screencast-24.png)

ログイン状態の保持をするには **「仮想的カラム」**というものを自分で実装していかなければなりません。その中身を知れるのが、**25:09〜**からの説明です。一時的に保存はするけどデータベースには反映されない仕組みを作るんですね。Rubyの機能でそのセットは `attr_accessor` というもので用意されているんだぞ！という説明です。便利でびっくりですね。

９章の中でも特にしっかり理解するべきだと感じたのは **「 ５. ログイン状態の認証」**です。

![ログイン状態の認証](https://i.gyazo.com/360045fd85637133bd4eb882250bc07b.png)

この認証の流れはこの先も何度か出てくるので、ここを理解できるのとできないのとでは、今後大きな差が生まれてくるはずです。何度も理解できるまで繰り返し見ると効果的だと思います。


## Ruby 複雑な if 文

cookieを使った認証により、current_user メソッドを変化させる場面です。

![cookieに対応するユーザーを返すメソッド](/img/news/highlight-of-railstutorial-screencast-26.png)

```ruby
if (user_id = session[:user_id])
```
ここが比較ではなく代入と言われており、初学者には紛らわしいですね...><。そこで **「９章 ７. もう一度ログインを要求する」**から見てみましょう。

![cookieに対応するユーザーを返すメソッド解説](/img/news/highlight-of-railstutorial-screencast-27.png)

細かく分解して、詳しく説明してくれるのでとても助かります。


## テストで活躍 「raise」

どうやらこの **`raise`** というものは、テストの時に便利なテクニックらしいです。これを詳しく解説しているのが **「９章 １３. raise を入れるテクニック」**です。

![raise解説](/img/news/highlight-of-railstutorial-screencast-28.png)

raise　は問答無用であるものを発生させるコードのようですね。

![raiseの使い方](/img/news/highlight-of-railstutorial-screencast-29.png)

🔼raise を外すとどうなるのか...？を、具体的にどうやって使うのか分かりやすく解説されています。よく話を聞いていくと raise を使わなくても検知してくれる便利なサービスもある...？！そういった話も勉強になると思います。テスト網羅率についての話も興味深いです。


## private メソッド とは？

コントローラ内で見かける **`private`** という宣言。これをつけると何が起こるのか？という疑問に短くズバッと答えてくれているところが **「１０章 前編 ３. private メソッドについて」**です。

![privateメソッド](/img/news/highlight-of-railstutorial-screencast-30.png)

これを書かなくてもエラーにはならない、けれども書く。その理由がここで知れると思います。3分ほどの説明で納得できる説明が聞けるのでおすすめです。

**「１０章 前編 ９. before_action について 」1:01:30〜**からも private を使うときのポイントについて説明があります。

![privateメソッドを使うポイント](/img/news/highlight-of-railstutorial-screencast-31.png)

こちらも短い時間で聞けるので、ぜひご覧ください。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>


## HTTPリクエスト patch と delete

edit で使うフォームは、７章でやった「登録フォーム」とほぼ同じです。違うところは、HTMLの form タグ内にあるメソッド。ここも色々と不思議なことがあります。ここを詳しく説明してくれているのが **「１０章 前編 ６. HTMLとHTML 」**です。

![patchメソッド](/img/news/highlight-of-railstutorial-screencast-32.png)

ここも６分ほどで聞ける短い説明なので、HTTPリクエストについて勉強したことがない方は特に聞いてみるといいと思います。`patch` メソッドや、`delete` メソッドについて、HTTPリクエストの歴史から説明されているので、分かると楽しいところだと思います。Web の歴史に興味が湧いてきたら、更に自分で調べてみると楽しそうですね😁ブラウザの歴史なども調べてみると面白そうです。


## before フィルターについて

ログインしていないのに、他の人の情報を編集できちゃうような Web サービスは危険ですよね。ちゃんと、ログインをしている本人の情報だけを編集できるように実装しなければいけません。**「１０章 前編 ８. 認可について 」**では **beforeフィルター**をかけてその危険から守ってあげる方法が分かりやすく解説されています。

![before_action](/img/news/highlight-of-railstutorial-screencast-33.png)

メソッドを呼び出すときの書き方のポイントや、なぜ Ruby では「スネークケース」（アンダーバーを使用した書き方）を使うことが慣習とされているのかなどの豆知識も含まれていて、勉強になります。

さらに **「１０. 正しいユーザーか確認する」1:14:00〜** では、before アクションを書く順番についての解説があるので、ここも合わせてチェックしてみると良いと思います。

![before_action順番](/img/news/highlight-of-railstutorial-screencast-34.png)

before_action が実行される順番を理解すると、なぜこのコードでいいのか？が明確に分かるようになると思います。


## フレンドリーフォワーディング

１０章のこの部分です。
![フレンドリーフォワーディング](/img/news/highlight-of-railstutorial-screencast-35.png)

テキストだけだと分かりずらいかもしれないので、こういう所だけ動画で見ておくというのも有効な使い方かもしれないですね。**「１０章前編 １０. 正しいユーザーか確認する」1:19:00〜** に、再現した動画があります。

![不親切なリダイレクト](/img/news/highlight-of-railstutorial-screencast-36.png)

動画で見ると、同じところをユーザーさんにクリックさせるのは不親切だという事が感覚的に分かりやすく理解できると思います。こういうユーザーを配慮した細かい実装は、オリジナルアプリを開発する方にも参考になりそうですね。


## ２段階のリファクタリング

ユーザーの一覧表示するビューのリファクタリングです。
![パーシャルのリファクタリング](/img/news/highlight-of-railstutorial-screencast-37.png)

```
<%= render @users %>
```

たったこれだけでユーザーが一覧表示されていくのですが、実にシンプルです...。なぜこんなシンプルに書けるのか？をきちんと理解しないと混乱してしまう部分だと思うので **「１０章 後編 ８. リファクタリングする」**からの解説を聞いてみましょう。

![リファクタリング解説](/img/news/highlight-of-railstutorial-screencast-38.png)

２段階のリファクタリングを、順序立てて解説してくれるので分かりやすいです。Rails では「デフォルト値」を理解するのがとても大切です。**コードがシンプルになればなるほど、その裏ではどういう動きがあるのかを理解する必要がある**ので、ぜひこの解説を聞いて理解を深めてもらえればと思います。


## Ruby の「!」と Rails の「!」は別物

Railsチュートリアルで度々出てくる「!」メソッド。

![Railsにおける「!」](/img/news/highlight-of-railstutorial-screencast-39.png)

**「１０章 後編 ４. Faker Gem を使う」**で、`db/seeds.rb` にサンプルユーザーを作るコードで出てきた時は「例外を出すため」に使われていましたね。
Ruby の「!」は、Railsにおける「!」とは全く関係の無いもので **「破壊的メソッド」**と呼ばれているんですね。その違いを分かりやすく説明してくれている部分が **「１０章 後編 」の質問コーナー**です。

![破壊的メソッド解説](/img/news/highlight-of-railstutorial-screencast-40.png)

同じ「!」でも、Rails と Ruby、それぞれ違う意味があってややこしいですね。知らないと混乱してしまいそうです。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>


## メール認証の仕組み

『認証』は Railsチュートリアル内でこれまで何度か行なってきました。今回は**メール機能**を使っての認証です。

![アカウント有効化の流れ](/img/news/highlight-of-railstutorial-screencast-41.png)

大体の流れは今までと同じなのですが **「１１章 前編 ３. メール認証の仕組み」〜** でスライドを見ながらの説明を聞いて、確認しながら進めると良さそうです。

１１章からはこれまでの基礎的な内容を活かした応用的なものになっていて、１０章までを理解しているのが前提になっています。難しいと感じる時は、自分が納得いくまで復習するのも一つの方法かなと思います。説明を聞いてもよくわからない場合は、前回の認証の理解ができていない可能性があるので「６章 後編 １０. パスワードの実装」、「９章 ５. ログイン状態の認証」を順番に振り返って見ると良さそうです。

![Actionメーラー](https://i.gyazo.com/e4435b7267b1ea752e34c3edb77cce32.png)

Action Mailer の正体についての解説 **「１１章 前編 １０. Action Mailer の実態と実装 」**も興味深いのでおすすめです。


## create と save の違い

**「コールバック処理」**の時の、before_save と before_create の違いです。このふたつの違い説明できますか？

![before_save,before_cretate](https://i.gyazo.com/7f7399724b7da0ee42b0ebaebd89df1a.png)

**「１１章 前編 ７. メソッド参照用のメソッドを使う」**のところを見てみると、二つの違いについて明確に説明されています。細かい所なのですが、こういう所一つ一つをきちんと理解できると気持ちよく進めることができると思います。

![attr_accessor](/img/news/highlight-of-railstutorial-screencast-44.png)

`attr_accessor` がわからないという方はもう一度 [Cookies を使った認証の仕組み](#cookies-を使った認証の仕組み)を復習しましょう。


## メタプログラミングに触れる

１１章では、**メタプログラミング**というものに触れられています。

![メタプログラミング](/img/news/highlight-of-railstutorial-screencast-45.png)

テキストだけで見るとなんだか難しそうに思えますね...😭
**「１１章 後編 １. 認証情報を取得と比較 」〜** では「なぜ、メタプログラミングをするのか？」というところから説明があり、納得できる解説があります。

![authenticated?コピペ実装](/img/news/highlight-of-railstutorial-screencast-46.png)

🔼コピペ実装、これはDRYとは言えませんね...。どうすれば抽象化できるのか？

![sendメソッド](/img/news/highlight-of-railstutorial-screencast-47.png)

そこで、Ruby の「send」メソッドの紹介です。文字列を使えるようになると、うまくリファクタリングしながらDRYに出来そうです。Railsチュートリアル内ではうまく実装できるように設計されていたけど、実際に一から開発してこの技を使えるのは凄い事だぞ、という解説も面白いです。**設計は大事です！**


## テストで便利な「assigns」

１１章、ユーザー登録のテストに、メール認証のアカウント有効化を追加するところで出てくる **`assigns`メソッド**。９章の演習問題でも出てきていました。

![assignsメソッド演習問題](/img/news/highlight-of-railstutorial-screencast-48.png)

ですが、やはりテキストだけでは理解しづらい方もいると思うので、解説動画の **「１１章 後編 ９. assigns メソッド 」**を見てみましょう。スライド付きで説明されています。

![assigns質問コーナー](/img/news/highlight-of-railstutorial-screencast-49.png)

また、 **「１２章 後編 ９. まとめと質問コーナー 」**でも質問者さんから assigns メソッドについての質問があり、どういう場合に使用するのか？といった解説が聞けます。どちらも短い時間で聞けるので、知っていると便利な assigns、気になる方はぜひ覗いてみてください。


## beforeフィルターでリファクタリング

１２章のパスワードの再設定を実装する大事なコードの部分なのですが、コピペだけで進めていたら絶対に理解できないところなので、しっかりと学習するべきところです。**「１２章 後編 ４. パスワードの更新〜 ５. before_filter のもう一つの使い方」**では、テキスト版では触れられていない解説が盛りだくさんです。

![get_user](/img/news/highlight-of-railstutorial-screencast-50.png)

🔼フィルターらしくない使い方に見えますが、Railsの中では結構使われる手法だそうです。

![一見わかりづらいリファクタリング](/img/news/highlight-of-railstutorial-screencast-51.png)

🔼edit アクションは空なのに editフォームを見ると`@user`が宣言されている！これは分かりづらいかも...の場面。DRYに書くのはもちろん大事だけど、分かりづらくなるなら本末転倒かもしれない...と、色々と考えさせられる部分でした。興味深い内容なので、オススメの箇所です。


## Ruby 「不等号を使った時間」の読み方

１２章 User モデルにパスワード再設定用メソッドを追加する場面です。やりたい事は、パスワード再設定の期限を設定して、**2時間以上パスワードが再設定されなかった場合は期限切れにする**事ですね。

![不等号を使った時間](/img/news/highlight-of-railstutorial-screencast-52.png)

テキストでも説明があるのですが、時間の不等号は、なかなか理解が難しいですね。難しいと感じられる方は **「１２章 後編 6. パスワード更新４つの処理 」**のスライドをみながら説明を聞いてみると良さそうです。

**＜おまけ＞**
```ruby
# 時刻の演算
# 2.hours.since(reset_sent_at).past?
# の方が読みやすそう

2.hours.since(3.hours.ago).past?
# => true
2.hours.since(1.hours.ago).past?
# => false
```
🔼社内で紹介してもらったコードを掲載しておきます✨こんな風にも書けるんですね。([@hanachin_](https://twitter.com/hanachin_) さんありがとうございました。)

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>


## DB設計（モデリング）を体験する

１３章の Micropost モデルを作るところです。

<div align="center">
  <img src="/img/news/highlight-of-railstutorial-screencast-53.png" alt="Micropostデータモデル">
</div>
🔼表を見て、この通りにマイグレーションファイルを作成していけばいいのは分かる...。でも、どうやってカラムの種類を作るのか決めているんだろう？🤔テキスト版では「型」の説明に留まっていますが、解説動画 **「１３章 前編 １. Micropostの実装の進め方 」**ではモック画面を見ながら、どんな風に追加するカラムを決めていくのか見れるようになっています。

![Micropostをモデリングする](/img/news/highlight-of-railstutorial-screencast-54.png)

どの情報をDBに保存すべきで、どの情報はいらないのかを一緒に考えていくことができます。
いつかは自分で何か作りたい！と思われている方がほとんどだと思うので**モデリング**ができると可能性がグンと広がりそうですね。


## Ruby「->」この矢印は何だ？

１３章のマイクロポストを特定の順序で取得したい！の場面です。`default_scope` というものを使って DB さんにワガママを聞いてもらうところはテキスト版の説明でも分かりやすいと思いますが、「->」という記号について何だか難しい説明がありますね🤔

![ラムダ式](/img/news/highlight-of-railstutorial-screencast-55.png)

**「ラムダ式」**や **「Procオブジェクト」**など初めて聞く方も多いと思います。

![Proc](/img/news/highlight-of-railstutorial-screencast-56.png)

🔼「今すぐわからなくても心配いらない」けど、やっぱり気になってしまう...。そんな方は **「１３章 前編 ５. Micropostモデルの順序と依存 」**を見てみましょう。

![yield](/img/news/highlight-of-railstutorial-screencast-57.png)

🔼Railsでよく使われている「yield」も実はこの仕組みが使われているなど、興味深い解説があります。知れば知るほど、RailsやRubyの深い部分がどんどん気になりますね。


## 親クラスへ移動させるリファクタリング

マイクロポストの create アクションや destroy アクションにアクセス出来るのは、ログイン済みのユーザーでなければいけません。Users コントローラでも使った `logged_in_user` メソッドが使えそうです。しかし、ここで同じメソッドを Microposts コントローラにコピペ実装するべきか？を解説してくれるのが **「１３章 中編 ８. filter を使ってアクセス制限 」**です。

![logged_in_user](/img/news/highlight-of-railstutorial-screencast-58.png)

この解説動画で何度も言われている通り、同じコードを書くというのは Rails の設計思想の「DRY」に反してしまいますね...。

![リファクタリングしたlogged_in_user](/img/news/highlight-of-railstutorial-screencast-59.png)

複数のコントローラをまたいで、同じアクションがある場合はこんな風に書けば、DRYに実装していけるという事が分かります。これはビューでもモデルでも同じ事が言えるので、クラス継承を上手く使ったリファクタリング術を覚えていきましょう。


## パーシャルのエラーメッセージを使い回す

１３章、マイクロポスト投稿フォームに、エラーメッセージのパーシャルを付けているところです。

![マイクロポスト投稿フォームのパーシャル](/img/news/highlight-of-railstutorial-screencast-60.png)

ここの render に引数 `object: f.object` が渡されているところですが、理解が難しいかもしれません。**「１３章 後編 ２. Micropost の投稿フォーム 」**でこの部分を詳しく解説しています。

![_error_messagesのリファクタリング](/img/news/highlight-of-railstutorial-screencast-61.png)

🔼_error_messages内のコードを @user でも @micropost でも使えるようにしたい。

![renderの引数](/img/news/highlight-of-railstutorial-screencast-62.png)

`shared/error_messages` にオプションで引数を渡すとなにが起こるのか？を理解できると一気に分かるようになると思うので、テキストだけでは難しい方におすすめの解説箇所です。

[Railsガイド](https://railsguides.jp/layouts_and_rendering.html#%E3%83%91%E3%83%BC%E3%82%B7%E3%83%A3%E3%83%AB%E3%82%92%E4%BD%BF%E7%94%A8%E3%81%99%E3%82%8B)を見ると他にもいろんな事が出来ることが分かります。更に詳しく知りたい方はご覧ください。


## 一つ前のURLを返す request.referrer

マイクロポストを削除する場面です。

![Micropostsコントローラのdestroyアクション](/img/news/highlight-of-railstutorial-screencast-63.png)

🔼correct_user フィルターを使って、他の人の投稿は削除できないようにします。ここの destroy アクションに出てくる `request.referrer || root_url` というコードが少し難しいかもしれません。

**「１３章 後編 ７. マイクロポストを削除」の後半部分**を見てみると、このコードについて詳しく説明があります。

![redirect_to request.referrer](/img/news/highlight-of-railstutorial-screencast-64.png)

🔼一つ前のページには、何パターンあるか？の場面。これを覚えると便利そうですね。 `request.referrer` にまつわる[ちょっと面白い記事](https://qiita.com/syshun/items/0d3436e32ad6d39e206d)も発見したので載せておきます。


## accept でフロント側にもバリデーション

**「１３章 後編 １０. 画像の加工や検証 」**では、画像を投稿する際にフロント側でもバリデーションをかけてあげる方法について学べます。ここの場面は実際に動画内のファイルアップローダーを見ながら進められているので、テキストだけの時よりも体感的に学べます。

![画像選択画面で動画も選択できてしまう問題](https://i.gyazo.com/65b96ec4ad0bf8a9a58f64ba2999df34.png)

🔼バックエンドで投稿できる画像の種類を指定してバリデーションをかけてあげても、まだ選択できてしまうしアップロード自体はできてしまう。（アップロード後、バリデーションのエラーメッセージが出る。）初めから選べないようにするにはどうすればいいのだろう？

この部分は Rails の機能ではなくHTML の機能の解説です。Railsチュートリアルでは、この他にも jQuery を使ったファイルサイズの制限をフロント側でお知らせする機能も学習できるようになっています。幅広い知識を学べるようになっているんですね。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>


## フォロー&フォロワーのモデル設計

１４章の**フォローとフォロワーをどう設計するか？**を理解するのは難しいところだと思います。Micropost モデルを真似て設計しようとすると、なかなか難しそうですね。今までのユーザーやマイクロポストモデルとどこが違って難しく感じるのでしょうか？まずはフォローするとはどういう事か、から丁寧に解説してくれるのが **「１４章 前編 」**です。

![関係性に注目](/img/news/highlight-of-railstutorial-screencast-66.png)

この実装方法は **「１４章 前編 ４. Relationshipモデルの実装 」**からをじっくり聞いてみると、テキストだけだと分かりづらい部分が理解しやすくなっています。中でも **「８. active_relationships の確認」の 38:55〜** からの説明は **`belongs_to` や `has_many` の実態**について説明されていて、これまでモヤモヤしていたことが一気に解消される方が多いのではないかと思います。

![has_manyの実態](/img/news/highlight-of-railstutorial-screencast-67.png)

`has_many` 、`attr_accessor` など、エディタ内で色が付いているのには、**ある役割**があるからだったのです。ここはぜひ聞いてほしいおすすめの箇所です。

**「１４章 前編 １１. 質問コーナー 」の 1:00:42〜** では、モデル設計の大事さも知ることができます。

![fat コントローラ問題](/img/news/highlight-of-railstutorial-screencast-68.png)

**「１４章 前編 １３. メソッドを定義する場所 」**では「fat コントローラ問題」というものについて解説があります。これもDRYに書くための大事な思想なので勉強になります。


## resourcesの新たな使い方

**「１４章 後編 ３. following と follower の routing を追加する 」**の部分です。今まで、`resources :users` というルーティングを使っていました。この１行で色んなルーティングが作られ、とても便利でしたね。

![memberメソッド](/img/news/highlight-of-railstutorial-screencast-69.png)

今回は、更に好きなルーティングを追加する方法を学びます。[Railsガイドの member ルーティングの解説](https://railsguides.jp/routing.html#restful%E3%81%AA%E3%82%A2%E3%82%AF%E3%82%B7%E3%83%A7%E3%83%B3%E3%82%92%E3%81%95%E3%82%89%E3%81%AB%E8%BF%BD%E5%8A%A0%E3%81%99%E3%82%8B)も分かりやすいですよ。


## 異なるアクションを１つのビューで実装

**「１４章 後編 ８. Following と Followers の実装 」**のところです。

![FollowingとFollowersページ](/img/news/highlight-of-railstutorial-screencast-70.png)

アクションは違うけど、一つのビューをうまく使い分けて共通で使えるものにしていこうという実装方法です。

![FollowingとFollowersページ実装](/img/news/highlight-of-railstutorial-screencast-71.png)

チュートリアル内ではこのような実装方法もできるよという紹介にすぎず、実装方法はアイデア次第で色んなことができるので「この実装方法の方がクールだ」というのを見つけてみるのも面白そうですね。


## Ajax で Follow ボタンを実装する

Rails チュートリアルでは、Follow・Unfollow ボタンの実装方法を２通り紹介してくれています。応用編として、**Ajax** を使った実装方法を紹介してくれているのが **「１４章 後編 １２. Followボタン ajax 実装編 」**です。

![２通りのFollow・Unfollowボタンの実装方法](/img/news/highlight-of-railstutorial-screencast-72.png)

変更させたい部分だけを JavaScript の力を使ってさっと変えてあげるという技が Ajax です。

![Followボタンを押して変わる部分](/img/news/highlight-of-railstutorial-screencast-73.png)

🔼 Follow ボタンを押して、変わる部分はどこだろう？

ここでは **「JavaScript は使う場所を吟味し、多用するべからず」**といった、テキスト版では触れられていない話が聞けます。一見、便利そうで色んなところで使いたくなる Ajax だけど慎重に使うべきだという興味深い内容になっています。Ajax の実装方法も分かりやすく解説されてるので、詳しく知りたい方はぜひ聞いてみてください。

その中で出てくる `respond_to` メソッドについては **「１４章 後編 ２０. 質問コーナー 」2:04:30〜** 付近でもかなり詳しく解説があるので、合わせて見てみると更に理解が深まると思います。

![.md実演](/img/news/highlight-of-railstutorial-screencast-74.png)

.jsonや.mdを使った実際のブラウザ画面も見せてくれたりと、チュートリアルの内容にとどまらず様々なことが学べるのも解説動画のいいところですね。

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>


## SQL に触れる

**「１４章 後編 １４. ステータスフィードを完成させる 」**から、最後の難関「ステータスフィード」の実装です。

![ステータスフィードのモック](/img/news/highlight-of-railstutorial-screencast-75.png)

Twitterでいうタイムラインのようなものですね。この部分では「 SQL 」に触れられていて、結構難しく感じる方も多いと思います。

![micropostsの和集合](/img/news/highlight-of-railstutorial-screencast-76.png)

解説動画では SQL 文に初めて触れるという方でも分かりやすいように説明がありますが、[Rails チュートリアルの前提知識](https://railstutorial.jp/chapters/beginning?version=5.1#sec-prerequisites)の部分でもあるように、 Progate の「SQL コース」などで基礎的なところを学習しておくと、もっと楽に頭に入ってくると思います。

**「１４章 後編 １８. サブセレクトを使う 」**からは、複雑な検索結果も高速に引っ張ってこれるSQLの技について学べます。

![SQL文](/img/news/highlight-of-railstutorial-screencast-77.png)
この SQL 文を 読みやすく式展開して書いてみよう、の場面です。

![SQL文を読みやすく式展開](https://i.gyazo.com/af43f51756f87e49e91ea8fe427d77b1.png)

テキストだけだと難しく感じられる部分ですが、うまく解説動画を利用しながら理解していただければと思います。


## あとがき

この解説動画では、テキスト版だけでは理解しづらい部分を丁寧に解説してもらえるだけではなく、チュートリアルの内容以外の様々なことを学ぶ事ができます。

現場により近い具体的な説明を聞くことで、ぐっと知識が深まると思います。これからプログラミングを学んでいく方にはもちろん、更に知識の定着をはかってみたい方にもお勧めできる動画です。きっと見て下さった皆さんに、それぞれ色んな気付きがあると思います😊

<div class="center">
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial"><img alt="Railsチュートリアル解説動画 - お試しプラン" src="https://railstutorial.jp/images/trial/main-img.jpg" /></a>
  <a href="https://railstutorial.jp/trial?utm_source=yasslab_trial">Railsチュートリアル解説動画 - お試しプラン</a>
  <br><br><br>
</div>

今回私は[「法人プラン」](https://railstutorial.jp/business)で動画を見させていただいたのですが、社員研修などで大いに役立ってくれそうだと思うので、ご紹介させていただきます。

[![社員研修でお困りの方](/img/news/highlight-of-railstutorial-screencast-79.png)](https://railstutorial.jp/business)

![ダッシュボード](/img/news/highlight-of-railstutorial-screencast-80.png)

🔼こんな風にダッシュボードで簡単に管理ができ、全員分の動画を買うよりもコストがかからないので、研修にピッタリですね✨

![メンバー一覧](https://i.gyazo.com/e767a457457ce4416f6c6982cce821d2.png)
🔼（ダントツで見てるのが私です...!!）


それでは最後まで本記事を見て頂き、ありがとうございました。Railsチュートリアル解説動画が、皆さんの学習のお役に立てれば嬉しく思います。
