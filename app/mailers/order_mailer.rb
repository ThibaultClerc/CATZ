class OrderMailer < ApplicationMailer

  def new_order_mail_to_client(order)
    @order = order
    @url  = 'https://production-cats.herokuapp.com/login' 
    mail(to: @order.user.email, subject: "Confirmation de commande n°#{order.id}") 
  end

  def new_order_mail_to_admin(order)
    @order = order
    @url  = 'https://production-cats.herokuapp.com/admin' 

    admins = User.where(admin: true)
    admins.each do |admin|
      mail(to: admin.email, subject: "Nouvelle commande n°#{order.id}") 
    end
  end
end
