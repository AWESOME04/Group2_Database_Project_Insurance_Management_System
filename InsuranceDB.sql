-- The Insurance Management System project aims to create an online application that automates the work procedures of an insurance company/agency. 
-- The proposed system would provide a secure, user-friendly, and efficient database system for the management, agents, and customers of the agency.
-- It would eliminate the need for manual calculations, reduce paperwork, and provide quick access to stored data. 
-- By automating the system, the proposed system would increase productivity and reduce the chances of errors.

-- The given SQL script is a collection of several CREATE TABLE statements that create tables in a database schema. 
-- These tables represent entities in an insurance system, such as incidents, customers, insurance companies, departments, vehicles, premium payments, receipts, and insurance applications. 
-- The script also includes several constraints and indexes that define relationships between the tables and enforce data integrity.

-- To create the Insurance Management System project's database using PostgreSQL, we can create the following tables with the following fields:


-- The INCIDENT table stores information about incidents, such as their type, date, and description.
-- The table has a primary key constraint on the Incident_Id column and a unique index on the same column.

CREATE TABLE INCIDENT 
( 
 Incident_Id VARCHAR(20) NOT NULL , 
 Incident_Type VARCHAR(30) NULL , 
 Incident_Date DATE NOT NULL , 
 Description VARCHAR(100) NULL , 
 PRIMARY KEY (Incident_Id) 
);

CREATE UNIQUE INDEX XPKINCIDENT_17 ON INCIDENT 
(Incident_Id ASC); 

-- The CUSTOMER table stores information about customers, such as their name, date of birth, gender, address, and contact information. 
-- The table has a primary key constraint on the Cust_Id column and a unique index on the same column.


CREATE TABLE CUSTOMER 
( 
 Cust_Id VARCHAR(20) NOT NULL , 
 Cust_FName VARCHAR(10) NOT NULL , 
 Cust_LName VARCHAR(10) NOT NULL , 
 Cust_DOB DATE NOT NULL , 
 Cust_Gender CHAR(2) NOT NULL , 
 Cust_Address VARCHAR(20) NOT NULL , 
 Cust_MOB_Number INTEGER NOT NULL , 
 Cust_Email VARCHAR(20) NULL , 
 Cust_Passport_Number VARCHAR(20) NULL , 
 Cust_Marital_Status CHAR(8) NULL ,  
CONSTRAINT XPKCUSTOMER_1 PRIMARY KEY (Cust_Id) 
);

CREATE UNIQUE INDEX XPKCUSTOMER_1 ON CUSTOMER 
(Cust_Id ASC); 



-- The INCIDENT_REPORT table stores information about incident reports, such as their type, inspector, cost, and description. 
-- The table has a composite primary key constraint on the Incident_Report_Id, Incident_Id, and Cust_Id columns. 
-- The table also has foreign key constraints that reference the INCIDENT and CUSTOMER tables.

CREATE TABLE INCIDENT_REPORT 
( 
 Incident_Report_Id VARCHAR(20) NOT NULL , 
 Incident_Type CHAR(10) NULL , 
 Incident_Inspector VARCHAR(20) NULL , 
 Incident_Cost INTEGER NULL , 
 Incident_Report_Description VARCHAR(100) NULL , 
 Incident_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
CONSTRAINT XPKINCIDENT_REPORT_18 PRIMARY KEY 
(Incident_Report_Id,Incident_Id,Cust_Id), 
CONSTRAINT R_83 FOREIGN KEY (Incident_Id) REFERENCES INCIDENT 
(Incident_Id), 
CONSTRAINT R_86 FOREIGN KEY (Cust_Id) REFERENCES CUSTOMER 
(Cust_Id) 
);


-- The INSURANCE_COMPANY table stores information about insurance companies, such as their name, address, contact information, and location.
-- The table has a primary key constraint on the Company_Name column and a unique index on the same column.

CREATE TABLE INSURANCE_COMPANY 
( 
 Company_Name VARCHAR(20) NOT NULL PRIMARY KEY , 
 Company_Address VARCHAR(20) NULL , 
 Company_Contact_Number INTEGER NULL , 
 Company_Fax INTEGER NULL , 
 Company_Email VARCHAR(20) NULL , 
 Company_Website VARCHAR(20) NULL , 
 Company_Location VARCHAR(20) NULL , 
 Company_Department_Name VARCHAR(20) NULL , 
 Company_Office_Name VARCHAR(20) NULL);
 CREATE UNIQUE INDEX XPKINSURANCE_COMPANY_15 ON 
 INSURANCE_COMPANY (Company_Name ASC);



-- The DEPARTMENT table stores information about departments within an insurance company, such as their name, ID, staff, and offices. 
-- The table has a composite primary key constraint on the Department_Name, Department_ID, and Company_Name columns. The table also has a unique index on the same columns.

CREATE TABLE DEPARTMENT 
( 
 Department_Name VARCHAR(20) NOT NULL , 
 Department_ID CHAR(18) NOT NULL , 
 Department_Staff CHAR(18) NULL , 
 Department_Offices CHAR(18) NULL , 
 Company_Name VARCHAR(20) NOT NULL
);
CREATE UNIQUE INDEX XPKDEPARTMENT ON DEPARTMENT 
(Department_Name ASC,Department_ID ASC,Company_Name ASC);

ALTER TABLE DEPARTMENT
DROP CONSTRAINT XPK_DEPARTMENT PRIMARY KEY (Department_Name,Department_ID,Company_Name);


-- The VEHICLE_SERVICE table stores information about vehicle service companies, such as their name, address, contact information, and type. 
-- The table has a composite primary key constraint on the Vehicle_Service_Company_Name and Department_Name columns.
-- The table also has a foreign key constraint that references the DEPARTMENT table.


