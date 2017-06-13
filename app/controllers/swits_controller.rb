class SwitsController < ApplicationController
	def index
		@swits = Swit.all if logged_in?
		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@swit = current_user.swits.build(swit_params)
		@swit.save
		@swit = current_user.swits.first()
		@swits = Swit.all if logged_in?
		respond_to do |format|
			format.html
			format.js
		end
	end

	def destroy
		@swit = current_user.swits.find(params[:id])
		@swit.destroy
		respond_to do |format|
			format.html
			format.js
		end
	end

	private
		def swit_params
			params.require(:swit).permit(:content)
		end
end
