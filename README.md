# README

# Tech Stack
  - Ruby 2.6.5
  - Rails 6.0.3
  - Database sqlite3

# Database Tables
  - users

    Database table to store users data and has following attributes in table

    string   email
    
    string   name
    
    blob     profile_picture

    We will use above columns to store users data + devise columns for authentication.
  
  - posts

    Database table to store posts data and has following attributes in table

    string   content
    
    integer  posted_by
    
    blob     media

  - comments

    Database table to store comments data and has following attributes in table

    string   content
    
    integer  commented_by
    
    integer  post_id
    
    blob     media

# Controllers
  - posts_controller
    Here is the controller to interact with user requests about create and list of posts. Current user can only delete/update his/her own posts

  - comments_controller
    Here is the controller to interact with user requests about create and list of comments. Current user can only delete/update his/her own comments
