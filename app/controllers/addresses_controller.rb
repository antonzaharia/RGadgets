class AddressesController < ApplicationController
    before_action :set_current_user
    
    def new
        @address = @user.address.build
    end

    def create
        @address = @user.address.build(address_params)
        if @address.save
            redirect_to user_path(@user)
        else
            set_errors
            render :new
        end
    end

    def edit
        @address = Address.find_by(user_id: @user.id)
    end

    def update
        @address = @user.address.find_by(id: params[:id])
        if @address.update(address_params)
            redirect_to user_path(@user)
        else
            set_errors
            render :edit
        end
    end

    def show
        @address = @user.address.find_by(id: params[:id]) 
    end

    private
    def address_params
        params.require(:address).permit(:line_1, :line_2, :city, :postcode, :country)
    end

    def set_errors
        @errors = @address.errors.full_messages
    end

    
end
