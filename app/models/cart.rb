class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items
    has_many :items, through: :cart_items

    def total
        total_price = 0
        cart_items.each do |cart_item|
            total_price += (cart_item.item.price.to_f * cart_item.quantity)
        end
        total_price
    end

    def status_show
        if status == nil
            status = "pending"
        else
            self.status
        end
        
    end

    def date
        updated_at.strftime("%d %b %y")
    end

    
end
