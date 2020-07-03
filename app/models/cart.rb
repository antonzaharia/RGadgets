class Cart < ApplicationRecord
    scope :pending, -> { where status: 'pending' }
    scope :completed, -> { where status: 'completed' }
    scope :checked_out, -> { where status: 'checked out' }

    belongs_to :user
    has_many :cart_items
    has_many :items, through: :cart_items

    # Calculating the total price of the cart
    # Adding the price of all cart_items, multiplying with each quantity 
    def total
        total_price = 0
        cart_items.each do |cart_item|
            total_price += (cart_item.item.price.to_f * cart_item.quantity)
        end
        total_price
    end

    # Setting the status of a cart to pending if is nil or return it if is not
    def status_show
        if status == nil
            status = "pending"
        else
            self.status
        end
    end

    # Making the date readable
    def date
        updated_at.strftime("%d %b %y")
    end
    
    # Counting all the completed and checked out carts
    def self.total_sales
        completed.size + checked_out.size
    end

    # Status checker methods
    def completed?
        status == "completed"
    end

    def checked_out?
        status == "checked out"
    end

    def pending?
        status == "pending"
    end
    
end
