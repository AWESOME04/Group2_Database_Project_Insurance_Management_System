-- The Insurance Management System project aims to create an online application that automates the work procedures of an insurance company/agency. 
-- The proposed system would provide a secure, user-friendly, and efficient database system for the management, agents, and customers of the agency.
-- It would eliminate the need for manual calculations, reduce paperwork, and provide quick access to stored data. 
-- By automating the system, the proposed system would increase productivity and reduce the chances of errors.

-- To create the Insurance Management System project's database using PostgreSQL, we can create the following tables with the following fields:

-- Customer_Info Table:
-- This table stores information about the customers of the insurance agency, such as their ID, name, address, phone number, date of birth, and credit card information. 
-- It also includes a multi-policy discount field, which indicates whether the customer is eligible for a discount if they have multiple policies with the agency.


CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),  
  address VARCHAR(100),
  city VARCHAR(50),
  state VARCHAR(50),
  zip VARCHAR(10),
  phone VARCHAR(20),
  credit_card_num VARCHAR(20),
  exp_date DATE,
  multi_policy_discount NUMERIC(4,2),
  dob DATE
);


-- auto_policies table: 
-- This table stores information about the auto insurance policies offered by the agency, such as the policy number, the customer ID associated with the policy, 
-- the make and model of the vehicle, the year of the vehicle, liability coverage amount, uninsured and underinsured motorist coverage amounts, medical payment coverage amount, premium amount, collision damage amount, named insured, and any additional drivers listed on the policy.


CREATE TABLE auto_policies (
  policy_num SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  make VARCHAR(50),
  model VARCHAR(50),
  year INTEGER,
  liability_amount NUMERIC(8,2),
  um NUMERIC(8,2),
  uim NUMERIC(8,2),
  med_pay NUMERIC(8,2),
  premium_amount NUMERIC(10,2),
  collision_damage_amount NUMERIC(10,2),
  named_insured VARCHAR(100),
  additional_driver VARCHAR(100)
);



-- homeowners_policies table: 
-- This table stores information about the homeowners insurance policies offered by the agency, such as the policy number, 
-- the customer ID associated with the policy, liability coverage amount, property damage coverage amount, and premium amount.


CREATE TABLE homeowners_policies (
  policy_num SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  liability_amount NUMERIC(8,2),
  property_damage_amount NUMERIC(8,2),
  premium NUMERIC(10,2)
);



-- renters_policies table: 
-- This table stores information about the renters insurance policies offered by the agency, such as the policy number, the customer ID associated with the policy, liability coverage amount, property damage coverage amount, and premium amount.



CREATE TABLE renters_policies (
  policy_num SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  liability_amount NUMERIC(8,2),
  property_damage_amount NUMERIC(8,2),
  premium NUMERIC(10,2)
);


-- life_insurance_policies table: 
-- This table stores information about the life insurance policies offered by the agency, such as the policy number, the customer ID associated with the policy, premium amount, benefit amount, and beneficiary information.



CREATE TABLE life_insurance_policies (
  policy_num SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  premium_amount NUMERIC(10,2),
  benefit_amount NUMERIC(12,2),
  beneficiary VARCHAR(100)
);



-- payments table: 
-- This table stores information about payments made by customers towards their insurance policies, such as the payment transaction ID, the customer ID associated with the payment, the due date of the payment, the amount due, the amount paid, and whether the payment was made on time or not.



CREATE TABLE payments (
  transaction_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  due_date DATE,
  amount_due NUMERIC(10,2),
  amount_paid NUMERIC(10,2),
  paid_on_time BOOLEAN
);



-- claims table:
-- This table stores information about claims made by customers, such as the claim transaction ID, the customer ID associated with the claim, the amount of the claim, and whether the claim was approved or not.



CREATE TABLE claims (
  transaction_id SERIAL PRIMARY KEY,
  customer_id INTEGER REFERENCES customers(id),
  amount_of_claim NUMERIC(12,2),
  claim_approved BOOLEAN
);


