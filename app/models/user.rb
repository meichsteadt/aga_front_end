class User < ApplicationRecord
  def self.get_user(login, password)
    HTTParty.get("https://aga-api.herokuapp.com/users/#{login}/#{password}")
  end

  def update(user_params)
    RestClient.put("https://aga-api.herokuapp.com/users/#{user_params[:id]}", {"bedroom_mult": user_params[:bedroom_mult], "dining_mult": user_params[:dining_mult], "seating_mult": user_params[:seating_mult]})
  end
end
