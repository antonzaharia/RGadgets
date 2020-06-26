class Item < ApplicationRecord
    belongs_to :category
    has_many :models
    has_many :colors

    validates :title, presence: true
    validates :image, presence: true
    validates :price, presence: true
    validates :description, presence: true
end
