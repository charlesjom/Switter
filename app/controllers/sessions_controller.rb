class SessionsController < ApplicationController
	def create
		@user = User.find_by(username: login_params[:username])
		if @user == nil
			flash[:notice] = "Invalid username or password"
			flash[:color] = "Invalid"
			render "new"
		else
			authorized_user = @user.authenticate(login_params[:password])
			if authorized_user
				session[:user] = @user
				redirect_to swits_path
			else
				flash[:notice] = "Invalid username or password"
				flash[:color] = "Invalid"
				render "new"
			end
		end
	end

	def new
		if session[:user] == nil
			render "new"
		else
			redirect_to swits_path
		end
	end

	def destroy
		session[:user] = nil
		redirect_to root_path
	end

	private
		def login_params
			params.require(:login).permit(:username, :password)
		end
end
