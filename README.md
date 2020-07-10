# README


# RGadgets
Welcome !

This is a web app created in Rails that simulates a website for an online store.

# Overview
This web app has two interfaces:

A Customer Interface: login, logout, create new item,edit item , delete item, mark orders as completed, see all checked out carts and analytics page.

and
A User Interface: login, signup, signup via GitHub, logout, add address, edit address, edit details(email and name), orders history, add new item to cart, remove item from cart, checkout cart.

# Installation
Clone this repository

In your terminal, run 'bundle install' to install all required gems.
In your terminal, type 'rake db:seed' to fill up the database with 3 user accounts and 8 products.
How to run the program
In your terminal, type 'rails s' to start the server.
In your browser, visit: http://localhost:3000 to visit the homepage.
Files information
'/db/migrate' has all the migrations files
'/config' has the setup environment
'/app' has the actual code files where all the work is done.
'/app/controllers' has the controllers files
'/app/models' has the ruby models
'/app/views' has the .erb files to be rendered
Gemfile has all the required gems to run this project

# Usage
In your terminal, type 'rake db:seed' to fill up the database with 3 user accounts and 8 products. In your terminal, type 'rails s' to start the server. In your browser, visit: http://localhost:3000/ to visit the homepage.

Login as a User using any of the accounts:

# email: "toni@example.com", password:"toni"
# email: "test@example.com", password:"test"
# email: "user@example.com", password:"user"

or as admin:
# email: "admin@admin.com", password:"admin"

Firstly login of signup as a User and create a new order(add at least one item in the cart and check it out). Log in as admin and see the new order in the "See All Orders" section. As an admin you have the option to edit any of the products listed on the website.

# Development
After checking out the repo, run bundle install to install dependencies.

Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/antonzaharia/RGadgets. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the (https://github.com/antonzaharia/RGadgets/blob/master/CODE_OF_CONDUCT.md).

# License
The gem is available as open source under the terms of the MIT License.

# Code of Conduct
Everyone interacting in the RGadgets project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the code of conduct.
