class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :saml_authenticatable, :trackable
  pay_customer
  def name
    "#{self.first_name} #{self.last_name}"
  end
end
