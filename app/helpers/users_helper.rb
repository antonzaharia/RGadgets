module UsersHelper

    def add_address_button(user)
      link_to "Add Address", new_user_address_path(user) if user.address.empty?
    end
end
