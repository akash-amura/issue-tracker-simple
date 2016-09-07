class UsersController < ApplicationController
  #Get /users 
  def index
    if session_exists?
      redirect_to user_path(session[:user_id]) and return
    end
  end

  #Get /users/new
  def new
    if !session_exists?
      @user = User.new
    else 
      redirect_to user_path(session[:user_id]) and return
    end
  end

  #Post /users
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "User successfully created"
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  #Get /users/:id
  def show
    if session_exists? 
      @user = User.find(session[:user_id])
    else 
      redirect_to users_login_path
    end
  end

  #Get /users/:id/edit
  def edit
    if session_exists?
      @user = User.find(session[:user_id])
    else 
      redirect_to users_login_path and return 
    end
  end

  #Put/Patch /users/:id
  def update
    @user = User.find(session[:user_id])
    email = user_edit_params[:email]
    if email != @user.email
      check_user = User.find_by_email(email)
      if check_user
        flash[:message] = "user with this email exists"
        redirect_to edit_user_path and return
      end
    end
    if @user.update(user_edit_params)
      redirect_to @user and return 
    else 
      redirect_to  edit_user_path(@user) and return 
    end
  end

  #Delete /users/:id
  def destroy
    if session_exists?
      @user = User.find_by(session[:user_id])
      @user.destroy
      session[:user_id] = nil
      redirect_to users_path
    end
  end

  #Post /users/login
  #Get /users/login
  def login
    if !session_exists?
      if request.request_method_symbol == :get 
        render "login"
      elsif request.request_method_symbol == :post
        email  =user_login_params[:email]
        password= user_login_params[:password]
        @user = User.find_by_email(email)
        if !@user.nil? && @user.authenticate(password)
          session[:user_id] = @user.id
          flash[:message] = nil
          redirect_to @user
        else 
          flash[:message] = "Email or password incorrect"
          render "login"
        end
      end
    else 
      redirect_to user_path(session[:user_id])
    end
  end

  #Get /users/logout
  def logout
    if session_exists?
      session[:user_id] = nil
      redirect_to users_path
    end
  end

  private 
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:type)
    end

    def user_edit_params
      params.require(:user).permit(:name,:email,:type)
    end

    def user_login_params
      params.permit(:email,:password)
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def session_exists?
      if session[:user_id] 
        true
      else 
        false
      end
    end
end
