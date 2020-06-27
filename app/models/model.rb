class Model < ApplicationRecord
    belongs_to :item
    has_many :cart_items
    validates :name, presence: true
end
