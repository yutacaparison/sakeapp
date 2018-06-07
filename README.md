Sake app
====
https://sakeapp.herokuapp.com/

## Description
最近飲んだ日本酒の投稿と、日本酒について語るブログを書けるサイトです。

## Requirement
- ruby 2.3.0
- Rails 5.1.6
- PostgreSQL 10.4
- Bootstrap 3

## Function
- 日本酒投稿機能
- ブログ投稿機能

## Usage
このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。

```
$ git clone git@github.com:yutacaparison/sakeapp.git
```

次に、以下のコマンドで必要になる Ruby Gems をインストールします。

```
$ bundle install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

これで、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

## Author

[yutacaparison](https://github.com/yutacaparison)
