class Public::FavoritesController < ApplicationController
	def create
        blog = Blog.find(params[:blog_id])
        favorite = current_user.favorites.create(blog_id: params[:blog_id])
        if favorite.save
           redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        blog = Blog.find(params[:blog_id])
        favorite = current_user.favorites.find_by(blog_id: params[:blog_id])
        if favorite.destroy
           redirect_back(fallback_location: root_path)
        end
    end
end
