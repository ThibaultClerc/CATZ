class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :orders

  after_create :create_cart, :welcome_new_user

  def create_cart
    Cart.create(
      user_id: User.last.id
    )
  end

  def welcome_new_user
    UserMailer.welcome_new_user(self).deliver_now
  end

end
