class User < ApplicationRecord
  def self.get_user(login, password)
    HTTParty.get("http://localhost:3000/users/1?login=#{login}&password=#{password}")
  end
end
