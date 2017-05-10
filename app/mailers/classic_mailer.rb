class ClassicMailer < ActionMailer::Base
  default from: 'contact@classic-paris.com'

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenu sur Classic!')
  end

  def new_order(order)
    @order = order
    mail(to: @order.email, subject: 'Votre commande sur Classic')
  end
end
