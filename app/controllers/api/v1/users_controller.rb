class Api::V1::UsersController < ApplicationController

  def create
    if params[:email].empty? || params[:password].empty? || params[:password_confirmation].empty?
      render json: { 'error': 'Fields cannot be left blank' }, status: 400
    elsif params[:password] != params[:password_confirmation]
      render json: { 'error': 'Your passwords do not match' }, status: 400
    elsif User.exists?(email: params[:email])
      render json: { 'error': 'Email has already been taken' }, status: 400
    elsif params[:password] == params[:password_confirmation]
      user = User.create(user_params)
      render json: UserSerializer.new(user), status: 201
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
