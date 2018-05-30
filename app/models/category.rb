class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  before_save :downcase_name

  private

  def downcase_name
    name.downcase!
  end
end