CREATE TABLE VEHICLE_SERVICE 
( 
 Department_Name VARCHAR(20) NOT NULL , 
 Vehicle_Service_Company_Name VARCHAR(20) NOT NULL , 
 Vehicle_Service_Address VARCHAR(20) NULL , 
 Vehicle_Service_Contact VARCHAR(20) NULL , 
 Vehicle_Service_Incharge VARCHAR(20) NULL , 
 Vehicle_Service_Type VARCHAR(20) NULL , 
Department_Id VARCHAR(20) NOT NULL , 
 Company_Name VARCHAR(20) NOT NULL , 
CONSTRAINT XPKVEHICLE_SERVICE PRIMARY KEY 
(Vehicle_Service_Company_Name,Department_Name), 
CONSTRAINT R_50 FOREIGN KEY (Department_Name, Department_Id, 
Company_Name) REFERENCES DEPARTMENT (Department_Name, 
Department_ID, Company_Name) 
);



-- The VEHICLE table stores information about vehicles, such as their registration number, value, type, and manufacturer. 
-- The table has a composite primary key constraint on the Vehicle_Id and Cust_Id columns. 
-- The table also has a foreign key constraint that references the CUSTOMER table.

CREATE TABLE VEHICLE 
( 
 Vehicle_Id VARCHAR(20) NOT NULL , 
 Policy_Id VARCHAR(20) NULL , 
 Dependent_NOK_Id VARCHAR(20) NULL , 
 Vehicle_Registration_Number VARCHAR(20) NOT NULL , 
 Vehicle_Value INTEGER NULL , 
 Vehicle_Type VARCHAR(20) NOT NULL , 
 Vehicle_Size INTEGER NULL , 
 Vehicle_Number_Of_Seat INTEGER NULL , 
 Vehicle_Manufacturer VARCHAR(20) NULL , 
 Vehicle_Engine_Number INTEGER NULL , 
 Vehicle_Chasis_Number INTEGER NULL , 
 Vehicle_Number VARCHAR(20) NULL , 
 Vehicle_Model_Number VARCHAR(20) NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
CONSTRAINT XPKVEHICLE_6 PRIMARY KEY (Vehicle_Id,Cust_Id), 
CONSTRAINT R_92 FOREIGN KEY (Cust_Id) REFERENCES CUSTOMER 
(Cust_Id)
);



-- The PREMIUM_PAYMENT table stores information about premium payments, such as their amount, schedule, and receipt ID.
-- The table has a composite primary key constraint on the Premium_Payment_Id and Cust_Id columns. The table also has a unique index on the same columns.

CREATE TABLE PREMIUM_PAYMENT 
( 
 Premium_Payment_Id VARCHAR(20) NOT NULL , 
 Policy_Number VARCHAR(20) NOT NULL , 
 Premium_Payment_Amount INTEGER NOT NULL , 
 Premium_Payment_Schedule DATE NOT NULL , 
 Receipt_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL 
);
CREATE UNIQUE INDEX XPKPREMIUM_PAYMENT_5 ON 
PREMIUM_PAYMENT 
(Premium_Payment_Id ASC,Cust_Id ASC); 



-- The RECEIPT table stores information about receipts, such as their cost and payment ID. 
-- The table has a composite primary key constraint on the Receipt_Id, Premium_Payment_Id, and Cust_Id columns.
-- The table also has a foreign key constraint that references the PREMIUM_PAYMENT table.

CREATE TABLE RECEIPT 
( 
 Receipt_Id VARCHAR(20) NOT NULL , 
 Time DATE NOT NULL , 
 Cost INTEGER NOT NULL , 
 Premium_Payment_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
 PRIMARY KEY (Receipt_Id,Premium_Payment_Id,Cust_Id), 
CONSTRAINT R_84 FOREIGN KEY (Premium_Payment_Id, Cust_Id) 
REFERENCES PREMIUM_PAYMENT (Premium_Payment_Id, Cust_Id) 
);
CREATE UNIQUE INDEX XPKRECEIPT_21 ON RECEIPT 
(Receipt_Id ASC,Premium_Payment_Id ASC,Cust_Id ASC); 


-- The APPLICATION table stores information about insurance applications, such as their status and coverage.
-- The table has a primary key constraint on the Application_Id column. 
-- The table also has foreign key constraints that reference the VEHICLE and CUSTOMER tables.

CREATE TABLE APPLICATION 
( 
 Application_Id VARCHAR(20) NOT NULL , 
 Vehicle_Id VARCHAR(20) NOT NULL , 
 Application_Status CHAR(8) NOT NULL , 
 Coverage VARCHAR(50) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
PRIMARY KEY (Application_Id,Cust_Id), 
CONSTRAINT R_93 FOREIGN KEY (Cust_Id) REFERENCES CUSTOMER 
(Cust_Id) 
);
CREATE UNIQUE INDEX XPKAPPLICATION_2 ON APPLICATION 
(Application_Id ASC,Cust_Id ASC); 


-- INSURANCE_POLICY: This table stores information about the insurance policies the company offers:
-- including the agreement ID, department name, policy number, start and expiry dates, term and condition description, application ID, and customer ID.

CREATE TABLE INSURANCE_POLICY 
( 
 Agreement_id VARCHAR(20) NOT NULL , 
 Department_Name VARCHAR(20) NULL , 
 Policy_Number VARCHAR(20) NULL , 
 Start_Date DATE NULL , 
 Expiry_Date DATE NULL , 
 Term_Condition_Description VARCHAR(100) NULL , 
 Application_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
PRIMARY KEY (Agreement_id,Application_Id,Cust_Id), 
CONSTRAINT R_95 FOREIGN KEY (Application_Id, Cust_Id) REFERENCES 
APPLICATION (Application_Id, Cust_Id) 
);
CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4 ON INSURANCE_POLICY 
(Agreement_id ASC,Application_Id ASC,Cust_Id ASC);


