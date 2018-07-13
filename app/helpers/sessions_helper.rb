module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    
    def current_user
       @current_user ||= User.find_by(id: session[:user_id])
    end
    
    def user_signed_in?
       !current_user.nil?
       # 현재 유저가 없으면 => false
       # 현재 유저가 있는 경우 => true
    end
end
