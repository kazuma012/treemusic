class Public::BlogsController < ApplicationController

	def index
		@blogs = Blog.all
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
	    @blogs = Blog.all
	    @blog.user_id = current_user.id
	    @blog.save!
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
	    @blog.update(blog_params)
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy
    end

	private

	def blog_params
	    params.require(:blog).permit(:title, :body, :blog_image)
	end
   
end
