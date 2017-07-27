class LoginsController < ApplicationController
  skip_before_action :set_user
  def new
    @log = Login.new()
  end

  def create
    @user = User.get_user(params[:login][:login], params[:login][:password])
    session[:user] = @user
    redirect_to "/"
  end

private
  def login_params
    params.require(:login).permit(:login, :password)
  end
end
