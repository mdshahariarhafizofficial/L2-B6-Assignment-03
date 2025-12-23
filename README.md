# Vehicle Rental System - Database Design & SQL Queries

## 📋 Project Overview
A comprehensive database solution for managing a modern vehicle rental service with efficient SQL operations.

## 🎯 Objectives
- Design normalized database schema with proper relationships
- Implement business logic constraints at database level
- Create optimized SQL queries for data operations
- Ensure data integrity and consistency

## 🗺️ Entity Relationship Diagram (ERD)
**DrawSQL Link:** [INSERT_YOUR_ERD_LINK_HERE]

### Database Schema
```sql
-- Three core tables with proper relationships
1. users → User management
2. vehicles → Vehicle inventory  
3. bookings → Rental transactions
📊 Database Schema
Users Table
Column	Type	Constraints	Description
id	INT	PRIMARY KEY, AUTO_INCREMENT	User ID
name	VARCHAR(100)	NOT NULL	Full name
email	VARCHAR(100)	UNIQUE, NOT NULL	Email address
role	ENUM('Admin','Customer')	DEFAULT 'Customer'	User role
password	VARCHAR(255)	NOT NULL	Password
phone	VARCHAR(20)	NOT NULL	Contact number
Vehicles Table
Column	Type	Constraints	Description
id	INT	PRIMARY KEY, AUTO_INCREMENT	Vehicle ID
name	VARCHAR(100)	NOT NULL	Vehicle name
type	ENUM('car','bike','truck')	NOT NULL	Vehicle type
model	VARCHAR(50)	NOT NULL	Model/year
registration_number	VARCHAR(50)	UNIQUE, NOT NULL	Registration number
rental_price	DECIMAL(10,2)	NOT NULL	Daily rate
status	ENUM('available','rented','maintenance')	DEFAULT 'available'	Current status
Bookings Table
Column	Type	Constraints	Description
booking_id	INT	PRIMARY KEY, AUTO_INCREMENT	Booking ID
user_id	INT	FOREIGN KEY, NOT NULL	User reference
vehicle_id	INT	FOREIGN KEY, NOT NULL	Vehicle reference
start_date	DATE	NOT NULL	Start date
end_date	DATE	NOT NULL	End date
status	ENUM('pending','confirmed','completed','cancelled')	DEFAULT 'pending'	Status
total_cost	DECIMAL(10,2)	NOT NULL	Total cost
🔗 Relationships
One-to-Many: User → Bookings

Many-to-One: Bookings → Vehicle

Referential Integrity: Foreign key constraints

📝 SQL Queries
Query 1: JOIN Operation
sql
-- Retrieve booking info with customer and vehicle details
SELECT 
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.id
INNER JOIN vehicles v ON b.vehicle_id = v.id
ORDER BY b.booking_id;
Query 2: EXISTS Subquery
sql
-- Find vehicles never booked
SELECT 
    v.id AS vehicle_id,
    v.name,
    v.type,
    v.model,
    v.registration_number,
    v.rental_price,
    v.status
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.id
);
Query 3: WHERE Filtering
sql
-- Find available vehicles by type
SELECT 
    v.id AS vehicle_id,
    v.name,
    v.type,
    v.model,
    v.registration_number,
    v.rental_price,
    v.status
FROM vehicles v
WHERE v.type = 'car' 
  AND v.status = 'available';
Query 4: GROUP BY with HAVING
sql
-- Find vehicles with >2 bookings
SELECT 
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b ON v.id = b.vehicle_id
GROUP BY v.id, v.name
HAVING COUNT(b.booking_id) > 2
ORDER BY total_bookings DESC;
🚀 Getting Started
Installation Steps
Create Database:

sql
CREATE DATABASE vehicle_rental;
USE vehicle_rental;
Execute schema.sql (contains all table creation scripts)

Insert sample data from sample_data.sql

Test queries from queries.sql

📈 Business Logic
Unique emails for users

Unique registration numbers for vehicles

Referential integrity between tables

Status-based availability management

🛠️ Technical Features
Normalization: 3NF compliant design

Indexing: Optimized query performance

Constraints: Data validation at DB level

Relationships: Proper foreign key setup

📁 Project Structure
text
L2-B6-Assignment-03/
├── README.md          # This file
├── schema.sql         # Database schema

🧪 Sample Data Included
3 users (2 customers, 1 admin)

4 vehicles (car, bike, truck)

4 booking records

Various status scenarios

🎓 Learning Outcomes
Database design principles

ERD creation skills

SQL query optimization

Relational database management

## 👨‍💻 Developer Info

- **Name:** Md. Shahariar Hafiz  
- **Email:** shahariar.works@gmail.com  
- **GitHub:** [mdshahariarhafizofficial](https://github.com/mdshahariarhafizofficial)  
- **LinkedIn:** [devshahariarhafiz](https://www.linkedin.com/in/devshahariarhafiz)