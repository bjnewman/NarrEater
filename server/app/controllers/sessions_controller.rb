class SessionsController < ApplicationController
  def create
  	@user = User.authenticate([user_params])
  		if @user
  		sessions[:user_id] = @user.id
  		###redirect to ionic route or token return
  		##ionic will ajax request for info.
  	else
  		render file: "#{Rails.root}/public/500", layout: false, status: 500
  	end
  end

  def destroy
  	sessions[:user_id] = nil
  	#redirect
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
