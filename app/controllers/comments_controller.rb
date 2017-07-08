class CommentsController < ApplicationController
	def create
		@swit = Swit.find(params[:swit_id])
		@comment = @swit.comments.build(content: comment_params[:content], user_id: current_user.id, swit_id: @swit[:id])
		if @comment.save
			respond_to do |format|
				format.js
			end
		end
	end

	def new
		@swit = Swit.find(params[:swit_id])
		@comments = @swit.comments.all
		respond_to do |format|
			format.js
		end
	end

	def destroy
		@swit = Swit.find(params[:swit_id])
		@comment = @swit.comments.find(params[:id])
		@comment.destroy
		respond_to do |format|
			format.js
		end
	end

	private
		def comment_params
			params.require(:comment).permit(:content)
		end
end
