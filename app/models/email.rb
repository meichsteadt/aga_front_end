class Email < ApplicationRecord
  def send_email()
    RestClient.post("https://aga-api.herokuapp.com/emails/", {"email_address": self.email_address, "product_id": self.product_id, "client_id": "test", "client_secret": "password"})
  end
end
