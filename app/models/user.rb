class User < ActiveRecord::Base
	devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

	mount_uploader :photo, PhotoUploader

	has_many :wishlists
	has_many :properties

  enum kind: [ :user, :admin ]
end