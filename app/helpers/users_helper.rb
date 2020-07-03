module UsersHelper

  # Showing New Address Button if user has no address
    def add_address_button(user)
      if user.address.empty?
        link_to "Add Address", new_user_address_path(user), :class => "btn btn-primary" 
      end
    end

  # Showing New Item Button if user is admin
    def new_item_button(user)
      if user.admin == 1
          link_to "Create New Item", new_item_path, :class => "btn btn-primary"
      end
    end
  # Showing GitHub batch if user logged in via Github
    def via_github(user)
      if user.uid.present?
        " - Logged in via GitHub"
      end
    end
  # Showing Analytics button if user is admin
    def analytics_button(user)
      if user.admin == 1
        link_to "Analytics", analytics_path, :class => "btn btn-primary"
      end
    end
end
