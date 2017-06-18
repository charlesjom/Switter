class UsersController < ApplicationController
	skip_before_action :require_login, only: [:new, :create]
  
	def new
		if current_user.nil?
			@user = User.new()
		else
			redirect_to root_path
		end

	end

	def create
		@user = User.new(signup_params)

		if @user.save
			redirect_to login_path
		else
			render :new
		end
	end

	def show
  		@user = User.find_by(id: params[:id])
  		@swits = @user.swits
	end

	def edit
		@user = current_user
		respond_to do |format|
			format.js
		end
	end

	def update_password
		@user = User.find(current_user.id)
		if @user.update(change_pass_params)
			redirect_to user_path(@user)
			flash[:notice] = "Successfully updated password"
		else
			render "edit"
		end
	end

	private
		def signup_params
			params.require(:user).permit(:firstname, :middlename, :lastname, 
										:email, :username, :password, :password_confirmation)
		end

		def change_pass_params
			params.require(:user).permit(:current_password, :password, :password_confirmation)
		end
end
