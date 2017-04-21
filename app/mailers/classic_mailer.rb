class ClassicMailer < ActionMailer::Base
  default from: 'classic@classic.com'

    def welcome(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome to Classic!')
    end

end
