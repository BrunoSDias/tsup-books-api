class User < ApplicationRecord
  has_many :books, dependent: :destroy
  
  validates_presence_of :password_confirmation
  
  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist
end
