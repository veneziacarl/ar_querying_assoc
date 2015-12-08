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
