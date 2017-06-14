# Specifications for the Sinatra Assessment

Specs:
- [X] Use Sinatra to build the app - I shouldn't need to explain this one
- [X] Use ActiveRecord for storing information in a database - if you look at the models, they all inherit from ActiveRecord::Base
- [X] Include more than one model class (list of model class names e.g. User, Post, Category) - There are two models: User and Account
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) - User has many accounts and Account belongs to user
- [X] Include user accounts - User model is included
- [X] Ensure that users can't modify content created by other users - to ensure this, only user's accounts are pulled from database
- [X] Include user input validations - validates presence, negative number, and input type of email and number validates email and numbers
- [X] Display validation failures to user with error message (example form URL e.g. /posts/new) - flash message is displayed whenever an issue arises
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - please checkout my README.md for more info

Confirm
- [X] You have a large number of small Git commits - Does ~50 commits count?
- [X] Your commit messages are meaningful - I believe they are long and meaningful
- [X] You made the changes in a commit that relate to the commit message - Feel free to read my commit messages to verify
- [X] You don't include changes in a commit that aren't related to the commit message - Once again, please checkout my commits to verify this.
