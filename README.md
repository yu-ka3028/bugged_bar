# README

# 画面遷移図

```
  A[トップ画面] -->|ゲームスタート| B(カクテル注文画面)
  B -->|注文| C{注文結果判定}
  C -->|正解| AorD(注文履歴確認)
  C -->|不正解| BorD(注文履歴確認)
```
- A: /top/index.html.erb //TOPページ
- B: /drinks/new.html.erb //新規登録
- C: /drink/index.html.erb //保存し、結果判定と注文一覧
- D: /drink/show.html.erb //注文履歴（次のデバッグ注文をどうするか吟味するページ）

# テーブル設計
```
Table drinks {
  id integer [primary key]
  name string [unique, not null]
  description text
  created_at timestamp
  updated_at timestamp
}

Table elements {
  id integer [primary key]
  name string [unique, not null]
  created_at timestamp
  updated_at timestamp
}

Table drink_elements {
  drink_id integer [not null]
  element_id integer [not null]
  is_required boolean [not null, default: false]
  primary key (drink_id, element_id)
}

Ref: drink_elements.drink_id > drinks.id
Ref: drink_elements.element_id > elements.id
```

# ロジックの基本前提部分
### 1. 必須要素を被らない設定
- 各カクテルの必須要素（消えない要素）をユニークに設定する。
- 各カクテルが必ず異なる特徴を持つようになる。

### 2. ランダムで消える可変要素
- 必須要素以外の材料からランダムで1つを削除。
- 削除された結果から、ユーザーがロジックを推測していく。

### 3. デバッグ可能な設計
- 必須要素と可変要素の組み合わせが適切であることを事前に検証。
- 必須要素だけで成立しない飲み物が生じないように注意。
