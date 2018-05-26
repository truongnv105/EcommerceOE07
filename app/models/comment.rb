class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :content, length: {minimum: Settings.comments.content.min_length}
  scope :comment_root, ->{where parent_id: 0}
  scope :comment_parent, ->(comment_id){where parent_id: comment_id}
end
