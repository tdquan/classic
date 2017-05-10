class ClassicMailerPreview < ActionMailer::Preview
  def welcome
    user = Spree::User.first
    ClassicMailer.welcome(user)
  end

  def new_order(order)
    @order = order
    mail(to: @order.email, subject: 'Votre commande sur Classic')
  end
end
