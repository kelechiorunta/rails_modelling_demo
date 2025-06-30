class UserMailer < ApplicationMailer
  before_action :set_logged_user
  default from: 'oruntakelechi86@gmail.com'

  def welcome_email
    @greeting = "Hi"
   
    mail(
      to: @user.email,
      subject: "#{@greeting} - Welcome to My Awesome Site!"
    ) do |format|
      # Render to mailer.html.erb in app/views/layout by default
      format.html
      # Render to user.html.erb in app/views/layout as text
      format.text { render text: "user" }
    end
  end

  private
    def set_logged_user
      @user = params[:user]
    end
end
