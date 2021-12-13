module ApplicationHelper
    def current_user
      
      @currentUser ||= User.find(session[:user_id]) if session[:user_id]
    end
    def loggedIn
      !!current_user
    end
    def require_user
      if !loggedIn
        flash[:error] = "you must log in first"
        redirect_to login_path
      end
    end
end