-- POLICY_RENEWABLE: This table stores information about policy renewals, including the renewal ID, date of renewal, type of renewal, agreement ID, application ID, and customer ID.

CREATE TABLE POLICY_RENEWABLE
( 
 Policy_Renewable_Id VARCHAR(20) NOT NULL , 
 Date_Of_Renewal DATE NOT NULL , 
 Type_Of_Renewal CHAR(15) NOT NULL , 
 Agreement_id VARCHAR(20) NOT NULL , 
 Application_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
PRIMARY KEY (Policy_Renewable_Id,Agreement_id,Application_Id,Cust_Id), 
CONSTRAINT R_101 FOREIGN KEY (Agreement_id, Application_Id, Cust_Id) 
REFERENCES INSURANCE_POLICY (Agreement_id, Application_Id, Cust_Id) 
);
CREATE UNIQUE INDEX XPKPOLICY_RENEWABLE_16 ON 
POLICY_RENEWABLE 
(Policy_Renewable_Id ASC,Agreement_id ASC,Application_Id 
ASC,Cust_Id ASC); 



-- MEMBERSHIP: This table stores information about customer memberships, including the membership ID, membership type, organization contact, and customer ID.
CREATE TABLE MEMBERSHIP 
( 
 Membership_Id VARCHAR(20) NOT NULL , 
 Membership_Type CHAR(15) NOT NULL , 
 Organisation_Contact VARCHAR(20) NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
PRIMARY KEY (Membership_Id,Cust_Id), 
CONSTRAINT R_91 FOREIGN KEY (Cust_Id) REFERENCES CUSTOMER 
(Cust_Id) 
);
CREATE UNIQUE INDEX XPKMEMBERSHIP_12 ON MEMBERSHIP 
(Membership_Id ASC,Cust_Id ASC); 


-- This table stores information about insurance quotes, including the quote ID, issue date, valid from date, valid till date, description, product ID, coverage level, application ID, and customer ID.
CREATE TABLE QU0TE 
(
Quote_Id VARCHAR(20) NOT NULL , 
 Issue_Date DATE NOT NULL , 
 Valid_From_Date DATE NOT NULL , 
 Valid_Till_Date DATE NOT NULL , 
 Description VARCHAR(100) NULL , 
 Product_Id VARCHAR(20) NOT NULL , 
 Coverage_Level VARCHAR(20) NOT NULL , 
 Application_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
 PRIMARY KEY (Quote_Id,Application_Id,Cust_Id), 
CONSTRAINT R_94 FOREIGN KEY (Application_Id, Cust_Id) REFERENCES 
APPLICATION (Application_Id, Cust_Id) 
);
CREATE UNIQUE INDEX XPKQU0TE_3 ON QU0TE 
(Quote_Id ASC,Application_Id ASC,Cust_Id ASC); 


-- This table stores information about company staff, including staff ID, first and last name, address, contact information, gender, marital status, nationality, qualification, allowance, PPS number, and company name.

CREATE TABLE STAFF 
( 
 Staff_Id VARCHAR(20) NOT NULL , 
 Staff_Fname VARCHAR(10) NULL , 
 Staff_LName VARCHAR(10) NULL , 
 Staff_Adress VARCHAR(20) NULL , 
 Staff_Contact INTEGER NULL , 
 Staff_Gender CHAR(2) NULL , 
 Staff_Marital_Status CHAR(8) NULL , 
 Staff_Nationality CHAR(15) NULL , 
 Staff_Qualification VARCHAR(20) NULL , 
 Staff_Allowance INTEGER NULL , 
 Staff_PPS_Number INTEGER NULL , 
 Company_Name VARCHAR(20) NOT NULL , 
PRIMARY KEY (Staff_Id,Company_Name), 
CONSTRAINT R_105 FOREIGN KEY (Company_Name) REFERENCES
INSURANCE_COMPANY (Company_Name) 
);
CREATE UNIQUE INDEX XPKSTAFF_9 ON STAFF 
(Staff_Id ASC,Company_Name ASC); 


-- This table stores information about customer's next of kin, including NOK ID, name, address, phone number, gender, marital status, agreement ID, application ID, and customer ID.
CREATE TABLE NOK 
( 
 Nok_Id VARCHAR(20) NOT NULL , 
 Nok_Name VARCHAR(20) NULL , 
 Nok_Address VARCHAR(20) NULL , 
 Nok_Phone_Number INTEGER NULL , 
 Nok_Gender CHAR(2) NULL , 
 Nok_Marital_Status CHAR(8) NULL , 
 Agreement_id VARCHAR(20) NOT NULL , 
 Application_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
PRIMARY KEY (Nok_Id,Agreement_id,Application_Id,Cust_Id), 
CONSTRAINT R_99 FOREIGN KEY (Agreement_id, Application_Id, Cust_Id) 
REFERENCES INSURANCE_POLICY (Agreement_id, Application_Id, Cust_Id) 
);
CREATE UNIQUE INDEX XPKNOK_14 ON NOK 
(Nok_Id ASC,Agreement_id ASC,Application_Id ASC);



-- This table stores information about the products the company offers, including product price, type, and number, and company name.
CREATE TABLE PRODUCT 
( 
 Product_Price INTEGER NULL , 
 Product_Type CHAR(15) NULL , 
 Product_Number VARCHAR(20) NOT NULL , 
 Company_Name VARCHAR(20) NOT NULL , 
PRIMARY KEY (Product_Number,Company_Name), 
CONSTRAINT R_107 FOREIGN KEY (Company_Name) REFERENCES 
	INSURANCE_COMPANY (Company_Name) 
);
CREATE UNIQUE INDEX XPKPRODUCT_20 ON PRODUCT 
(Product_Number ASC,Company_Name ASC);



