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
		if @swit.save
			@swit = current_user.swits.first()
			@swits = Swit.all if logged_in?
		else
			flash[:notice] = "Error!"
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	def search
		@swits = Swit.where("content LIKE ?", "%#{params[:term]}%")
		respond_to do |format|
			format.html
		end
	end

	def destroy
		@swit = current_user.swits.find(params[:id])
		@swit.destroy
		respond_to do |format|
			format.js
		end
	end

	def toggle_sweet
		@swit = Swit.find(params[:id])
		@sweet = @swit.sweets.find_by(user_id: current_user.id)
		if @sweet.nil?
			@swit.sweets.create(swit_id: @swit[:id], user_id: current_user.id)
		else
			@sweet.destroy
		end

		respond_to do |format|
			format.js
		end
	end

	def toggle_sour
		@swit = Swit.find(params[:id])
		@sour = @swit.sours.find_by(user_id: current_user.id)
		if @sour.nil?
			@swit.sours.create(swit_id: @swit[:id], user_id: current_user.id)
		else
			@sour.destroy
		end

		respond_to do |format|
			format.js
		end
	end

	private
		def swit_params
			params.require(:swit).permit(:content)
		end
end