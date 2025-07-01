# use of rescue_from to handle mailer background errors and external third party errors

class NotifierMailer < ApplicationMailer
  rescue_from ActiveJob::DeserializationError do |exception|
    Rails.logger.error "DeserializationError: #{exception.message}"
  end

  rescue_from "SomeThirdPartyService::ApiError" do |exception|
    Rails.logger.error "API Error: #{exception.message}"
  end

  def notify(recipient)
    mail(to: recipient, subject: "Notification")
  end
end
