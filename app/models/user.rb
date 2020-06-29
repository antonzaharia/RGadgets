class User < ApplicationRecord
    has_secure_password
    has_many :carts
    has_many :address
    validates :name, presence: true
    validates :email, presence: true
    validates :presence, presence: true

    def user_carts
        if admin == 1
            carts = Cart.where(status: "checked out") + Cart.where(status: "completed")
        else
            Cart.where(user_id: self.id)
        end
    end
end
