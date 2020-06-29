module UsersHelper

    def add_address_button(user)
      if user.address.empty?
        link_to "Add Address", new_user_address_path(user), :class => "btn btn-primary" 
      end
    end
end
