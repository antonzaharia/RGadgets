module ItemsHelper

    # Selecting existing category or creating new one
    def set_category_from_params
        @item.category = Category.find_category(params[:item][:category], params[:item][:category_id])
    end

    # Showing the edit Item button if the user is admin
    def edit_button
        if is_admin?
            link_to "Edit Item", edit_item_path(@item), :class => "btn btn-primary float-right"
        end
    end

    # Showing the delete Item button if the user is admin
    def delete_button
        if is_admin?
            link_to "Delete Item", item_path(@item), method: :delete, :class => "btn btn-primary float-right"
        end
    end

    # Set flash errors the items errors
    def set_errors
        flash[:errors] = @item.errors.full_messages
    end

    # def find_model
    #     if params[:item][:model] == ""
    #         Model.find_by(id: params[:item][:model_id])
    #     else
    #         Model.find_or_create_by(name: params[:item][:model])
    #     end
    # end

    # def find_color
    #     if params[:item][:color] == ""
    #         Color.find_by(id: params[:item][:color_id])
    #     else
    #         Color.find_or_create_by(name: params[:item][:color])
    #     end
    # end


end
