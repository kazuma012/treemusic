class Public::BlogsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
	def index
		@blogs = Blog.search(params[:search])
		@blogs2 = Blog.page(params[:page])
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
	    @blogs = Blog.order(create_at: :desc).limit(5)
	    @blog.user_id = current_user.id
	    if @blog.save
	    	redirect_to public_blogs_path
	    end
	end

	def show
		@blog = Blog.find(params[:id])
		@comment = Comment.new
		@comments = @blog.comments.order(created_at: :desc)
	end

	def edit
		@blog = Blog.find(params[:id])
		if @blog.user != current_user
		   redirect_to public_blogs_path, alert: 'Invalid Access'
		end
	end

	def update
		@blog = Blog.find(params[:id])
	    if @blog.update!(blog_params)
	    	redirect_to public_blogs_path(@blog.id), notice: 'Update succsessfuly'
	    else
	    	render :edit
	    end
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy
		redirect_to public_blogs_path, notice: 'Deleted succsessfuly'
    end

	private

	def blog_params
	    params.require(:blog).permit(:title, :body, :blog_image_id, genre_names: [])
	end
end
