class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :content, length: {minimum: Settings.comments.content.min_length}

  scope :limit_num, ->(num){limit num}

  scope :more_than, ->(num){where "id > ?", num}
end
