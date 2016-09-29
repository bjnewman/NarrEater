class UsersController < ApplicationController
  def create
  	@user = User.new(user_params)
    @user.email = @user.email.downcase
  	if @user.save
   		session[:user_id] = @user.id
  		render json: {response: {user_name: @user.user_name, email: @user.email}}, content_type: 'application/json'
  	else
  		render file: "#{Rails.root}/public/422", layout: false, status: 422
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	render json: {response: "Account successfully removed"}, content_type: 'application/json'
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end
end
