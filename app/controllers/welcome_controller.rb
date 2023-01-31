class WelcomeController < ApplicationController
  def index
    @types = Type.actif
  end

  def account
    @balance = 0
    @wallets = Wallet.where(user: current_user)
    @wallets.each do |wallet|
      if wallet.in 
        @balance += wallet.amount
      else
        @balance -= wallet.amount
      end
    end
    @portal_session = current_user.payment_processor.billing_portal 
  end
end
