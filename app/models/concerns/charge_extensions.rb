module ChargeExtensions
    extend ActiveSupport::Concern
  
    included do
      after_create :fulfill_order
    end
  
    def fulfill_order
      Wallet.create(in: true, amount: amount/100, user: customer.owner)
    end
end