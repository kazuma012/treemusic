class Public::BlogsController < ApplicationController
	def create
	    @blogs = Blog.all
	    @newblog = Blog.new(blog_params)
	    @blog.user_id = current_user.user
	    @user = current_user
	    if @newblog.save
	    flash[:notice] = "Blog was successfully created."
	    redirect_to blog_path(@blog.id)
	    else
	    	render 'index'
	    end
	end

	def index
		@blogs = Blog.all
		@newblog = Blog.new
		@user = current_user
	end

	def show
		@blog = Blog.find(params[:id])
		@newblog = Blog.new
		@user = @blog.user
		@blog_comment = BlogComment.new
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
		if @blog.update(blog_params)
			flash[:notice] = "Blog was successfully updated."
			redirect_to blog_path(@blog.id)
		else
		   @blogs = Blog.new
		   render 'edit'
		end
	end

	def destroy
	    book = Book.find(params[:id])
	    if book.destroy
	       flash[:notice] = "Blog was successfully destroied"
	       redirect_to blogs_path
	    else
	    blogs = Blog.all
	    render 'index'
	    end
	end

	private

	def blog_params
	    params.require(:blog).permit(:title, :body)
	end
   
end
