[![Build Status](https://travis-ci.org/yasslab/yasslab.jp.svg?branch=master)](https://travis-ci.org/yasslab/yasslab.jp)

[![Cover Photo of YassLab Inc.](https://yasslab.jp/img/cover-photo_ss.png)](https://yasslab.jp/ja/)

# Website for YassLab Inc.

This repository includes source code to build [YassLab](https://yasslab.jp/)'s website.

YassLab Inc.   
Having a Good Life with OpenSource ;)     
https://yasslab.jp/

## お知らせ記事の追加

お知らせ記事の追加には **環境構築は不要** です。GitHub アカウントがあれば追記できます :blush:

多分これが一番簡単だと思います...!! 😆

1. ブラウザ上で [_data/news.yml](https://github.com/yasslab/yasslab.jp/blob/master/_data/news.yml) を開く
2. 画面右にある ✎ アイコン (Fork this project and edit this file) をクリックする
3. お知らせ情報を追記する
   - `title:` リンク先の記事のタイトル
   - `date:` リンク先の記事の公開日
   - `url:` リンク先の記事のURL
4. 修正内容にタイトルと説明文を付け、Propose file change をクリックする
5. 修正内容を確認し、問題なければ Create pull request をクリックする

以上で完了です。追記されたお知らせは他のメンバーによって再確認され、問題なければ提案された内容が反映されます。もし問題があっても他のメンバーが気付いて修正することもできるので、まずはお気軽に提案してみてください ;)


## 開発手順
ローカル環境で開発・デザインをするときは [Jekyll](https://jekyllrb.com) が必要です。   
次の手順でセットアップし、ローカルサーバーを立ち上げてください。

1. `$ bundle install`
    - (初回のみ) gem ライブラリのインストール
2. `$ bundle exec jekyll server`
    - ローカルサーバーの立ち上げ
    - 立ち上がったらブラウザから `localhost:4000` にアクセス

成功すれば [yasslab.jp](https://yasslab.jp/) と同じ画面が表示されます。
その後、開発・修正したいファイルを適宜編集していきます。(再起動は不要)

## About Images
Nota Inc. 様の許諾をいただき、  
本Webサイトでは画像ホスティングの一部に Gyazo を使わせて頂いております。

> ### Q.
> Gyazo にアップロードした画像についてですが、   
> アップロードした画像を弊社のブログ記事から参照することは可能でしょうか?   
> ブログ記事の例: https://yasslab.jp/ja/news/coderdojo-japan-2018
>
> ### A.
> お問い合わせの件につきまして、ご丁寧にお問い合わせくださりどうもありがとうございます。   
> お客様のブログの参照先にGyazoをご利用になられるとのこと、     
> 特に問題はございませんのでご自由にお使いください。     
> Gyazoをご活用くださり、うれしく思います。

## About ICON

This website uses icons created by [Font Awesome](http://fontawesome.io/), licensed under SIL OFL 1.1, and [Twemoji](https://github.com/twitter/twemoji), created by Twitter, licensed under the [MIT License](http://opensource.org/licenses/MIT).

## About CSS

This website uses [Bootstrap](https://getbootstrap.jp/), created by Twitter licensed under the [MIT License](http://opensource.org/licenses/MIT).

## Copyright

Copyright &copy; [YassLab Inc.](https://yasslab.jp) 2012-2020

[![YassLab 株式会社ロゴ](https://yasslab.jp/img/logos/800x200.png?cache=clear)](https://yasslab.jp/)