-- This table stores information about the insurance coverage options the company offers, including coverage ID, coverage amount, type, level, product ID, description, terms, and company name.
CREATE TABLE COVERAGE 
( 
 Coverage_Id VARCHAR(20) NOT NULL , 
 Coverage_Amount INTEGER NOT NULL , 
 Coverage_Type CHAR(10) NOT NULL , 
 Coverage_Level CHAR(15) NOT NULL , 
 Product_Id VARCHAR(20) NOT NULL , 
 Coverage_Description VARCHAR(100) NULL , 
 Covearge_Terms VARCHAR(50) NULL , 
 Company_Name VARCHAR(20) NOT NULL , 
 PRIMARY KEY (Coverage_Id,Company_Name), 
CONSTRAINT R_102 FOREIGN KEY (Company_Name) REFERENCES 
INSURANCE_COMPANY (Company_Name) 
);

CREATE UNIQUE INDEX XPKCOVERAGE_19 ON COVERAGE 
(Coverage_Id ASC,Company_Name ASC); 


-- INSURANCE_POLICY_COVERAGE: This table stores the coverage details associated with an insurance policy.
-- The table has five columns - Agreement_id, Application_Id, Cust_Id, Coverage_Id, and Company_Name. 
-- The table has a primary key on all five columns, and two foreign keys referencing the INSURANCE_POLICY and COVERAGE tables respectively.

CREATE TABLE INSURANCE_POLICY_COVERAGE 
( 
 Agreement_id VARCHAR(20) NOT NULL , 
 Application_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
 Coverage_Id VARCHAR(20) NOT NULL , 
 Company_Name VARCHAR(20) NOT NULL , 
PRIMARY KEY (Agreement_id,Application_Id,Cust_Id,Coverage_Id,Company_Name), 
CONSTRAINT R_97 FOREIGN KEY (Agreement_id, Application_Id, Cust_Id) 
REFERENCES INSURANCE_POLICY (Agreement_id, Application_Id, Cust_Id), 
CONSTRAINT R_98 FOREIGN KEY (Coverage_Id, Company_Name) 
REFERENCES COVERAGE (Coverage_Id, Company_Name) 
);
CREATE UNIQUE INDEX XPKINSURANCE_POLICY_4_COVERAGE ON 
INSURANCE_POLICY_COVERAGE 
(Agreement_id ASC,Application_Id ASC,Cust_Id ASC,Coverage_Id 
ASC,Company_Name ASC);


-- CLAIM: This table stores information related to insurance claims made by customers. 
-- The table has eight columns - Claim_Id, Agreement_Id, Claim_Amount, Incident_Id, Damage_Type, Date_Of_Claim, Claim_Status, and Cust_Id.
-- The table has a primary key on the Claim_Id and Cust_Id columns, and a foreign key referencing the CUSTOMER table.

CREATE TABLE CLAIM 
( 
 Claim_Id VARCHAR(20) NOT NULL , 
 Agreement_Id VARCHAR(20) NOT NULL , 
 Claim_Amount INTEGER NOT NULL , 
 Incident_Id VARCHAR(20) NOT NULL , 
 Damage_Type VARCHAR(20) NOT NULL ,
Date_Of_Claim DATE NOT NULL , 
 Claim_Status CHAR(10) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
PRIMARY KEY (Claim_Id,Cust_Id), 
CONSTRAINT R_88 FOREIGN KEY (Cust_Id) REFERENCES CUSTOMER 
(Cust_Id) 
);
CREATE UNIQUE INDEX XPKCLAIM_7 ON CLAIM 
(Claim_Id ASC,Cust_Id ASC); 


-- CLAIM_SETTLEMENT: This table stores information related to the settlement of insurance claims.
-- The table has seven columns - Claim_Settlement_Id, Vehicle_Id, Date_Settled, Amount_Paid, Coverage_Id, Claim_Id, and Cust_Id. 
-- The table has a primary key on the Claim_Settlement_Id, Claim_Id, and Cust_Id columns, and a foreign key referencing the CLAIM table.
CREATE TABLE CLAIM_SETTLEMENT
( 
 Claim_Settlement_Id VARCHAR(20) NOT NULL , 
 Vehicle_Id VARCHAR(20) NOT NULL , 
 Date_Settled DATE NOT NULL , 
 Amount_Paid INTEGER NOT NULL , 
 Coverage_Id VARCHAR(20) NOT NULL , 
 Claim_Id VARCHAR(20) NOT NULL , 
 Cust_Id VARCHAR(20) NOT NULL , 
 PRIMARY KEY (Claim_Settlement_Id,Claim_Id,Cust_Id), 
CONSTRAINT R_90 FOREIGN KEY (Claim_Id, Cust_Id) REFERENCES CLAIM 
(Claim_Id, Cust_Id) 
);
CREATE UNIQUE INDEX XPKCLAIM_SETTLEMENT_8 ON 
CLAIM_SETTLEMENT 
(Claim_Settlement_Id ASC,Claim_Id ASC,Cust_Id ASC); 


-- To create locks on the tables, you can use the LOCK TABLES statement. The syntax for locking a table is as follows:
-- LOCK TABLES table_name [AS alias_name] lock_type
-- Here, table_name is the name of the table to be locked, alias_name is an optional alias for the table, and lock_type specifies the type of lock to be acquired (READ or WRITE).
-- For example, to lock the INCIDENT table for write access, you would use the following statement:


-- LOCKING THE VARIOUS TABLES
LOCK TABLES INCIDENT WRITE;

-- Similarly, you can lock the other tables as follows:

