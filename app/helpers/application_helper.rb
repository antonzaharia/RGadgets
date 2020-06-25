module ApplicationHelper
    def id_admin?
        User.find(current_user).admin == 1
    end

    def display_errors
        if flash[:errors]
           render partial: 'layouts/error'
        end
    end

    def log_buttons
        if logged_in?
            link_to "Log Out", logout_path, method: :post
        else
            link_to "Login", new_session_path
        end
    end

    def account_button
        if logged_in?
            link_to "Account", user_path(current_user)
        end
    end

end
