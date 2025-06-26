class PostsController < ApplicationController
  def show
    @existing_user = User.find(params[:id])
  end 
end
