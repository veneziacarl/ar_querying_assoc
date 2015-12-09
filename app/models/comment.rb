class Comment < ActiveRecord::Base
  belongs_to :recipe
  # validates :recipe_id, presence: true
  validates :body, length: { maximum: 140 }
  validates :recipe, presence: true
end
