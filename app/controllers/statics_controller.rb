class StaticsController < ApplicationController
    def home
    end

    def analytics
        @total_sales = Cart.total_sales
        @items_sold = Item.items_sold
        @most_sold = Item.most_sold.uniq
    end
end
