class Public::TracksController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    def index
		@tracks = Track.all
		@track = Track.new	    
	end

	def create
		@track = Track.new(track_params)
		@tracks = Track.all
		@track.user_id = current_user.id
	    if @track.save!
            redirect_to public_tracks_path(@track), notice: 'Create succsessfuly'
        else
            render :create
        end
	end

	def show
		@track = Track.find(params[:id])
	end

	def edit
		@track = Track.find(params[:id])
        if @track.user != current_user
           redirect_to public_tracks_path, alert: 'Invalid Access'
        end
	end

	def update
		@track = Track.find(params[:id])
		if @track.update!(track_params)
           redirect_to public_tracks_path(@track.id), notice: 'Update succsessfuly'
        else
           render 'edit'
        end
    end

    def destroy
    	track = Track.find(params[:id])
    	track.destroy
        redirect_to public_tracks_path, notice: 'Deleted succsessfuly'
    end

    #def random
        #render'random_ajax'
    #end

    #def search
    	#@artists = Artist.all
    	#@tracks = Track.all
    	#@genre = Genre.find(params[:id])
    	#@genres = Genre.all
    #end

    private
    
    def track_params
    	params.require(:track).permit(:title, :track_image_id, :track_audio_id, :description)
    end
end
