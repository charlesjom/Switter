class SessionsController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
	
	def new
		if !current_user.nil?
			redirect_to swits_path
		end
	end

	def create
		user = User.find_by(username: login_params[:username])
		if user && user.authenticate(login_params[:password])
			log_in user
			redirect_to swits_path
		else
			@login_error = { message: "Wrong username or password" }	
			render :new
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_path
	end

	private
		def login_params
			params.require(:login).permit(:username, :password)
		end
end
