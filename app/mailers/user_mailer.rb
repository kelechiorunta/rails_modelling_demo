class UserMailer < ApplicationMailer
  default from: 'kelechiorunta1@gmail.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome_email.subject
  #
  def welcome_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
