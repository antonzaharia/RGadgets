class Review < ApplicationRecord
    belongs_to :user
    belongs_to :item
    validated :stars, presence: true

end
