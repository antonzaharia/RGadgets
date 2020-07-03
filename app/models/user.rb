class User < ApplicationRecord
    scope :customers, -> { where admin: 0 }
    has_secure_password
    has_many :carts
    has_many :address
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :presence, presence: true

    def user_carts
        if admin == 1
            carts = Cart.checked_out + Cart.completed
        else
            Cart.where(user_id: self.id).order(created_at: :desc)
        end
    end

    def self.create_with_omniauth(auth)
        create! do |user|
          user.uid = auth['uid']
          if auth['info']
             user.name = auth['info']['name'] || "No Name on GitHub"
             user.email = auth['info']['email'] || "Add your email here."
             user.password = auth['info']['email'] || "BasicPassword"
          end
        end
    end

    def self.user_count
        customers.size
    end

    def self.top_three_customers
        customers.order(:carts.size).limit(3)
    end

    def admin?
        admin == 1
    end


end
