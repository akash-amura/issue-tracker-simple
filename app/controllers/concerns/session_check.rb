module SessionCheck
  extend ActiveSupport::Concern
  def session_exists?
    if !session[:user_id]
      remember_token = cookies.signed[:remember_token]
      if !remember_token.nil?
        users = User.all
        users.each  do |user|
          digest = BCrypt::Password.new(user.remember_digest) if !user.remember_digest.nil?
          if digest  == remember_token
            session[:user_id] = user.id
            break
          end
        end
      end
    end
    if session[:user_id]
      true
    else 
      false
    end
  end

  def session_action
    if session_exists?
      yield
    else 
      redirect_to users_login_path and return
    end
  end
end
