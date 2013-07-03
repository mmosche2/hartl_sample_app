class SessionsController < ApplicationController

	def new
		@title = "Sign in"
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			
			flash[:success] = "Signed in!"
			redirect_to user
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end

	def destroy
	end

end