LOCK TABLES CUSTOMER WRITE;
LOCK TABLES INCIDENT_REPORT WRITE;
LOCK TABLES INSURANCE_COMPANY WRITE;
LOCK TABLES DEPARTMENT WRITE;
LOCK TABLES VEHICLE_SERVICE WRITE;
LOCK TABLES VEHICLE WRITE;
LOCK TABLES PREMIUM_PAYMENT WRITE;
LOCK TABLES RECEIPT WRITE;
LOCK TABLES APPLICATION WRITE;


-- -- Inserting Values into the various tables:

-- Insert values for INCIDENT table
INSERT INTO INCIDENT (Incident_Id, Incident_Type, Incident_Date, Description)
VALUES ('INC-001', 'Theft', '2022-01-15', 'Stolen wallet on the bus'),
('INC-002', 'Accident', '2022-02-10', 'Car collision on the highway'),
('INC-003', 'Fire', '2022-03-03', 'House fire caused by faulty wiring'),
('INC-004', 'Theft', '2022-03-05', 'Burglary at a retail store'),
('INC-005', 'Accident', '2022-03-10', 'Bicycle collision on the street');


-- Insert values for CUSTOMER table
INSERT INTO CUSTOMER (Cust_Id, Cust_FName, Cust_LName, Cust_DOB, Cust_Gender, Cust_Address, Cust_MOB_Number, Cust_Email, Cust_Passport_Number, Cust_Marital_Status)
VALUES ('C001', 'John', 'Doe', '1990-05-15', 'M', '123 Main St', 1234567890, 'johndoe@example.com', 'ABC12345', 'Single'),
('C002', 'Jane', 'Smith', '1985-12-10', 'F', '456 Maple Ave', 9876543210, 'janesmith@example.com', 'DEF67890', 'Married'),
('C003', 'Bob', 'Johnson', '1978-09-20', 'M', '789 Oak Blvd', 2345678901, 'bobjohnson@example.com', NULL, 'Single'),
('C004', 'Emily', 'Davis', '1999-07-03', 'F', '321 Elm St', 3456789012, 'emilydavis@example.com', 'GHI12345', 'Single'),
('C005', 'Alex', 'Brown', '1995-02-28', 'M', '543 Cedar Ln', 4567890123, 'alexbrown@example.com', NULL, 'Married');


-- Insert values for INCIDENT_REPORT table
INSERT INTO INCIDENT_REPORT (Incident_Report_Id, Incident_Type, Incident_Inspector, Incident_Cost, Incident_Report_Description, Incident_Id, Cust_Id)
VALUES ('IR001', 'Theft', 'James Smith', 500, 'Report filed with local police department', 'INC-001', 'C001'),
('IR002', 'Accident', 'Sarah Johnson', 1500, 'Vehicle damage assessed by insurance adjuster', 'INC-002', 'C002'),
('IR003', 'Fire', 'Michael Davis', 10000, 'Entire house lost in fire', 'INC-003', 'C004'),
('IR004', 'Theft', 'Emily Wilson', 2000, 'Stolen merchandise value estimated by store owner', 'INC-004', 'C005'),
('IR005', 'Accident', 'Daniel Lee', 750, 'Medical expenses incurred due to injury', 'INC-005', 'C003');


-- Insert values for INSURANCE_COMPANY table
INSERT INTO INSURANCE_COMPANY 
(Company_Name, Company_Address, Company_Contact_Number, Company_Fax, Company_Email, Company_Website, Company_Location, Company_Department_Name, Company_Office_Name) 
VALUES 
('ABC Insurance', '123 Main St.', 555-1234, 555-5678, 'info@abcinsurance.com', 'www.abcinsurance.com', 'New York, NY', 'Claims', 'Downtown'),
('XYZ Insurance', '456 1st Ave.', 555-2345, 555-6789, 'info@xyzinsurance.com', 'www.xyzinsurance.com', 'Los Angeles, CA', 'Underwriting', 'Westwood'),
('123 Insurance', '789 2nd St.', 555-3456, 555-7890, 'info@123insurance.com', 'www.123insurance.com', 'Chicago, IL', 'Customer Service', 'Loop'),
('PQR Insurance', '111 3rd Ave.', 555-4567, 555-8901, 'info@pqinsurance.com', 'www.pqinsurance.com', 'Houston, TX', 'Actuary', 'Galleria'),
('LMN Insurance', '222 4th St.', 555-5678, 555-9012, 'info@lmninsurance.com', 'www.lmninsurance.com', 'San Francisco, CA', 'Marketing', 'Financial District');

-- Insert values for DEPARTMENT table
INSERT INTO DEPARTMENT 
(Department_Name, Department_ID, Department_Staff, Department_Offices, Company_Name) 
VALUES 
('Claims', 'D1', 15, 2, 'ABC Insurance'),
('Underwriting', 'D2', 10, 1, 'XYZ Insurance'),
('Customer Service', 'D2', 12, 3, '123 Insurance'),
('Actuary', 'D3', 8, 1, 'PQR Insurance'),
('Marketing', 'D3', 7, 2, 'LMN Insurance');


-- Insert values for VEHICLE_SERVICE table
INSERT INTO VEHICLE_SERVICE (Department_Name, Vehicle_Service_Company_Name, Vehicle_Service_Address, Vehicle_Service_Contact, Vehicle_Service_Incharge, Vehicle_Service_Type, Department_Id, Company_Name)
VALUES ('Mechanical', 'Mechanic1', '123 Main St', '555-1234', 'John Smith', 'Repair', 'D1', 'Company1'),
('Mechanical', 'Mechanic2', '456 Elm St', '555-5678', 'Jane Doe', 'Maintenance', 'D1', 'Company1'),
('Body Shop', 'AutoBody1', '789 Oak St', '555-9012', 'Bob Johnson', 'Repair', 'D2', 'Company1'),
('Body Shop', 'AutoBody2', '321 Maple St', '555-3456', 'Mary Brown', 'Painting', 'D2', 'Company1'),
('Parts', 'Parts1', '654 Pine St', '555-7890', 'Tom Jones', 'Sales', 'D3', 'Company2');


