[![Build Status](https://travis-ci.org/yasslab/yasslab.jp.svg?branch=master)](https://travis-ci.org/yasslab/yasslab.jp)

# Website for YassLab Inc.

This repository includes source code to build [YassLab](https://yasslab.jp/)'s website.

YassLab Inc.   
Having a Good Life with OpenSource ;)     
https://yasslab.jp/

## セットアップ方法
ローカルで開発・デザインをする場合は、次の２つが必要です。

1. Jekyll (必須)
2. npm (デザインを修正するときのみ)

### Jekyll

Jekyll を使って localhost 上にWebサイトを表示します。

1. `bundle install`
    - 初回のgemのインストール
2. `bundle exec jekyll server`
    - ローカルサーバーの立ち上げ
3. ブラウザで `localhost:4000` にアクセス
    - 成功すれば [yasslab.jp](https://yasslab.jp/) と同じ画面が表示される

### npm

(任意) デザインを修正する場合は npm も立ち上げる必要があります 

1. `npm install`
    - 初回のnpmのインストール
2. `npm run css`
    - cssのコンパイル
3. `npm run watch`
    - sassファイルの監視

## About ICON

The icons used in the website are created by [Font Awesome](http://fontawesome.io/), licensed under SIL OFL 1.1.

## Copyright

Copyright &copy; [YassLab Inc.](https://yasslab.jp) since 2012

[![YassLab 株式会社ロゴ](https://yasslab.jp/img/logos/800x200.png)](https://yasslab.jp/)
