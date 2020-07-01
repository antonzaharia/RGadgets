module ColorsHelper
    def color_delete_button(color, item)
        if color.valid?
            link_to "X", item_color_path(item, color), method: :delete, :class => "btn btn-dark float_right"
        end
    end
end
