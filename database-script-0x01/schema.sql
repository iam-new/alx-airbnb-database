-- Airbnb Database Schema
-- Create a db if it doesn't exist
CREATE DATABASE IF NOT EXISTS airbnb_db;
USE airbnb_db;

-- Drop tables if they exist
DROP TABLE IF EXISTS Messages;
DROP TABLE IF EXISTS Reviews;
DROP TABLE IF EXISTS Payments;
DROP TABLE IF EXISTS Bookings;
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
  host_id VARCHAR(36) NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  location VARCHAR(255) NOT NULL,
  pricepernight DECIMAL NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Crete Booking Table
CREATE TABLE Bookings(
  booking_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
  property_id VARCHAR(36) NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL NOT NULL,
  status ENUM ('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE

);

-- Create Payment Table
CREATE TABLE Payments(
  payment_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
  booking_id VARCHAR(36) NOT NULL,
  amount DECIMAL NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method ENUM ('credit_card', 'paypal', 'stripe') NOT NULL,
  FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id) ON DELETE CASCADE
);

-- Create Review Table
CREATE TABLE Reviews(
  review_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
  property_id VARCHAR(36) NOT NULL,
  user_id VARCHAR(36) NOT NULL,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Properties(property_id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


-- Create Message Table
CREATE TABLE Messages(
  message_id VARCHAR(36) DEFAULT(UUID()) PRIMARY KEY,
  sender_id VARCHAR(36) NOT NULL,
  recipient_id VARCHAR(36) NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  FOREIGN KEY (recipient_id) REFERENCES Users(user_id) ON DELETE CASCADE
);


-- Create indexes for User Table
CREATE INDEX idx_user_email ON Users(email);
CREATE INDEX idx_user_role ON Users(role);

-- Booking table indexes
CREATE INDEX idx_booking_property_id ON Bookings(property_id);
CREATE INDEX idx_booking_id ON Bookings(booking_id);

-- Property table indexes
CREATE INDEX idx_booking_property_id ON Properties(property_id);

-- Payments table indexes
CREATE INDEX idx_booking_id ON Payments(booking_id);



-- Show all tables
SHOW TABLES;
