class ReviewsController < ApplicationController
    def create
        @item = Item.find(params[:item_id])
        if @item.reviews.find_by(user_id: current_user)
            flash[:notice] = "You already reviewd this item."
            redirect_to item_path(@item)
        else
            @item.reviews.create(stars: review_params[:stars], user_id: current_user)
            flash[:notice] = "Thanks for your review!"
            redirect_to item_path(@item)
        end
    end

    private
    def review_params
        params.require(:review).permit(:stars)
    end
end
