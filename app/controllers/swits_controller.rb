class SwitsController < ApplicationController
	def index
		@swits = current_user.swits.all if logged_in?
		@swits = current_user.swits.all if logged_in?
		render :index
	end

	def create
		@swits = current_user.swits.build(swit_params)
		@swits.save
		@swits = current_user.swits.all if logged_in?
		render :index
	end

	def destroy
		swit = current_user.swits.find(params[:id])
		swit.destroy
		@swits = current_user.swits.all if logged_in?
		render :index
	end

	private
		def swit_params
			params.require(:swit).permit(:content)
		end
end
