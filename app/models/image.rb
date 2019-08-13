class Image < ApplicationRecord
  belongs_to :user

  # use CarrierWave to associate the uploaded image with this image model with the mount_uploader method
  mount_uploader :picture, PictureUploader

  validate :picture_size

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
  
end
