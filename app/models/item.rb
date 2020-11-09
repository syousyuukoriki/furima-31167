class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :category
  belongs_to :day
  belongs_to :item_condition
  belongs_to :shipping_cost

  with_options presence: true do
    validates :item_name
    validates :introduction
    validates :category_id,        numericality: { other_than: 1 } 
    validates :item_condition_id,  numericality: { other_than: 1 } 
    validates :price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
    validates :shipping_cost_id,   numericality: { other_than: 1 } 
    validates :area_id,            numericality: { other_than: 0 } 
    validates :days_id,            numericality: { other_than: 1 } 
    validates :user
    validates :image
  end

end
