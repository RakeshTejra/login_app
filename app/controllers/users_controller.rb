class UsersController < ApplicationController

	def new
		user = User.new
	end
	
	def create
		user = User.new(user_params)

		if user.save
			flash[:notice] = "Your account is successfully created. Please login to enter."
			redirect_to "/login"
		else
			redirect_to "/signup"
		end		

	end

	private
	  def user_params
	    params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end

end
