class SwitsController < ApplicationController
	def index
		if session[:user] == nil
			redirect_to login_path
		end
	end
end
