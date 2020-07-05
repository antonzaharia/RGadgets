# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
# Item has_many Colors.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
# Address belongs_to User
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
# User has_many carts, through cart_items and Carts has_many users, through cart_items
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
# User has_many carts, through cart_items and Carts has_many users, through cart_items
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
# CartItem apart from the user_id and cart_id has quantity, model_id_and color_id that can be submited by the user.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
# Address attribues must be present, User email must be present and unique
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
# /analytics routes in admin account uses methods like most_sold, user_count, total_sales that are created based on scope methods.
- [x] Include signup (how e.g. Devise)
# /users/new
- [x] Include login (how e.g. Devise)
# /sessions/new
- [x] Include logout (how e.g. Devise)
# logout button available
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
# Signup via GitHub available
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
# /users/:user_id/addresses/:id
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
# /users/:user_id/addresses/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
# I used flash hash that was getting all model errors and redirected to the form page and render the errors.

Confirm:
- [x] The application is pretty DRY
# For any small piece of code that was repeating I've created a method.
- [x] Limited logic in controllers
# I created as many methods in the models so my controllers can be as DRY as possible.
- [x] Views use helper methods if appropriate
# I used helpers in the scenarios where a block of code was including Rails helper methods like "link_to" that I could not use in the model.
- [x] Views use partials if appropriate
# _form partial is used in address new and edit views.
