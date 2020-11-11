

## users テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| nickname              | string       | null: false                   |
| email                 | string       | null: false                   |
| encrypted_password    | string       | null: false                   |
| family_name           | string       | null: false                   |
| first_name            | string       | null: false                   |
| family_name_kana      | string       | null: false                   |
| first_name_kana       | string        | null: false                  |
| birth_day             | date         | null: false                   |

### Association

- has_many :items
- has_many :buys

## items テーブル

| column                | Type         | Options                       |
| --------------------- | ------------ | ----------------------------- |
| item_name             | string       | null: false                   |
| introduction          | text         | null: false                   |
| category_id           | integer      | null: false                   |
| item_condition_id     | integer      | null: false                   |
| price                 | integer      | null: false                   |
| shipping_cost_id      | integer      | null: false                   |
| area_id               | integer      | null: false                   |
| day_id                | integer      | null: false                   |
| user                  | references   | foreign_key: true             |

### Association

- belongs_to :user
- has_one :buy

## orders テーブル

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
| prefecture_id         | integer       | null: false                  |
| city                  | string       | null: false                   |
| address               | string       | null: false                   |
| building_name         | string       |                               |
| phone_number          | string       | null: false                   |
| order                 | references   | foreign_key: true             |

### Association
- belongs_to :order