class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  before_save :downcase_name
  scope :follow_created_at, ->{select(:id,:name).order created_at: :asc}

  private

  def downcase_name
    name.downcase!
  end
end
