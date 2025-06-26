class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:signup, :login]
  before_action :require_login

  def index
    @users = User.all
    render json: @users
  end

  def name
    user_params = params.extract_value(:name)
    render json: user_params
  end
  # Direct to the Login Form
  

  def create
    @user = User.new(allowed_params)
  end

  private

  def allowed_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

