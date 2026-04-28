# Bookstore Inventory Management App

A web-based application for managing bookstore inventory across multiple store locations. Users can log in to view inventory data, while administrators can update stock levels.

## Features

- User authentication with login validation (MySQL-backed)
- Displays user details (name and admin status) after login
- Selectable store locations via dropdown menu
- Dynamic inventory table loaded with AJAX
- View inventory details (title, author, stock count) by location
- Admin-only functionality to update book quantities
- Confirmation step before applying inventory changes

## Tech Stack

- Frontend: HTML, JSP, JavaScript(AJAX)
- Backend: Java (JSP/Servlets)
- Database: MySQL

## How It Works

- User logs in with credentials validated against the database
- After login, user info and store selection dropdown are displayed
- User selects a store and clicks **View/Edit**
- Inventory data is fetched via AJAX and displayed in a table
- If the user is an admin:
  - They can select a book to update
  - A confirmation page is shown
  - The stock count is updated
- User is returned to the inventory table view

## Installation

- Clone the repository:

```bash
git clone https://github.com/makiward/HenryBooks.git
cd HenryBooks
```

- Set up the MySQL database:
  - Create a database
  - Import the provided schema (if applicable)
  - Update database connection settings in the app

## Running the application:

This project is configured to run in NetBeans.

- Open the project in NetBeans
- Ensure Apache Tomcat is configured in the IDE
- Click "Run Project"
- The application will open in your browser
  - Note: If using Google Chrome, do not use "Chrome with NetBeans connector"

## Database Schema

The database schema used in this project was provided as part of a course assignment and was not originally designed by me.

A copy of the schema is included in `schema.sql` for convenience so the project can be set up and run locally.
	
## Database Notes

This project stores user credentials in the database for simplicity and demonstration purposes. In a production environment, passwords should be hashed and secured using best practices.

## Future Improvements

- Implement password hashing and authentication security
- Add search and filtering for inventory
- Improve UI/UX design
- Add pagination for large datasets
- Role-based access control enhancements

## License

This project is for educational purposes.