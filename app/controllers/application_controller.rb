class ApplicationController < ActionController::Base

    before_action :set_current_user

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def auticate_user
        if @current_user == nil
            flash[:notice] = "ログインしてください"
            redirect_to("/")
        end
    end

    def forbid_login_user
        if @current_user
            flash[:notice] = "ログアウトしてください"
            redirect_to("/posts/#{@current_user.id}")
        end
    end
end
