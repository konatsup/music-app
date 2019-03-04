# MUSIC APP

## 一言で

20 秒で新しい音楽と出会える楽曲投稿サービス(音楽版 TikTok)

## 背景

## ターゲットユーザ

## 使い方

### 投稿する側

1. ログイン
2. 投稿画面へ移動し、楽曲を投稿

## 見る側

1. アプリを起動
2. 20~30 秒程度の音楽のリストを再生、アプリを閉じる
3. バックグラウンド再生
4. 気になる曲が出たら、アプリに戻り「プレイリスト」に追加ボタンを押す
5. プレイリスト画面で、フルバージョンの再生ができる

## 機能

### コア機能

#### Web 側

- 楽曲の投稿
- 投稿一覧の表示
- 投稿の表示

#### アプリ側

- 楽曲の再生
- プレイリストの作成
- プレイリスト一覧の表示

### 残り機能

- 新規登録
- ログイン
- ログアウト
- ユーザ情報の表示
- シェア機能
- タグ検索機能

## DB 設計

### User

| カラム名        | 型       | 説明                 |
| --------------- | -------- | -------------------- |
| id              | integer  | ユーザ ID            |
| name            | string   | ユーザ名             |
| password_digest | string   | パスワード           |
| icon_url        | string   | ユーザアイコンの URL |
| created_at      | datetime | 作成された時刻       |
| updated_at      | datetime | 更新された時刻       |

has_many :posts

### Post

| カラム名    | 型         | 説明                 |
| ----------- | ---------- | -------------------- |
| id          | integer    | ID                   |
| title       | string     | 曲のタイトル         |
| description | string     | 曲の説明             |
| image_url   | string     | ジャケット画像の URL |
| music_url   | string     | 音声データの URL     |
| created_at  | datetime   | 作成された時刻       |
| updated_at  | datetime   | 更新された時刻       |
| user        | references | 投稿したユーザ       |

belongs_to :user

### Tag

| カラム名 | 型      | 説明   |
| -------- | ------- | ------ |
| id       | integer | ID     |
| name     | string  | タグ名 |

belongs_to :user

## URI 設計

| action | path              | 説明                                    |
| ------ | ----------------- | --------------------------------------- |
| get    | /                 | 全ユーザの投稿を表示                    |
| get    | /signup           | 新規登録画面を表示                      |
| get    | /posts/new        | 投稿画面を表示                          |
| get    | /signout          | ログアウト処理をし`/`へリダイレクトする |
| get    | /posts/:id/delete | Post の削除                             |
| post   | /signin           | ログイン処理し`/`へリダイレクトする     |
| post   | /signup           | 新規登録処理をする                      |
| post   | /posts/new        | Post の投稿                             |
| post   | /posts/:id/update | Post の更新                             |

## View 設計

| path       | 概要         | できること                               |
| ---------- | ------------ | ---------------------------------------- |
| /          | top ページ   | (未認証時)ログイン、全ユーザの投稿を表示 |
| /signup    | 新規登録画面 | 新規登録                                 |
| /posts/new | 検索ページ   | 検索、検索結果の表示、その場でのコメント |
