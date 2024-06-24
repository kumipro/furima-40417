class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :city, :block_number, :building_name, :phone, :token

 
  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city
  validates :block_number
  validates :phone, format: {with: /\A[0-9]{10,11}+\z/, message: "is invalid"}
  validates :user_id
  validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)

    Address.create(order_id: order.id,post_code: post_code, region_id: region_id, city: city, block_number: block_number, building_name: building_name, phone: phone)
  end

end