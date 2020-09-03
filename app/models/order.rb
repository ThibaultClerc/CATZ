class Order < ApplicationRecord

  after_create :new_order_mail


  # validates :item_name, presence: true
  # validates :price, presence: true
  # validates :quantity, presence: true
  # validates :payment_method, presence: true
  belongs_to :user
  has_many :join_table_item_orders, dependent: :destroy
  has_many :items, through: :join_table_item_orders

  private

  def new_order_mail
    OrderMailer.new_order_mail_to_client(self).deliver_now
    OrderMailer.new_order_mail_to_admin(self).deliver_now
  end
  
end
