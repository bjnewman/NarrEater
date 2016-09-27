class UsersController < ApplicationController
  def create
  	@user = User.new(user_params)
  	if @user.save
  		sessions[:user_id] = @user.id
  		###redirect to ionic route or token return
  		##ionic will ajax request for info.
  	else
  		render file: "#{Rails.root}/public/500", layout: false, status: 500
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	###redirect to ionic
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
