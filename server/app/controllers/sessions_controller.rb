class SessionsController < ApplicationController
  def create
    @user = User.authenticate(user_params)
      if @user
      session[:user_id] = @user.id
      p session
      render json: {response: {login: true}}, content_type: 'application/json'
    else
      render json: {response: {login: false}}, layout: false, status: 422
    end
  end

  def destroy
  	session[:user_id] = nil
  	render json: {response: "Successfully Logged out"}, content_type: 'application/json'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
