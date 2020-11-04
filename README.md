

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
| item_name             | string       | null: false                   |
| introduction          | text         | null: false                   |
| category              | string       | null: false                   |
| item_condition        | integer      | null: false                   |
| price                 | integer      | null: false                   |
| shipping_cost         | integer      | null: false                   |
| area                  | integer      | null: false                   |
| days                  | integer      | null: false                   |
| user                  | references   | foreign_key: true             |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| user                  | references   | foreign_key: true             |
| item                  | references   | foreign_key: true             |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

## destinations テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| postal_code           | string       | null: false                   |
| prefecture            | string       | null: false                   |
| city                  | string       | null: false                   |
| address               | string       | null: false                   |
| building_name         | string       | null: false                   |
| phone_number          | string       | null: false                   |
| buy                   | references   | foreign_key: true             |

### Association
- belongs_to :buy