module ModelsHelper
  # Creating Destroy button for the model in the New Item Proccess
    def model_delete_button(model, item)
      if model.valid?
        link_to "X", item_model_path(item, model), method: :delete, :class => "btn btn-dark float_right"
      end
    end
end
