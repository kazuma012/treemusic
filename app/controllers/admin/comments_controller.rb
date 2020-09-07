class Admin::CommentsController < ApplicationController
	private

	def comment_params
	    params.require(:comment).permit(:content, :blog_id, :user_id)
	end
end
