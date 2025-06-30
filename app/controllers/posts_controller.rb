class PostsController < ApplicationController
  before_action :require_login
  def show
    @existing_user = User.find(params[:id])
  
    respond_to do |format|
      format.html # renders show.html.erb by default
      format.json { render json: @existing_user, status: :ok }
    end

    UserMailer.with(user: @existing_user).welcome_email.deliver_now
  end
end
