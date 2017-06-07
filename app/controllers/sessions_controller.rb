class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(username: login_params[:username])
		if user && user.authenticate(login_params[:password])
			log_in user
			redirect_to swits_path
		else
			flash[:notice] = "Invalid username or password"
			flash[:type] = "error"
			render "new"
		end
	end

	def destroy
		log_out if logged_in?
		flash[:notice] = "You have sucessfully logged out."
		redirect_to root_path
	end

	private
		def login_params
			params.require(:login).permit(:username, :password)
		end
end
