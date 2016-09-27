class SessionsController < ApplicationController
  def create
  	@user = User.authenticate([user_params])
  		if @user
  		sessions[:user_id] = @user.id
      render json: {response: {user_name: @user.user_name, email: @user.email}}, content_type: 'application/json'
  	else
  		render file: "#{Rails.root}/public/422", layout: false, status: 422
  	end
  end

  def destroy
  	sessions[:user_id] = nil
  	render json: {response: "Successfully Logged out"}, content_type: 'application/json'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
