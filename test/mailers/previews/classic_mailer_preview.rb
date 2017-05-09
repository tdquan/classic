class ClassicMailerPreview < ActionMailer::Preview
  def welcome
    user = Spree::User.first
    ClassicMailer.welcome(user)
  end
end
