Load up your app in irb (see the reading for a description of how to do this) and follow these directions:
irb
Create 5 recipes
Recipe.create(name: "name", body: "body")

Create 1-5 comments on all your recipes.


Answer the following questions:
How would you return all the recipes in your database?
Recipe.all

How would you return all the comments in your database?
Comment.all

How would you return the most recent recipe posted in your database?
Recipe.all.order(:created_at).last

How would you return all the comments of the most recent recipe in your database?
recent_recipe = Recipe.all.order(:created_at).last
Comment.where(recipe: recent_recipe)

How would you return the most recent comment of all your comments?
Comment.all.order(:created_at).last

How would you return the recipe associated with the most recent comment in your database?
recent_comment = Comment.all.order(:created_at).last
Recipe.where(id: recent_comment.recipe)

How would you return all comments that include the string brussels in them?
Comment.where("name ILIKE ?", '%brussels%')

*******************************************************************************

* Last night you created a Brussels Sprouts recipe blog. We are going to add some validations to it.


* Validate that the title of each recipe exists.
in class Recipe
validates :name, presence: true

* Validate that the title of each recipe is unique.
in class Recipe
validates :name, uniqueness: true

* Validate that the title of each recipe contains "Brussels sprouts" in it.
in class Recipe
validates :name, format: { with: /Brussels sprout/ }

* Validate that the length of a comment be a maximum of 140 characters long.
in class Comment
validates :body, length: { maximum: 140 }

* Validate that a comment has a recipe.
in class Comment
validates :recipe_id, presence: true

* Add a field `servings` to your Recipe table. This field is optional, but if supplied, it must be greater than or equal to 1. Write a validation for this.
new migration:
class AddColumnRecipesServings < ActiveRecord::Migration
  def change
    add_column :recipes, :servings, :integer
  end
end

in class Recipe
validates :servings, numericality: { greater_than_or_equal_to: 1 }, allow_nil: true

* Load up your app in irb and comfirm that your validations work.
