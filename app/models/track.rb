class Track < ApplicationRecord
	attachment :image
	belongs_to :genre
	belongs_to :users
	belongs_to :artists
	validates :name, presence: true
end
