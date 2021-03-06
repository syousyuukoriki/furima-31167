class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal_code, format:{with:/\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, format:{with:/\A[0-9]+\z/}, length: {maximum: 11}
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Destination.create( postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end