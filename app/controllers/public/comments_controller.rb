class Public::CommentsController < ApplicationController
	def create
		@blog = Blog.find(params[:blog_id])
		@comment = @blog.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		render :index
	end

	def update
    end

	def destroy
	    @comment = Comment.find(params[:id])
	    @comment.destroy
	    render :index
	end

	private

	def comment_params
	    params.require(:comment).permit(:content, :blog_id, :user_id)
	end
end
