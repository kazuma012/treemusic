class Genre < ApplicationRecord
	has_many :blog_genres
	has_many :blogs, through: :blog_genres
	validates :name, presence: true
end
