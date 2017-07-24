class User < ApplicationRecord
  def self.get_user(login, password)
    HTTParty.get("http://localhost:3000/users/1?login=#{login}&password=#{password}")
  end

  def update(user_params)
    RestClient.put("http://localhost:3000/users/#{user_params[:id]}", {"bedroom_mult": user_params[:bedroom_mult]})
  end
end
