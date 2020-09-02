class OrderMailer < ApplicationMailer

  def new_order_mail_to_client(order)
    @order = order
    @url  = 'https://production-cats.herokuapp.com/login' 
    mail(to: @order.user.email, subject: "Confirmation de commande n°#{order.id}") 
  end
  
end
