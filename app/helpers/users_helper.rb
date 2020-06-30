module UsersHelper

    def add_address_button(user)
      if user.address.empty?
        link_to "Add Address", new_user_address_path(user), :class => "btn btn-primary" 
      end
    end

    def new_item_button(user)
      if user.admin == 1
          link_to "Create New Item", new_item_path, :class => "btn btn-primary"
      end
    end

    def via_github(user)
      if user.uid.present?
        " - Logged in via GitHub"
      end
    end
end
