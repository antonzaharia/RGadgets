class ItemsController < ApplicationController
    include ItemsHelper
    before_action :is_admin?, :user_authorized?, :find_item
    skip_before_action :is_admin?, only: [:index, :show]
    skip_before_action :user_authorized?, only: [:index]
    skip_before_action :find_item, only: [:index, :new, :create, ]

    def index
        flash[:notice] = nil
        if params[:search] # Checking if user searched for something
            @items = Item.search(params[:search]) # Using search class method to check the database
            flash[:notice] = "No Results" if @items.size == 0 # flash notice for no results
          else
            @items = Item.all # All items
        end
    end
    
    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        set_category_from_params
        if @item.save
            redirect_to new_item_model_path(@item)
        else
            set_errors
            render new_item_path
        end
    end

    def edit
    end

    def update
        set_category_from_params
        if @item.update(item_params)
            redirect_to new_item_model_path(@item)
        else
            set_errors
            render :edit
        end
    end

    def show
        @cart = current_cart
        @cart_item = @item.cart_items.build
        @review = @item.reviews.build
        @review.stars = 5
        @stars_collection = (1..5)
    end

    def destroy
        @item.delete
        redirect_to items_path
    end

    private

    def item_params
        params.require(:item).permit(:title, :image, :description, :price)
    end

    def find_item
        @item = Item.find_by(id: params[:id])
    end

    # Selecting existing category or creating new one
    def set_category_from_params
        @item.category = Category.find_category(params[:item][:category], params[:item][:category_id])
    end

end
