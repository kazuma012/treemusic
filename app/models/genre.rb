class Genre < ApplicationRecord
	has_many :tracks
	has_many :artists
	validates :name, presence: true
end
