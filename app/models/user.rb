class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :address
    validates :name, presence: true
    validates :email, presence: true
    validates :presence, presence: true


end
