module SessionCheck
  extend ActiveSupport::Concern
  def session_exists?
    if session[:user_id] 
      true
    else 
      false
    end
  end
end
