class Public::TracksController < ApplicationController

	#def new
		#@track = Track.new
	#end

	#def create
		#@track = Track.new
	    #if @track.save
	    	#redirect_to public_track_path(@track.id)
	    #else
	    	#render :new
	    #end
	#end

	#def index
		#@tracks = Track.all
		#@tracks2 = Track.page(params[:page]).per(8).reverse_order
		#@genres = Genre.all
	#end

	#def show
		#@track = Track.find(params[:id])
        #@genres = Genre.all
        #@favorite_track = FavoriteTrack.new
	#end

	#def edit
		#@track = Track.find(params[:id])
	#end

	#def update
		#track = Track.find(params[:id])
		#track.update(track_params)
		#redirect_to public_tracks_path
    #end

    #def destroy
    	#track = Track.find(params[:id])
    	#track.destroy
    	#redirect_to public_tracks_path
    #end

    #def random
        #render'random_ajax'
    #end

    #def search
    	#@artists = Artist.all
    	#@tracks = Track.all
    	#@genre = Genre.find(params[:id])
    	#@genres = Genre.all
    #end

    #private
    #def track_params
    	#params.require(:track).permit(:genre_id, :name, :image)
end
