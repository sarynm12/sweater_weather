class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You successfully logged in.'
      redirect_to '/dashboard'
    else
      flash[:error] = 'Sorry, your credentials are bad.'
      redirect_to '/login'
    end
  end

  def session_params
    params.permit(:email, :password)
  end

end
