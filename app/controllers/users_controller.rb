class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:signup, :login]

  def index
    @users = User.all
    render json: @users
  end
  
  def name
    user_params = params.extract_value(:name)
    render json: user_params
  end
  # Direct to the Login Form
  def new
    @user = User.new
  end
# Direct to the Register/Sign Up form
  def register
    @user = User.new
  end

  def login
    @user = User.new(allowed_params)
    @existing_user = User.find_by(name: @user.name);
    if @existing_user
      redirect_to post_path(@existing_user.id)
    else
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
        redirect_to post_path(@user.id)
      else
        render :register, status: :unprocessable_entity # <== this line was missing
      end
    end
  end  

  def create
    @user = User.new(allowed_params)
  end

  private

  def allowed_params
    params.require(:user).permit(:name, :email)
  end

end

