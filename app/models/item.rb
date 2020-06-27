class Item < ApplicationRecord
    belongs_to :category
    has_many :models
    has_many :colors
    has_many :cart_items
    has_many :carts, through: :cart_items

    validates :title, presence: true
    validates :image, presence: true
    validates :price, presence: true
    validates :description, presence: true
end
