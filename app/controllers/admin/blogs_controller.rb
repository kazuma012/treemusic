class Admin::BlogsController < ApplicationController
	before_action :authenticate_admin!
	def index
		@admin = current_admin
		@blogs = Blog.all
		@blogs2 = Blog.page(params[:page]).per(8).reverse_order
	end

	def show
		@amdin = current_admin
		@blog = Blog.find(params[:id])
		@comment = Comment.new
		@comments = @blog.comments.order(created_at: :desc)
	end

	def blog_params
	    params.require(:blog).permit(:title, :body, :blog_image_id, genre_ids: [])
	end
end
