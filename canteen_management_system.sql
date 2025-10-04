-- ========================
-- 1. CUSTOMER TABLE
-- ========================
CREATE TABLE CUSTOMER (
  Customer_ID INT PRIMARY KEY,
  Contact VARCHAR(20) NOT NULL,
  Role VARCHAR(20) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Customer_type VARCHAR(20) NOT NULL
);

INSERT INTO CUSTOMER VALUES
(1, '01710000001', 'Student', 'Rahim', 'Regular'),
(2, '01710000002', 'Faculty', 'Karim', 'VIP'),
(3, '01710000003', 'Student', 'Sultana', 'Regular'),
(4, '01710000004', 'Faculty', 'Nusrat', 'VIP');

-- ========================
-- 2. STUDENT TABLE
-- ========================
CREATE TABLE Student (
  Student_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Dept VARCHAR(20) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Student VALUES
(101, 'Rahim', 'CSE', 1),
(102, 'Sultana', 'EEE', 3);

-- ========================
-- 3. FACULTY TABLE
-- ========================
CREATE TABLE Faculty (
  Faculty_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Dept VARCHAR(20) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Faculty VALUES
(201, 'Karim', 'Math', 2),
(202, 'Nusrat', 'Physics', 4);

-- ========================
-- 4. RESERVATION TABLE
-- ========================
CREATE TABLE Reservation (
  Reservation_ID INT PRIMARY KEY,
  Reservation_Date DATE NOT NULL,
  Reservation_Time TIME NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Reservation VALUES
(301, '2025-10-01', '12:30:00', 1),
(302, '2025-10-01', '13:00:00', 2),
(303, '2025-10-02', '12:00:00', 3);

-- ========================
-- 5. FEEDBACK TABLE
-- ========================
CREATE TABLE Feedback (
  Feedback_ID INT PRIMARY KEY,
  Comment VARCHAR(255) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Feedback VALUES
(401, 'Good service', 1),
(402, 'Food was delicious', 2),
(403, 'Need more options', 3);

-- ========================
-- 6. CANTEEN STAFF
-- ========================
CREATE TABLE Canteen_Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Role VARCHAR(20) NOT NULL
);

INSERT INTO Canteen_Staff VALUES
(501, 'Imran', 'Chef'),
(502, 'Rafiq', 'Waiter'),
(503, 'Tania', 'Cleaner');

-- ========================
-- 7. MANAGER
-- ========================
CREATE TABLE Manager (
  Manager_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Contact VARCHAR(20) NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  Staff_ID INT NOT NULL,
  FOREIGN KEY (Staff_ID) REFERENCES Canteen_Staff(Staff_ID)
);

INSERT INTO Manager VALUES
(601, 'Hasan', '01710000010', 50000.00, 501);

-- ========================
-- 8. EMPLOYEE
-- ========================
CREATE TABLE Employee (
  Employee_ID INT PRIMARY KEY,
  Salary DECIMAL(10,2) NOT NULL,
  Staff_ID INT NOT NULL,
  Manager_ID INT NOT NULL,
  FOREIGN KEY (Staff_ID) REFERENCES Canteen_Staff(Staff_ID),
  FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID)
);

INSERT INTO Employee VALUES
(701, 15000.00, 502, 601),
(702, 12000.00, 503, 601);

-- ========================
-- 9. MENU DETAILS
-- ========================
CREATE TABLE Menu_Details (
  Item_ID INT PRIMARY KEY,
  Item_Name VARCHAR(50) NOT NULL,
  Price DECIMAL(8,2) NOT NULL,
  Manager_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Menu_Details VALUES
(801, 'Chicken Biryani', 120.00, 601, 701),
(802, 'Beef Curry', 150.00, 601, 701),
(803, 'Veg Salad', 80.00, 601, 702);

-- ========================
-- 10. ORDERS
-- ========================
CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Order_Date DATE NOT NULL,
  Total_Amount DECIMAL(10,2) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Orders VALUES
(901, '2025-10-01', 270.00, 1),
(902, '2025-10-01', 150.00, 2),
(903, '2025-10-02', 80.00, 3);

-- ========================
-- 11. ORDER DETAILS
-- ========================
CREATE TABLE Order_Details (
  Quantity INT NOT NULL,
  Order_ID INT NOT NULL,
  Item_ID INT NOT NULL,
  PRIMARY KEY (Order_ID, Item_ID),
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  FOREIGN KEY (Item_ID) REFERENCES Menu_Details(Item_ID)
);

INSERT INTO Order_Details VALUES
(2, 901, 801), -- Rahim ordered 2 Chicken Biryani
(1, 901, 802), -- Rahim also ordered 1 Beef Curry
(1, 902, 802), -- Karim ordered 1 Beef Curry
(1, 903, 803); -- Sultana ordered 1 Veg Salad

-- ========================
-- 12. PAYMENT
-- ========================
CREATE TABLE Payment (
  Payment_ID INT PRIMARY KEY,
  Payment_Type VARCHAR(20) NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  Order_ID INT NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Payment VALUES
(1001, 'Cash', 270.00, 901),
(1002, 'Card', 150.00, 902),
(1003, 'Mobile Banking', 80.00, 903);



-- ========================
-- 1. CUSTOMER TABLE
-- ========================
CREATE TABLE CUSTOMER (
  Customer_ID INT PRIMARY KEY,
  Contact VARCHAR(20) NOT NULL,
  Role VARCHAR(20) NOT NULL,
  Name VARCHAR(50) NOT NULL,
  Customer_type VARCHAR(20) NOT NULL
);

INSERT INTO CUSTOMER VALUES
(1, '01710000001', 'Student', 'Rahim', 'Regular'),
(2, '01710000002', 'Faculty', 'Karim', 'VIP'),
(3, '01710000003', 'Student', 'Sultana', 'Regular'),
(4, '01710000004', 'Faculty', 'Nusrat', 'VIP');

-- ========================
-- 2. STUDENT TABLE
-- ========================
CREATE TABLE Student (
  Student_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Dept VARCHAR(20) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Student VALUES
(101, 'Rahim', 'CSE', 1),
(102, 'Sultana', 'EEE', 3);

-- ========================
-- 3. FACULTY TABLE
-- ========================
CREATE TABLE Faculty (
  Faculty_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Dept VARCHAR(20) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Faculty VALUES
(201, 'Karim', 'Math', 2),
(202, 'Nusrat', 'Physics', 4);

-- ========================
-- 4. RESERVATION TABLE
-- ========================
CREATE TABLE Reservation (
  Reservation_ID INT PRIMARY KEY,
  Reservation_Date DATE NOT NULL,
  Reservation_Time TIME NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Reservation VALUES
(301, '2025-10-01', '12:30:00', 1),
(302, '2025-10-01', '13:00:00', 2),
(303, '2025-10-02', '12:00:00', 3);

-- ========================
-- 5. FEEDBACK TABLE
-- ========================
CREATE TABLE Feedback (
  Feedback_ID INT PRIMARY KEY,
  Comment VARCHAR(255) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Feedback VALUES
(401, 'Good service', 1),
(402, 'Food was delicious', 2),
(403, 'Need more options', 3);

-- ========================
-- 6. CANTEEN STAFF
-- ========================
CREATE TABLE Canteen_Staff (
  Staff_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Role VARCHAR(20) NOT NULL
);

INSERT INTO Canteen_Staff VALUES
(501, 'Imran', 'Chef'),
(502, 'Rafiq', 'Waiter'),
(503, 'Tania', 'Cleaner');

-- ========================
-- 7. MANAGER
-- ========================
CREATE TABLE Manager (
  Manager_ID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Contact VARCHAR(20) NOT NULL,
  Salary DECIMAL(10,2) NOT NULL,
  Staff_ID INT NOT NULL,
  FOREIGN KEY (Staff_ID) REFERENCES Canteen_Staff(Staff_ID)
);

INSERT INTO Manager VALUES
(601, 'Hasan', '01710000010', 50000.00, 501);

-- ========================
-- 8. EMPLOYEE
-- ========================
CREATE TABLE Employee (
  Employee_ID INT PRIMARY KEY,
  Salary DECIMAL(10,2) NOT NULL,
  Staff_ID INT NOT NULL,
  Manager_ID INT NOT NULL,
  FOREIGN KEY (Staff_ID) REFERENCES Canteen_Staff(Staff_ID),
  FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID)
);

INSERT INTO Employee VALUES
(701, 15000.00, 502, 601),
(702, 12000.00, 503, 601);

-- ========================
-- 9. MENU DETAILS
-- ========================
CREATE TABLE Menu_Details (
  Item_ID INT PRIMARY KEY,
  Item_Name VARCHAR(50) NOT NULL,
  Price DECIMAL(8,2) NOT NULL,
  Manager_ID INT NOT NULL,
  Employee_ID INT NOT NULL,
  FOREIGN KEY (Manager_ID) REFERENCES Manager(Manager_ID),
  FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

INSERT INTO Menu_Details VALUES
(801, 'Chicken Biryani', 120.00, 601, 701),
(802, 'Beef Curry', 150.00, 601, 701),
(803, 'Veg Salad', 80.00, 601, 702);

-- ========================
-- 10. ORDERS
-- ========================
CREATE TABLE Orders (
  Order_ID INT PRIMARY KEY,
  Order_Date DATE NOT NULL,
  Total_Amount DECIMAL(10,2) NOT NULL,
  Customer_ID INT NOT NULL,
  FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID)
);

INSERT INTO Orders VALUES
(901, '2025-10-01', 270.00, 1),
(902, '2025-10-01', 150.00, 2),
(903, '2025-10-02', 80.00, 3);

-- ========================
-- 11. ORDER DETAILS
-- ========================
CREATE TABLE Order_Details (
  Quantity INT NOT NULL,
  Order_ID INT NOT NULL,
  Item_ID INT NOT NULL,
  PRIMARY KEY (Order_ID, Item_ID),
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
  FOREIGN KEY (Item_ID) REFERENCES Menu_Details(Item_ID)
);

INSERT INTO Order_Details VALUES
(2, 901, 801), -- Rahim ordered 2 Chicken Biryani
(1, 901, 802), -- Rahim also ordered 1 Beef Curry
(1, 902, 802), -- Karim ordered 1 Beef Curry
(1, 903, 803); -- Sultana ordered 1 Veg Salad

-- ========================
-- 12. PAYMENT
-- ========================
CREATE TABLE Payment (
  Payment_ID INT PRIMARY KEY,
  Payment_Type VARCHAR(20) NOT NULL,
  Amount DECIMAL(10,2) NOT NULL,
  Order_ID INT NOT NULL,
  FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);

INSERT INTO Payment VALUES
(1001, 'Cash', 270.00, 901),
(1002, 'Card', 150.00, 902),
(1003, 'Mobile Banking', 80.00, 903);

