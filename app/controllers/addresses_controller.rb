class AddressesController < ApplicationController
    def new
        @user = User.find(params[:user_id])
        @address = @user.address.build
        
    end

    def create
        @user = User.find(current_user)
        @address = @user.address.build(address_params)
        if @address.save
            redirect_to user_path(@user)
        else
            flash[:errors] = @address.errors.full_messages
            redirect_to new_user_address_path(@user)
        end
    end

    def edit
        @user = User.find(current_user)
        @address = Address.find(params[:id])
    end

    def update
        
        @address = Address.find(params[:id])
        @user = @address.user
        if @address.update(address_params)
            redirect_to user_path(@user)
        else
            flash[:errors] = @address.errors.full_messages
            redirect_to edit_user_address_path(@user, @address)
        end
    end



    private
    def address_params
        params.require(:address).permit(:line_1, :line_2, :city, :postcode, :country)
    end

    
end
