class TrackComment < ApplicationRecord
	belongs_to :tracks
	belongs_to :user
end
