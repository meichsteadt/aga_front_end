class User < ApplicationRecord
  def self.get_user(login, password)
    HTTParty.get("http://localhost:3000/users/#{login}/#{password}")
  end

  def update(user_params)
    RestClient.put("http://localhost:3000/users/#{user_params[:id]}", {"bedroom_mult": user_params[:bedroom_mult], "dining_mult": user_params[:dining_mult], "seating_mult": user_params[:seating_mult]})
  end
end
