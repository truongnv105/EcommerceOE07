class Product < ApplicationRecord
  has_many :comments
  has_many :ratings
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :images

  belongs_to :category

  enum status: {hide: 0, active: 1}
  enum feature: {normal: 0, hot: 1}

  validates :name, presence: true,
    length: {minimum: Settings.product.name.min_length},
      uniqueness: {case_sensitive: false}
  validates :describe, presence: true,
    length: {minimum: Settings.product.describe.min_length}
  validates :price, presence: true
  validates :category_id, presence: true
  validates :images, presence: true

  accepts_nested_attributes_for :images, allow_destroy: true

  scope :feature_hot, ->{where feature: :hot}

  scope :limit_num, ->(num){limit num}

  scope :order_created, ->{order "created_at DESC"}

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
