class PostsController < ApplicationController
  before_action :require_login
  def show
    @existing_user = User.find(params[:id])
  end 
end
