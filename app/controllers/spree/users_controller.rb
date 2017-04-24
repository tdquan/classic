module Spree
  class UsersController < Spree::StoreController
    def new
      super
      ClassicMailer.welcome(self).deliver_now
    end
  end
end
