# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome_email
  def welcome_email
    # The @user context in the request is visible and persists in the route like an
    # instance variable in a controller because we have configured
    # the default host across the application in config/application.rb
    # as config.action_mailer.default_url_options = { host: "localhost", port: "3032" }
    UserMailer.with(user: @user).welcome_email
  end

end
