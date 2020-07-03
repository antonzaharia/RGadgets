class StaticsController < ApplicationController
    before_action :is_admin?
    skip_before_action :is_admin?, only: [:home]
    
    def home
    end

    def analytics
        @total_sales = Cart.total_sales
        @items_sold = Item.items_sold
        @most_sold = Item.most_sold.uniq
        @user_count = User.user_count
        @top_three = User.top_three_customers.reverse
    end
end
