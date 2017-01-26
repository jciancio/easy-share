class Photo < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :user
  belongs_to :event

  validates_integrity_of :picture
  validates_processing_of :picture
end
