class Address < ApplicationRecord
    belongs_to :user
    validates :line_1, presence: true
    validates :city, presence: true
    validates :postcode, presence: true
    validates :country, presence: true

end
