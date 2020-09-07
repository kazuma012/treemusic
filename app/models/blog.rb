class Blog < ApplicationRecord
	mount_uploader :blog_image_id, ImagesUploader
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :blog_genres
	has_many :genres, through: :blog_genres
	paginates_per 5

	with_options presence: true do
		validates :title
		validates :body
		validates :blog_image_id
	end

	def self.search(search)
		if search
			Blog.where(Blog.arel_table[:title].matches("%#{search}%"))
		else
			Blog.all
		end
	end
	
	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end
end
