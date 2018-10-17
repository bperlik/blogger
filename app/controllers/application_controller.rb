class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        if session[:user_id].present?
          @current_user ||= ::Whodat::User.find(session[:user_id])
        end
    end
end
