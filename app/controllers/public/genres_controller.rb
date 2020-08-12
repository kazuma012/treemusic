class Public::GenresController < ApplicationController
	def search
		if params[:name].present?
		   @genres = Genre.where('name LIKE ?', "%#{params[:name]}%")
		else
			@genre = Genre.none
		end
	end

	def index
		@q = Genre.ransack(params[:q])
		@genres = @q.result(destinct: true)
		@q = User.ransack(params[:q])
		@users = @q.result(distinct: true)
		@q = Artist.ransack(params[:q])
		@artist = @q.result(distinct: true)
		@q = Track.ransack(params[:q])
		@track = @q.result(distinct: true)
	end
end
