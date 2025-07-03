-- Airbnb Database Schema
-- Create a db if it doesn't exist
CREATE DATABASE IF NOT EXISTS airbnb_db;
USE airbnb_db;

-- DRop tables if they exist
DROP TABLE IF EXISTS Properties;
DROP TABLE IF EXISTS Users;

-- Create User table
CREATE TABLE Users(
  user_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(255) NULL,
  role ENUM ('guest', 'host', 'admin') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Property table
CREATE TABLE Properties(
  property_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
  host_id VARCHAR(36) DEFAULT(UUID()),
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
