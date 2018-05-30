class Image < ApplicationRecord
  belongs_to :product

  mount_uploader :picture, PictureUploader

  validates_presence_of :picture
  validate :picture_size

  private

  def picture_size
    if picture.size > Settings.product.picture.max_size.megabytes
      errors.add(:picture, I18n.t("image_max"))
    end
  end
end
