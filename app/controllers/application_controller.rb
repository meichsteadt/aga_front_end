class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user
  def set_user
    if session[:user]
      @user = session[:user]
    else
      redirect_to '/login'
    end
  end
end
