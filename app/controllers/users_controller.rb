class UsersController < ApplicationController
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
			render "new"
		end
  end

	private
		def signup_params
			params.require(:signup).permit(:firstname, :middlename, :lastname, 
										:email, :username, :password, :pasword_confirmation)
		end
end
