class Item < ApplicationRecord
    scope :with_sales, -> { joins(:cart_items).where('cart_items.quantity >= 1 ') }

    belongs_to :category
    has_many :models
    has_many :colors
    has_many :cart_items
    has_many :reviews
    has_many :carts, through: :cart_items
    has_many :users, through: :reviews

    validates :title, presence: true
    validates :image, presence: true
    validates :price, presence: true
    validates :description, presence: true

    def number_of_sales
        cart_items.pluck(:quantity).sum
    end

    def self.most_sold
        with_sales.order(number_of_sales: :asc)
    end

    def self.items_sold
        number = 0
        with_sales.each do |item|
            number += item.number_of_sales
        end
        number
    end

    def self.search(term)
        where('title LIKE ?', "%#{term}%")
    end

    def reviews_number
        reviews.size - 1
    end

    def average
        if reviews_number >= 1
            reviews.pluck(:stars).sum / reviews_number
        end
    end

end