-- Insert values for VEHICLE table
INSERT INTO VEHICLE (Vehicle_Id, Policy_Id, Dependent_NOK_Id, Vehicle_Registration_Number, Vehicle_Value, Vehicle_Type, Vehicle_Size, Vehicle_Number_Of_Seat, Vehicle_Manufacturer, Vehicle_Engine_Number, Vehicle_Chasis_Number, Vehicle_Number, Vehicle_Model_Number, Cust_Id)
VALUES ('V001', 'PLC1', 'DN1', 'KLMNO1234P', 500000, 'Car', 5, 5, 'Toyota', '1234567890', '123456789', 'KL-01-1234', 'Corolla', 'C1'),
('V002', 'PLC2', 'DN2', 'PQRST5678Q', 800000, 'SUV', 7, 7, 'Ford', '0987654321', '987654321', 'KL-02-5678', 'Explorer', 'C2'),
('V003', 'PLC3', 'DN3', 'UVWXY9012U', 600000, 'Car', 5, 5, 'Honda', '2468101214', '121416182', 'KL-03-9012', 'Accord', 'C3'),
('V004', 'PLC4', 'DN4', 'ABCDE5678A', 1000000, 'Luxury Car', 5, 4, 'Mercedes-Benz', '369121518', '151821243', 'KL-04-5678', 'S-Class', 'C4'),
('V005', 'PLC5', 'DN5', 'FGHIJ1234F', 750000, 'SUV', 7, 7, 'Jeep', '5678123456', '123456789', 'KL-05-1234', 'Grand Cherokee', 'C5');


-- Insert values for PREMIUM_PAYMENT table
INSERT INTO PREMIUM_PAYMENT 
(Premium_Payment_Id, Policy_Number, Premium_Payment_Amount, Premium_Payment_Schedule, Receipt_Id, Cust_Id)
VALUES 
('PP001', 'PN001', 1000, '2023-04-01', 'R001', 'C001'),
('PP002', 'PN002', 2000, '2023-05-01', 'R002', 'C002'),
('PP003', 'PN003', 1500, '2023-06-01', 'R003', 'C003'),
('PP004', 'PN004', 1800, '2023-07-01', 'R004', 'C004'),
('PP005', 'PN005', 2200, '2023-08-01', 'R005', 'C005');


-- Insert values for RECEIPT table
INSERT INTO RECEIPT (Receipt_Id, Time, Cost, Premium_Payment_Id, Cust_Id) 
VALUES 
('R001', '2022-01-01', 100, 'PP001', 'C001'),
('R002', '2022-02-01', 120, 'PP002', 'C002'),
('R003', '2022-03-01', 150, 'PP003', 'C003'),
('R004', '2022-04-01', 200, 'PP004', 'C004'),
('R005', '2022-05-01', 180, 'PP005', 'C005');


-- Insert values for APPLICATION table
INSERT INTO APPLICATION (Application_Id, Vehicle_Id, Application_Status, Coverage, Cust_Id) 
VALUES 
('APP001', 'V001', 'PENDING', 'FULL_COVERAGE', 'C001'),
('APP002', 'V002', 'APPROVED', 'PARTIAL_COVERAGE', 'C002'),
('APP003', 'V003', 'REJECTED', 'NO_COVERAGE', 'C003'),
('APP004', 'V004', 'PENDING', 'FULL_COVERAGE', 'C004'),
('APP005', 'V005', 'APPROVED', 'FULL_COVERAGE', 'C005');


-- Insert values for INSURANCE_POLICY table
INSERT INTO INSURANCE_POLICY (Agreement_id, Department_Name, Policy_Number, Start_Date, Expiry_Date, Term_Condition_Description, Application_Id, Cust_Id) VALUES
('POL-1001', 'Claims', 'PLC001', '2022-01-01', '2023-01-01', 'This policy covers the loss of personal belongings in the event of theft or damage.', 'APP001', 'C001'),
('POL-1002', 'Underwriting', 'PLC002', '2022-01-15', '2023-01-15', 'This policy covers the medical expenses of the policy holder in case of an accident or illness.', 'APP002', 'C002'),
('POL-1003', 'Sales', 'PLC003', '2022-02-01', '2023-02-01', 'This policy covers the damage to the insured vehicle in case of an accident or natural calamity.', 'APP003', 'C003'),
('POL-1004', 'Claims', 'PLC004', '2022-03-01', '2023-03-01', 'This policy covers the loss of income due to disability caused by an accident or illness.', 'APP004', 'C004'),
('POL-1005', 'Underwriting', 'PLC005', '2022-03-15', '2023-03-15', 'This policy covers the expenses incurred due to the damage caused by fire or natural calamity.', 'APP005', 'C005');


-- Insert values for POLICY_RENEWABLE table
INSERT INTO POLICY_RENEWABLE (Policy_Renewable_Id, Date_Of_Renewal, Type_Of_Renewal, Agreement_id, Application_Id, Cust_Id) 
VALUES 
('PR001', '2022-01-01', 'Automatic', 'A001', 'APP001', 'C001'),
('PR002', '2022-02-01', 'Manual', 'A002', 'APP002', 'C002'),
('PR003', '2022-03-01', 'Automatic', 'A003', 'APP003', 'C003'),
('PR004', '2022-04-01', 'Manual', 'A004', 'APP004', 'C004'),
('PR005', '2022-05-01', 'Automatic', 'A005', 'APP005', 'C005');


