class Product < ApplicationRecord
  has_many :comments
  belongs_to :category
  has_many :ratings
  has_many :order_details
  has_many :orders, through: :order_details
  mount_uploader :picture, PictureUploader
  validates :name, presence: true,
    length: {minimum: Settings.product.name.min_length},
      uniqueness: {case_sensitive: false}
  validates :describe, presence: true,
    length: {minimum: Settings.product.describe.min_length}
  validates :price, presence: true
  validates :picture, presence: true, on: :create
  validates :category_id, presence: true
  validate :picture_size
  scope :feature_hot, ->{where feature: true }
  scope :limit_num, ->(num){limit num}
  scope :order_price, ->{order :price}
  scope :name_like, ->(search){
    if search.present?
      where "name LIKE ?", "%#{search}%"
    end
  }

  scope :filter, ->(min, max){where("price > ? and price < ?", min, max)}

  private

  def picture_size
    if picture.size > Settings.product.picture.max_size.megabytes
      errors.add(:picture, I18n.t("image_max"))
    end
  end
end
