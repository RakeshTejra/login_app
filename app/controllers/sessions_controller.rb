class SessionsController < ApplicationController

	def new
	end
	
	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = "You are logged in successfully!"

			redirect_to '/'
		else 
			redirect_to '/login'
		end		
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "You are logged out!"
		redirect_to '/login'
	end

end
