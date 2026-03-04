CREATE DATABASE CabBookingDB;

create TABLE Customers (
	customer_id int primary key,
    name VARCHAR (50),
    GENDER VARCHAR (10),
    CITY VARCHAR (10),
    SIGNUP_DATE DATE );
    
CREATE TABLE Drivers (
	Driver_id int primary key,
    name VARCHAR(50),
  join_date DATE,
  rating DECIMAL(2,1),
  city VARCHAR(50)) ;
    
create Table Bookings (
	booking_id INT primary key,
    customer_id INT,
  driver_id INT,
  vehicle_id INT,
  booking_datetime DATETIME,
  pickup_location VARCHAR(50),
  drop_location VARCHAR(50),
  distance_km DECIMAL(5,2),
  fare_amount DECIMAL(8,2),
  status VARCHAR(20),
  waiting_time_min INT,
  trip_start_time DATETIME,
  FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
  FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
  FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id));
    
create table Vehicles (
	vehicle_id int primary key,
    driver_id INT,
  vehicle_type VARCHAR(20),
  registration_no VARCHAR(20),
  FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id));


create Table Feedback (
	feedback_id int primary key,
    booking_id INT,
  customer_id INT,
  driver_id INT,
  rating DECIMAL(2,1),
  comments VARCHAR(255),
  cancel_reason VARCHAR(255),
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id));
    
INSERT INTO Customers VALUES
(1, 'Aarav Sharma', 'Male', 'Delhi', '2024-01-10'),
(2, 'Riya Mehta', 'Female', 'Mumbai', '2024-02-05'),
(3, 'Priya Singh', 'Female', 'Bangalore', '2024-03-12'),
(4, 'Rahul Verma', 'Male', 'Delhi', '2024-01-20'),
(5, 'Ananya Gupta', 'Female', 'Chennai', '2024-04-18'),
(6, 'Karan Patel', 'Male', 'Mumbai', '2024-05-02'),
(7, 'Sneha Joshi', 'Female', 'Pune', '2024-03-25'),
(8, 'Vikram Nair', 'Male', 'Bangalore', '2024-02-11');

INSERT INTO Drivers VALUES
(101, 'Ramesh Kumar', '2023-11-01', 4.5, 'Delhi'),
(102, 'Amit Singh', '2024-01-12', 3.8, 'Mumbai'),
(103, 'Sunil Yadav', '2024-02-25', 2.9, 'Bangalore'),
(104, 'Deepak Chauhan', '2023-12-15', 4.1, 'Delhi'),
(105, 'Rajesh Nair', '2024-01-30', 4.7, 'Pune'),
(106, 'Mahesh Gupta', '2024-02-18', 2.5, 'Chennai');

INSERT INTO Vehicles VALUES
(201, 101, 'Sedan', 'DL10AB1234'),
(202, 102, 'SUV', 'MH12XY5678'),
(203, 103, 'Sedan', 'KA05PQ9012'),
(204, 104, 'Hatchback', 'DL09LM3456'),
(205, 105, 'SUV', 'MH14QR7890'),
(206, 106, 'Sedan', 'TN07AS1111');

INSERT INTO Bookings VALUES
(1001, 1, 101, 201, '2025-09-10 08:10', 'Delhi', 'Gurugram', 15.2, 320.00, 'Completed', 5, '2025-09-10 08:15'),
(1002, 2, 102, 202, '2025-09-10 09:00', 'Mumbai', 'Thane', 18.6, 450.00, 'Completed', 4, '2025-09-10 09:04'),
(1003, 3, 103, 203, '2025-09-11 10:00', 'Bangalore', 'Electronic City', 12.5, 300.00, 'Completed', 3, '2025-09-11 10:03'),
(1004, 4, 104, 204, '2025-09-11 18:10', 'Delhi', 'Noida', 20.0, 480.00, 'Cancelled', 8, NULL),
(1005, 5, 106, 206, '2025-09-12 08:50', 'Chennai', 'Tambaram', 10.2, 220.00, 'Completed', 6, '2025-09-12 08:56'),
(1006, 6, 102, 202, '2025-09-13 09:30', 'Mumbai', 'Andheri', 8.0, 180.00, 'Completed', 4, '2025-09-13 09:34'),
(1007, 7, 105, 205, '2025-09-14 19:00', 'Pune', 'Kothrud', 9.8, 240.00, 'Cancelled', 7, NULL),
(1008, 8, 101, 201, '2025-09-15 20:20', 'Delhi', 'Gurugram', 17.0, 360.00, 'Completed', 5, '2025-09-15 20:25'),
(1009, 3, 103, 203, '2025-09-15 11:00', 'Bangalore', 'Marathahalli', 14.0, 330.00, 'Completed', 3, '2025-09-15 11:03'),
(1010, 2, 102, 202, '2025-09-16 08:30', 'Mumbai', 'Dadar', 6.2, 160.00, 'Cancelled', 6, NULL);

INSERT INTO Feedback VALUES
(1, 1001, 1, 101, 4.5, 'Good ride and clean car', NULL),
(2, 1002, 2, 102, 4.2, 'Smooth experience', NULL),
(3, 1003, 3, 103, 3.8, 'Driver was polite', NULL),
(4, 1004, 4, 104, NULL, NULL, 'Driver late'),
(5, 1005, 5, 106, 2.5, 'Cab not clean', NULL),
(6, 1006, 6, 102, 4.0, 'On time pickup', NULL),
(7, 1007, 7, 105, NULL, NULL, 'Customer canceled last minute'),
(8, 1008, 8, 101, 4.8, 'Very professional', NULL),
(9, 1009, 3, 103, 3.5, 'Average experience', NULL),
(10, 1010, 2, 102, NULL, NULL, 'Driver didn’t show up');

select * from customers;
select * from vehicles;
select * from feedback;
select * from drivers;
select * from bookings;
--- identify customers who have completed the most bookings
--- identify name of driver which driver assigned this registration no. mh12xy5678

SELECT d.name AS driver_name
FROM vehicles v
JOIN drivers d
ON v.driver_id = d.driver_id
WHERE v.registration_no = 'MH12XY5678';

--- 2nd method

select registration_no from vehicles;
select name from drivers;

select vehicles. registration_no, drivers. name from drivers
	natural join vehicles where vehicles. registration_no= "mh12xy5678";

--- count the number of customers who are from delhi

SELECT count(*) as count from customers where city= 'delhi';

--- make group of citys and count number of customers and drivers in each group

select city, count(city)as total from customers group by city;

SELECT 
    c.city,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT d.driver_id) AS total_drivers
FROM customers c
LEFT JOIN drivers d 
    ON c.city = d.city
GROUP BY c.city;

--- identify customers who have completed the most bookings

SELECT 
    c.name,
    COUNT(b.booking_id) AS total_completed_bookings
FROM customers c
JOIN bookings b 
    ON c.customer_id = b.customer_id
WHERE b.status = 'Completed'
GROUP BY c.customer_id, c.name
ORDER BY total_completed_bookings DESC;