-- Agents table: This table stores information about the insurance agents working for the company. 
-- The table contains fields such as Agent ID, Agent Name, Contact Info, Manager ID, and Commission Rate. The Manager ID field is a foreign key that links the agent to their respective manager. The Commission Rate field stores the commission percentage earned by the agent for each policy sale.

CREATE TABLE agents (
  id SERIAL PRIMARY KEY,
  manager_id INTEGER REFERENCES managers(id),
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone VARCHAR(20),
  email VARCHAR(100),
  commission_rate NUMERIC(4,2)
);


-- Managers table: This table stores information about the managers of the company. 
-- The table contains fields such as Manager ID, Manager Name, Contact Info, Branch ID, and Salary.
-- The Branch ID field is a foreign key that links the manager to their respective branch. The Salary field stores the salary of the manager.

CREATE TABLE managers (
  id SERIAL PRIMARY KEY,
  branch_name VARCHAR(100)
);


-- Inserting Values into the various tables:

-- For the Customer table:
INSERT INTO customers (first_name, last_name, address, city, state, zip, phone, credit_card_num, exp_date, multi_policy_discount, dob)
VALUES 
('John', 'Doe', '123 Main St', 'Anytown', 'CA', '12345', '555-1234', '1234567812345678', '2024-01-01', 0.05, '1990-01-01'),
('Jane', 'Smith', '456 Maple Ave', 'Sometown', 'NY', '54321', '555-5678', '2345678923456789', '2023-06-01', 0.10, '1985-05-15'),
('Bob', 'Johnson', '789 Oak St', 'Anycity', 'FL', '67890', '555-9012', '3456789034567890', '2025-12-01', 0.15, '1978-11-30'),
('Mary', 'Davis', '321 Pine St', 'Anytown', 'CA', '12345', '555-2345', '4567890145678901', '2024-03-01', 0.05, '1995-07-25'),
('Tom', 'Wilson', '654 Elm St', 'Sometown', 'NY', '54321', '555-6789', '5678901256789012', '2022-09-01', 0.10, '1982-02-14'),
('Sarah', 'Lee', '987 Cedar Ave', 'Anycity', 'FL', '67890', '555-3456', '6789012367890123', '2023-11-01', 0.15, '1992-08-08'),
('David', 'Garcia', '432 Oak St', 'Anytown', 'CA', '12345', '555-7890', '8901234589012345', '2024-05-01', 0.05, '1987-12-18'),
('Karen', 'Brown', '765 Maple Ave', 'Sometown', 'NY', '54321', '555-0123', '9012345690123456', '2022-02-01', 0.10, '1976-04-10'),
('Mike', 'Jones', '210 Pine St', 'Anycity', 'FL', '67890', '555-4567', '1234567901234567', '2025-07-01', 0.15, '1999-10-23'),
('Amy', 'Taylor', '543 Elm St', 'Anytown', 'CA', '12345', '555-8901', '2345678923456789', '2023-12-01', 0.05, '1989-03-31');

SELECT * FROM customers;

-- For the Auto_policies table:
INSERT INTO auto_policies (customer_id, make, model, year, liability_amount, um, uim, med_pay, premium_amount, collision_damage_amount, named_insured, additional_driver)
VALUES 
(11, 'Toyota', 'Corolla', 2018, 50000.00, 25000.00, 25000.00, 5000.00, 1000.00, 5000.00, 'John Smith', 'Jane Smith'),
(12, 'Ford', 'F-150', 2019, 100000.00, 50000.00, 50000.00, 10000.00, 2000.00, 10000.00, 'Bob Johnson', NULL),
(13, 'Honda', 'Civic', 2020, 75000.00, 25000.00, 50000.00, 7500.00, 1500.00, 7500.00, 'Alice Jones', NULL),
(14, 'Chevrolet', 'Malibu', 2017, 100000.00, 50000.00, 50000.00, 10000.00, 2000.00, 10000.00, 'David Lee', 'Sarah Lee'),
(15, 'Nissan', 'Altima', 2021, 50000.00, 25000.00, 25000.00, 5000.00, 1000.00, 5000.00, 'Jessica Chen', NULL),
(16, 'Toyota', 'Camry', 2018, 75000.00, 25000.00, 50000.00, 7500.00, 1500.00, 7500.00, 'Mohammed Ali', NULL),
(17, 'Jeep', 'Wrangler', 2021, 800000.00, 500000.00, 500000.00, 10000.00, 3500.00, 8000.00, 'Michael Johnson', 'Samantha Lee'),
(18, 'GMC', 'Sierra', 2015, 70000.00, 40000.00, 40000.00, 7500.00, 2200.00, 5000.00, 'Olivia Davis', 'William Wilson'),
(19, 'BMW', '3 Series', 2018, 10000.00, 75000.00, 750000.00, 15000.00, 4000.00, 10000.00, 'Kevin Chen', 'Karen Kim'),
(20, 'Mercedes-Benz', 'C-Class', 2020, 120000.00, 10000.00, 100000.00, 20000.00, 5000.00, 12000.00, 'Jennifer Kim', 'Samuel Park');

