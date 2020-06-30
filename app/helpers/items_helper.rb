module ItemsHelper
    def find_model
        if params[:item][:model] == ""
            Model.find_by(id: params[:item][:model_id])
        else
            Model.find_or_create_by(name: params[:item][:model])
        end
    end

    def find_color
        if params[:item][:color] == ""
            Color.find_by(id: params[:item][:color_id])
        else
            Color.find_or_create_by(name: params[:item][:color])
        end
    end

    def find_category
        if params[:item][:category] == ""
            Category.find_by(id: params[:item][:category_id])
        else
            Category.find_or_create_by(name: params[:item][:category])
        end
    end

    def edit_button
        if User.find(current_user).admin == 1
            link_to "Edit Item", edit_item_path(@item), :class => "btn btn-primary float-right"
        end
    end


end
