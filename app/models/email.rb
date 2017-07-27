class Email < ApplicationRecord
  def send_email(user_id)
    RestClient.post("http://localhost:3000/emails/", {"email_address": self.email_address, "product_id": self.product_id, "user_id": user_id})
  end
end
