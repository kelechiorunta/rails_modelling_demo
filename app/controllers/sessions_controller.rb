class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:signup, :login]
  # before_action :require_login, except: [:new, :register, :login, :signup]
  def new
    @user = User.new
  end
# Direct to the Register/Sign Up form
  def register
    @user = User.new
  end

  def login
    @user = User.find_by(email: allowed_params[:email])
    
  
    if @user && @user.authenticate(allowed_params[:password])
      remember(@user)
      redirect_to post_path(@user.id), notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def signup
    @user = User.new(allowed_params)
    existing_user = User.find_by(name: @user.name) || User.find_by(email: @user.email)
  
    if existing_user
      render :register, status: :unprocessable_entity
    else
      if @user.save
        remember(@user)
        redirect_to post_path(@user.id)
      else
        render :register, status: :unprocessable_entity # <== this line was missing
      end
    end
  end  
  
  def destroy
    @user = current_user
    forget(@user)
    redirect_to new_session_path, notice: "Logged out"
  end

  private

  def allowed_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation )
  end
end
