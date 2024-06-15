# WebContact

# Project Description
Developing a JSP-based web contact book where users can register, log in, and manage contacts by creating, editing, or deleting entries with details like name, phone, email, and additional notes.


# Project Requirements
- Java Development Kit (JDK) : Version 8 or higher
- Apache Tomcat : Version 9 or higher
- MySQL : Version 5.7 or higher
- Eclipse : Recommended IDE for development


# Features

### The essential features of this project are -
- User authentication with registration and secure login/logout functionality.
- Contact management for creating, editing, and deleting contacts.
- Responsive user interface designed with Bootstrap and CSS.
- Validation and error handling to ensure data integrity.
- Database interaction using JDBC for CRUD operations on MySQL.

# Project Structure and Build

## Directory Structure
- The Directory contains various types connection objects folder, the source folder which further consists of web components and ".jsp" files for authentication and performing CRUD operations. It also contains the ".war" file for packaging the project.
  
  <div align="center">
   <img src="https://github.com/Udit19-pixel/WebContact-Book/blob/main/WebContact%20Book/Project_Structure.png" alt="Project Structure" width="285" height="370">
  </div>

## Database Structure
- The database created for this project is named as "contactbase" which holds two tables which are “contact” and "info".
- The table "contact" stores the information of newly registered users who access the website. The table has ID, Name, Email and Password attributes. ID is the primary key of this table and Email and Password are used for user authorization for later purposes.
- The table "info" stores the contact details which the user creates over a period of time. This table has id, name,email, phone, about and userid as the attributes of the table. Here, id attribute is the primary key and has auto_increment on it.The about attribute stores the information of that contact that the user creates for additional information.

  <div align="center">
   <img src="https://github.com/Udit19-pixel/WebContact-Book/blob/main/WebContact%20Book/Table_Structure.png" alt="Database Structure" width="650" height="400">
  </div>

## Entity Relationship
- For better undestanding of how the MySQL database works and how the tables are connected, I have made a what is called Entity Relationship diagram showcasing the same.
  
  <div align="center">
   <img src="https://github.com/Udit19-pixel/WebContact-Book/blob/main/WebContact%20Book/ER_Diagram.png" alt="ER Diagram" width="670" height="350">
  </div>

## Integrating MySQL
- The process of integrating MySQL with the front-end of this project consists of making a connection object, data access objects, creating entities for the tables and creating servlets.
    - The connection package tries to gain access to MySQL by creating a connection object and passing on the DriverManager.getConnection() function.
    - The data access objects are created for the two tables where each object calls the attributes of the database and helps to perform the authentication and CRUD functions.
    - The entity package contains the Java setter and getter functions of assigning values to the objects that were created.
    - The servlet package consists of java code for adding and removing contacts, logging and registering the users.

## Apache Tomcat
- Apache Tomcat is an open-source implementation of the Java Servlet, JavaServer Pages (JSP), and Java Expression Language (EL) technologies.

- Project use case :
    - Tomcat serves and processes JSP pages for dynamic content in the contact management interface.
    - It helps to  manage the servlets for backend processes like CRUD operations on contact data.
    - It facilitates easy deployment and scaling of the web application as it grows.

- For my project, I am running the Tomcat's admin at port 8080 and the HTTP connection at port 8000.

  <div align="center">
   <img src="https://github.com/Udit19-pixel/WebContact-Book/blob/main/WebContact%20Book/Tomcat_Server.png" alt="Tomcat Server" width="650" height="380">
  </div>
