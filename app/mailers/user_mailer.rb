class UserMailer < ApplicationMailer
  default from: 'oruntakelechi86@gmail.com'

  def welcome_email
    @greeting = "Hi"
    @user = params[:user]
    mail(
      to: @user.email,
      subject: "#{@greeting} - Welcome to My Awesome Site!"
    )
  end
end