-- Insert values for MEMBERSHIP table
INSERT INTO MEMBERSHIP (Membership_Id, Membership_Type, Organisation_Contact, Cust_Id) VALUES
('M001', 'Basic', 'John Doe', 'C001'),
('M002', 'Premium', 'Jane Smith', 'C002'),
('M003', 'Gold', NULL, 'C003'),
('M004', 'Basic', 'Mike Johnson', 'C004'),
('M005', 'Premium', 'Emily Davis', 'C005');


-- Insert values for QUOTE table
INSERT INTO QU0TE (Quote_Id, Issue_Date, Valid_From_Date, Valid_Till_Date, Description, Product_Id, Coverage_Level, Application_Id, Cust_Id)
VALUES 
('Q001', '2022-01-01', '2022-02-01', '2022-03-01', 'Home insurance policy', 'P001', 'Premium', 'A001', 'C001'),
('Q002', '2022-01-05', '2022-02-05', '2022-03-05', 'Car insurance policy', 'P002', 'Basic', 'A002', 'C002'),
('Q003', '2022-01-10', '2022-02-10', '2022-03-10', 'Life insurance policy', 'P003', 'Platinum', 'A003', 'C003'),
('Q004', '2022-01-15', '2022-02-15', '2022-03-15', 'Travel insurance policy', 'P004', 'Gold', 'A004', 'C004'),
('Q005', '2022-01-20', '2022-02-20', '2022-03-20', 'Health insurance policy', 'P005', 'Silver', 'A005', 'C005');


-- Insert values for STAFF table
INSERT INTO STAFF (Staff_Id, Staff_Fname, Staff_LName, Staff_Adress, Staff_Contact, Staff_Gender, Staff_Marital_Status, Staff_Nationality, Staff_Qualification, Staff_Allowance, Staff_PPS_Number, Company_Name)
VALUES 
('S001', 'John', 'Doe', '123 Main St', 1234567890, 'M', 'Married', 'American', 'Bachelor of Science', 500, 123456789, 'Company X'),
('S002', 'Jane', 'Smith', '456 Elm St', 9876543210, 'F', 'Single', 'Canadian', 'Master of Business Administration', 1000, 987654321, 'Company Y'),
('S003', 'Bob', 'Johnson', '789 Oak St', 5555555555, 'M', 'Divorced', 'Australian', 'Bachelor of Arts', 750, 555555555, 'Company Z'),
('S004', 'Sarah', 'Lee', '321 Pine St', 1112223333, 'F', 'Widowed', 'British', 'Doctor of Medicine', 1500, 111222333, 'Company X'),
('S005', 'Tom', 'Smith', '555 Maple St', 9998887777, 'M', 'Married', 'Irish', 'Bachelor of Engineering', 1250, 999888777, 'Company Y');


-- Insert values for NOK table
INSERT INTO NOK (Nok_Id, Nok_Name, Nok_Address, Nok_Phone_Number, Nok_Gender, Nok_Marital_Status, Agreement_id, Application_Id, Cust_Id)
VALUES 
('N001', 'John Doe', '123 Main St', 1234567890, 'M', 'Married', 'A001', 'APP001', 'C001'),
('N002', 'Jane Smith', '456 Elm St', 9876543210, 'F', 'Single', 'A002', 'APP002', 'C002'),
('N003', 'Bob Johnson', '789 Oak St', 5555555555, 'M', 'Divorced', 'A003', 'APP003', 'C003'),
('N004', 'Sarah Lee', '321 Pine St', 1112223333, 'F', 'Widowed', 'A004', 'APP004', 'C004'),
('N005', 'Tom Smith', '555 Maple St', 9998887777, 'M', 'Married', 'A005', 'APP005', 'C005');



-- Insert values for PRODUCT table
INSERT INTO PRODUCT (Product_Price, Product_Type, Product_Number, Company_Name) 
VALUES 
(100, 'Type A', 'P00001', 'Company X'),
(200, 'Type B', 'P00002', 'Company Y'),
(150, 'Type A', 'P00003', 'Company Z'),
(300, 'Type C', 'P00004', 'Company X'),
(250, 'Type B', 'P00005', 'Company Y');



-- Insert values for COVERAGE table
INSERT INTO COVERAGE (Coverage_Id, Coverage_Amount, Coverage_Type, Coverage_Level, Product_Id, Coverage_Description, Covearge_Terms, Company_Name)
VALUES 
('CV001', 5000, 'Auto', 'Comprehensive', 'PD001', 'Covers damages caused by theft or fire', '12 months', 'Company A'),
('CV002', 7500, 'Home', 'Basic', 'PD002', 'Covers damages caused by fire or natural calamities', '24 months', 'Company B'),
('CV003', 10000, 'Auto', 'Third Party', 'PD003', 'Covers damages caused to third-party property', '6 months', 'Company C'),
('CV004', 2500, 'Health', 'Family', 'PD004', 'Covers medical expenses of the policyholder and their family', '36 months', 'Company D'),
('CV005', 6000, 'Home', 'Premium', 'PD005', 'Covers damages caused by fire, theft, and natural calamities', '12 months', 'Company E');


-- Insert values for INSURANCE_POLICY_COVERAGE table
INSERT INTO INSURANCE_POLICY_COVERAGE (Agreement_id, Application_Id, Cust_Id, Coverage_Id, Company_Name)
VALUES 
('AG001', 'APP001', 'C001', 'CV001', 'Company A'),
('AG002', 'APP002', 'C002', 'CV002', 'Company B'),
('AG003', 'APP003', 'C003', 'CV003', 'Company C'),
('AG004', 'APP004', 'C004', 'CV004', 'Company D'),
('AG005', 'APP005', 'C005', 'CV005', 'Company E');


