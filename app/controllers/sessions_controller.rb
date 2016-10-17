class SessionsController < ApplicationController
  def index
    if session[:user_id].nil?
      redirect_to url('http://localhost:3000/auth/github')
    else
      @user = User.find(session[:user_id])
    end
  end

end
