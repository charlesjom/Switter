class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]

	def index
	end
  
	def new
		@new_user = User.new
	end

	def create
		@new_user = User.new(signup_params)
		if @new_user.save
			redirect_to login_path
		else
			render :new
		end
	end

	def show
  		@user = User.find_by(id: current_user[:id])
	end

	def edit
		raise params.to_json()
		@user = User.find(current_user.id)
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update_pass
		@user = User.find(current_user.id)
		if @user.update(change_pass_params)
			flash[:notice] = "Password updated successfully"
		end
		redirect_to user_path(@user)
	end

	def update_uname
		@user = User.find(params[:id])
		if @user.update(change_uname_params)
			flash[:notice] = "Username updated successfully"
		end
		redirect_to user_path(@user)
	end

	private
		def signup_params
			params.require(:signup).permit(:firstname, :middlename, :lastname, 
										:email, :username, :password, :password_confirmation)
		end

		def change_pass_params
			params.require(:user).permit(:current_password, :password, :password_confirmation)
		end

		def change_uname_params
			params.require(:user).permit(:username)
		end
end
