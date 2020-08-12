class TrackComment < ApplicationRecord
	belongs_to :tracks
	belogns_to :user
end