SELECT * FROM auto_policies;


-- For the homeowners_policies table:
INSERT INTO homeowners_policies (customer_id, liability_amount, property_damage_amount, premium)
VALUES
(11, 1000.00, 5000.00, 200.00),
(12, 7500.00, 3000.00, 150.00),
(13, 15000.00, 7500.00, 3000.00),
(14, 5000.00, 250.00, 100.00),
(15, 10000.00, 5000.00, 200.00),
(16, 7500.00, 3000.00, 1500.00),
(17, 2000.00, 1000.00, 400.00),
(18, 15000.00, 7500.00, 300.00),
(19, 2500.00, 12500.00, 500.00),
(20, 300.00, 1500.00, 600.00);

SELECT * FROM homeowners_policies;

-- For the renters_policies table:
INSERT INTO renters_policies (customer_id, liability_amount, property_damage_amount, premium) VALUES
(11, 50000.00, 10000.00, 250.00),
(12, 75000.00, 15000.00, 300.00),
(13, 100000.00, 20000.00, 350.00),
(14, 50000.00, 10000.00, 250.00),
(15, 75000.00, 15000.00, 300.00),
(16, 100000.00, 20000.00, 350.00),
(17, 50000.00, 10000.00, 250.00),
(18, 75000.00, 15000.00, 300.00),
(19, 100000.00, 20000.00, 350.00),
(20, 50000.00, 10000.00, 250.00);

SELECT * FROM  renters_policies;


-- For the life_insurance_policies table:
INSERT INTO life_insurance_policies (customer_id, premium_amount, benefit_amount, beneficiary) VALUES
(11, 100.00, 500000.00, 'John Doe'),
(12, 150.00, 750000.00, 'Jane Smith'),
(13, 200.00, 1000000.00, 'Mike Johnson'),
(14, 100.00, 500000.00, 'Peter Parker'),
(15, 150.00, 750000.00, 'Mary Jane'),
(16, 200.00, 1000000.00, 'Harry Osborn'),
(17, 100.00, 500000.00, 'Tony Stark'),
(18, 150.00, 750000.00, 'Steve Rogers'),
(19, 200.00, 1000000.00, 'Natasha Romanoff'),
(20, 100.00, 500000.00, 'Wanda Maximoff');

SELECT * FROM life_insurance_policies ;

-- For the payments table:
INSERT INTO payments (customer_id, due_date, amount_due, amount_paid, paid_on_time) VALUES
(11, '2022-01-31', 500.00, 500.00, TRUE),
(12, '2022-01-31', 750.00, 750.00, TRUE),
(13, '2022-01-31', 1000.00, 1000.00, TRUE),
(14, '2022-01-31', 500.00, 500.00, TRUE),
(15, '2022-01-31', 750.00, 750.00, TRUE),
(16, '2022-01-31', 1000.00, 1000.00, TRUE),
(17, '2022-01-31', 500.00, 500.00, TRUE),
(18, '2022-01-31', 750.00, 750.00, TRUE),
(19, '2022-01-31', 1000.00, 1000.00, TRUE),
(20, '2022-01-31', 500.00, 500.00, TRUE);

SELECT * FROM payments;

-- Conclusion:
-- These tables help organize and manage the various aspects of the insurance agency's operations, such as policy offerings, customer information, and financial transactions.

