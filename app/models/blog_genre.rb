class BlogGenre < ApplicationRecord
	belongs_to :blog
	belongs_to :genre
end
