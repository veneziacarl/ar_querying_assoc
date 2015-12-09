class Recipe < ActiveRecord::Base
  has_many :comments
  validates :servings, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :name, format: { with: /Brussels sprout/ }
  validates :name, uniqueness: true
  validates :name, presence: true

end