-- Insert values for CLAIM table
INSERT INTO CLAIM (Claim_Id, Agreement_Id, Claim_Amount, Incident_Id, Damage_Type, Date_Of_Claim, Claim_Status, Cust_Id)
VALUES 
('CL001', 'AG001', 5000, 'INC001', 'Collision', '2022-01-01', 'Approved', 'C001'),
('CL002', 'AG002', 7500, 'INC002', 'Theft', '2022-02-15', 'Pending', 'C002'),
('CL003', 'AG003', 10000, 'INC003', 'Vandalism', '2022-03-30', 'Rejected', 'C003'),
('CL004', 'AG004', 2500, 'INC004', 'Collision', '2022-04-18', 'Approved', 'C004'),
('CL005', 'AG005', 6000, 'INC005', 'Fire', '2022-05-05', 'Pending', 'C005');


-- Insert values for CLAIM_SETTLEMENT table
INSERT INTO CLAIM_SETTLEMENT (Claim_Settlement_Id, Vehicle_Id, Date_Settled, Amount_Paid, Coverage_Id, Claim_Id, Cust_Id)
VALUES 
('CS001', 'V001', '2022-01-01', 5000, 'CV001', 'CL001', 'C001'),
('CS002', 'V002', '2022-02-15', 7500, 'CV002', 'CL002', 'C002'),
('CS003', 'V003', '2022-03-30', 10000, 'CV003', 'CL003', 'C003'),
('CS004', 'V004', '2022-04-18', 2500, 'CV004', 'CL004', 'C004'),
('CS005', 'V005', '2022-05-05', 6000, 'CV005', 'CL005', 'C005');


-- UNLOCKING TABLES AFTER USE
-- Note that you need to release the locks after you are done with them using the UNLOCK TABLES statement:

UNLOCK TABLES;

-- Also note that when you lock a table, it will be unavailable to other users until you release the lock. Therefore, you should only lock tables for as long as necessary to perform the required operations.


-- To create logins for the database, we first need to create a login using SQL Server Management Studio or by executing a SQL script. 
-- Here's an example script that creates a login named "mylogin" with the password "mypassword":
USE [master]
GO

CREATE LOGIN [mylogin] WITH PASSWORD=N'mypassword', DEFAULT_DATABASE=[mydatabase], CHECK_POLICY=OFF
GO

-- Note that the CHECK_POLICY parameter is set to "OFF" to avoid password policy requirements. You may need to adjust this depending on your specific security requirements.
-- Once the login is created, you can grant appropriate permissions to the login using SQL Server Management Studio or by executing a SQL script. 
-- Here's an example script that grants the login "mylogin" read and write access to the "mytable" table in the "mydatabase" database:


USE [mydatabase]
GO

CREATE USER [mylogin] FOR LOGIN [mylogin]
GO

ALTER ROLE [db_datareader] ADD MEMBER [mylogin]
GO

ALTER ROLE [db_datawriter] ADD MEMBER [mylogin]
GO

-- To create logins for the database, we first need to create a login using SQL Server Management Studio or by executing a SQL script. Here's an example script that creates a login named "mylogin" with the password "mypassword":

css

USE [master]
GO

CREATE LOGIN [mylogin] WITH PASSWORD=N'mypassword', DEFAULT_DATABASE=[mydatabase], CHECK_POLICY=OFF
GO

-- Note that the CHECK_POLICY parameter is set to "OFF" to avoid password policy requirements. You may need to adjust this depending on your specific security requirements.

-- Once the login is created, you can grant appropriate permissions to the login using SQL Server Management Studio or by executing a SQL script. Here's an example script that grants the login "mylogin" read and write access to the "mytable" table in the "mydatabase" database:


USE [mydatabase]
GO

CREATE USER [mylogin] FOR LOGIN [mylogin]
GO

ALTER ROLE [db_datareader] ADD MEMBER [mylogin]
GO

ALTER ROLE [db_datawriter] ADD MEMBER [mylogin]
GO


-- This script first creates a user for the login in the database, and then grants the user read and write access to the "mytable" table by adding the user to the "db_datareader" and "db_datawriter" roles, respectively.
-- Again, you may need to adjust these permissions based on your specific requirements.




-- To create an audit trail in the database above, you can use SQL Server's built-in auditing features. 
-- Here are the steps to create an audit trail for the database:

-- Create an audit:
USE [master]
GO
CREATE SERVER AUDIT [MyAudit]
TO FILE 
(   FILEPATH = N'C:\AuditLogs\' --change the path to the desired directory
    ,MAXSIZE = 0 MB
    ,MAX_ROLLOVER_FILES = 2147483647
    ,RESERVE_DISK_SPACE = OFF
)
WITH
(   QUEUE_DELAY = 1000
    ,ON_FAILURE = CONTINUE
    ,AUDIT_GUID = '5a5f77ce-0689-4496-ba85-33a49938c06e' --choose your own GUID
)
GO

ALTER SERVER AUDIT [MyAudit] WITH (STATE=ON)
GO


-- Create a database audit specification:
USE [TestDB]
GO

CREATE DATABASE AUDIT SPECIFICATION [TestDBAudit]
FOR SERVER AUDIT [MyAudit]
ADD (SELECT, INSERT, UPDATE, DELETE, EXECUTE)
WITH (STATE=ON)
GO


-- Test the audit:
SELECT * FROM [dbo].[Customers]
-- This will generate a "SELECT" audit event


-- View the audit logs:
SELECT * FROM sys.fn_get_audit_file('C:\AuditLogs\MyAudit*', DEFAULT, DEFAULT)

-- This will create an audit trail for the database, logging all SELECT, INSERT, UPDATE, DELETE, and EXECUTE operations.
-- You can customize the audit specification to include only the events you want to audit, and the audit file path to where you want to store the logs.



-- Conclusion:
-- These tables help organize and manage the various aspects of the insurance agency's operations, such as policy offerings, customer information, and financial transactions.


