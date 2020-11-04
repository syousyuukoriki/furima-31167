

## users テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| nickname              | string       | null: false                   |
| email                 | string       | null: false                   |
| password              | string       | null: false                   |
| password_confirmation | string       | null: false                   |
| family_name           | string       | null: false                   |
| first_name            | string       | null: false                   |
| family_name_kana      | string       | null: false                   |
| first_name_kana       | sting        | null: false                   |
| birth_day             | date         | null: false                   |

### Association

- has_many :items
- has_many :buys

## items テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| item_name             | text         | null: false                   |
| introduction          | string       | null: false                   |
| category              | string       | null: false                   |
| item_condition        | string       | null: false                   |
| price                 | integer      | null: false                   |
| shipping_cost         | integer      | null: false                   |
| area                  | string       | null: false                   |
| days                  | integer      | null: false                   |
| user_id               | references   | foreign_key: true             |

### Association

- belongs_to :user
- belongs_to :buy

## buys テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| user_id               | references   | foreign_key: true             |
| item_id               | references   | foreign_key: true             |

### Association

- belongs_to :user
- has_many :items
- has_one :destination

## destinations テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| postal_code           | integer      | null: false                   |
| prefecture            | string       | null: false                   |
| city                  | string       | null: false                   |
| address               | string       | null: false                   |
| phone_number          | integer      | null: false                   |
| buy_id                | references   | foreign_key: true             |

### Association
- belongs_to :buy