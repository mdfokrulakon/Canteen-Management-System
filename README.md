Canteen Management System (SQL Project)

This project is a Canteen Management System Database implemented in SQL.  
It manages customers, students, faculty, staff, managers, employees, menu items, orders, payments, reservations, and feedback.

The goal of this project is to demonstrate **database design, normalization, and SQL queries** for a real-world system.

Files

canteen_management_system.sql → Contains the full database schema, sample data insertion, and test queries.

Database Schema

The database consists of the following tables:

1. CUSTOMER – stores customer details (students, faculty).  
2. Student – student information linked with customer.  
3. Faculty – faculty information linked with customer.  
4. Reservation – reservations made by customers.  
5. Feedback – feedback given by customers.  
6. Canteen_Staff – all canteen staff details.  
7. Manager – manager information, linked with staff.  
8. Employee – employee information, linked with staff and manager.  
9. Menu_Details – menu items with prices.  
10. Orders – customer orders.  
11. Order_Details – details of each item in an order.  
12. Payment – payments made for orders.  

