## Elemantra App Backend
## About Elemantra

Elemantra App is a mobile application used to manage marketplace to discover leads, designers, contractors/skilled workers backed with project management capabilities.

## How to install the project

- Clone the Repository:
   - Visit the GitHub repository containing the project.
   - Click the green “Code” button and select “Download ZIP.” This will download the entire repository as a compressed ZIP file to    your local machine.
   - Alternatively, you can use Git to clone the repository directly to your local environment. Open Git Bash or your terminal and navigate to the directory where you want to store the project. Then run the following command:
     git clone <repository_url>

- Download and install XAMPP.
    - Start XAMPP control panel
    - Start Apache and MySQL.

- Open your phpMyAdmin.

    * How to populate database with tables
    - Create a new database.
    - Open the .env file and update it with your MySQL database connection credentials (such as database name, username, and password).
    - In phpMyAdmin select your database and click on import.
    - Import elemantra.sql file.


## How to run the project

- After following all the above steps open terminal and run "php artisan serve".

## FOLDER STRUCTURE

 * ROUTES 
  - routes>>api.php
  - routes>>web.php

  //routes refers to the process of defining the routes that your application will respond to. When a request is made to your application, Laravel’s routing system determines which route matches the request and calls the corresponding controller method or closure to generate the response.

--------------------------------------------------------------------------------------------------------------------------------------

 * CONTROLLERS
  - App>>Http>>Controllers

  //controllers play a crucial role in organizing your application’s logic and handling incoming HTTP requests.

--------------------------------------------------------------------------------------------------------------------------------------

 * MIDDLEWARE
  - App>>Http>>Middleware

  //middleware acts as an intermediary layer between the user’s request and the application. It plays a crucial role in controlling and filtering HTTP traffic before it reaches the application or before the response is sent back to the user.

--------------------------------------------------------------------------------------------------------------------------------------

 * MODELS
  - app>>Models
   
   // A Model represents a database table in your application. It acts as an intermediary between your application code and the database, allowing you to query and manipulate data.



## KNOWN ISSUES AND FIXES

 * no .env file - 
    fix -  create a .env file.
           - copy all code from .env.example file and paste it in .env file then update it with your MySQL database connection.


