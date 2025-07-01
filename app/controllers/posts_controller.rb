class PostsController < ApplicationController
  before_action :require_login

  def show
    @existing_user = User.find(params[:id])

    respond_to do |format|
      format.html # renders show.html.erb by default
      format.json { render json: @existing_user, status: :ok }
    end

    begin
      # Send welcome email
      UserMailer.with(user: @existing_user).welcome_email.deliver_later

      # Notify via NotifierMailer
      NotifierMailer.notify(@existing_user.email).deliver_later

    # rescue SomeThirdPartyService::ApiError => e
      # Rails.logger.error("NotifierMailer failed due to API error: #{e.message}")
      # Optional: notify admins or fallback
    rescue => e
      Rails.logger.error("Unexpected NotifierMailer error: #{e.message}")
    end
  end
end

