class EmailDelivery
  def self.log(message)
    Rails.logger.info("[EmailDelivery] Delivered email to: #{message.to}, Subject: #{message.subject}, Message-ID: #{message.message_id}")
  end
end
