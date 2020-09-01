class Order < ApplicationRecord
  # validates :item_name, presence: true
  # validates :price, presence: true
  # validates :quantity, presence: true
  # validates :payment_method, presence: true
  belongs_to :user
  has_many :join_table_item_orders
  has_many :items, through: :join_table_item_orders
end
