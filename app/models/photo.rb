class Photo < ApplicationRecord

	belongs_to :property
	mount_uploader :photo, PhotoUploader
end