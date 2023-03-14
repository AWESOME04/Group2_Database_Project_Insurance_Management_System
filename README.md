# Database Project Insurance Management System
For our project, we would be designing a database system for an insurance company/agency which would aid in storing, managing, retrieving, and making changes in the records of the agency.

Insurance Management System Database

This repository contains the database for an insurance management system project. The project is designed to provide an efficient and user-friendly interface for managing insurance policies, claims, and related data.
Database schema

The database schema consists of the following tables:
Customers

This table stores information about the customers who have purchased insurance policies. The table contains the following columns:

    customer_id: unique identifier for each customer
    first_name: first name of the customer
    last_name: last name of the customer
    email: email address of the customer
    phone_number: phone number of the customer
    address: address of the customer

Policies

This table stores information about the insurance policies sold to customers. The table contains the following columns:

    policy_id: unique identifier for each policy
    customer_id: foreign key to link each policy to a customer
    policy_type: type of insurance policy
    policy_start_date: start date of the policy
    policy_end_date: end date of the policy
    premium_amount: amount paid by the customer for the policy
    policy_status: status of the policy (active, expired, canceled, etc.)

Claims

This table stores information about the claims made by customers on their insurance policies. The table contains the following columns:

    claim_id: unique identifier for each claim
    policy_id: foreign key to link each claim to a policy
    claim_type: type of claim (accident, theft, fire, etc.)
    claim_date: date on which the claim was made
    claim_amount: amount claimed by the customer
    claim_status: status of the claim (pending, approved, denied, etc.)

Agents

This table stores information about the agents who sell insurance policies to customers. The table contains the following columns:

    agent_id: unique identifier for each agent
    first_name: first name of the agent
    last_name: last name of the agent
    email: email address of the agent
    phone_number: phone number of the agent
    address: address of the agent

Policies_Agents

This table is a many-to-many relationship table between Policies and Agents. It stores information about which agents sell which policies. The table contains the following columns:

    policy_id: foreign key to link each policy to a record in Policies table
    agent_id: foreign key to link each agent to a record in Agents table

Usage

The database can be used with any application or framework that supports SQL. To use the database, you can import the SQL file into your database management system and run queries against the tables.
License

This project is licensed under the MIT License. Feel free to use and modify the code as you see fit.
