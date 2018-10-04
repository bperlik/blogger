class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= ::Whodat::User.find(session[:user_id])
    end
end
