class Track < ApplicationRecord
	belongs_to :user
	mount_uploader :track_image_id, ImagesUploader
	mount_uploader :track_audio_id, AudioFileUploader

	with_options presence: true do
		validates :title
		validates :description
		validates :track_image_id
		validates :track_audio_id
	end
end
