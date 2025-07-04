-- Sample Data for Airbnb Database (20 records each table)

-- Insert 20 Users
INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, role) VALUES
('John', 'Doe', 'john.doe@email.com', 'hashed_password_1', '+254701234567', 'guest'),
('Jane', 'Smith', 'jane.smith@email.com', 'hashed_password_2', '+254701234568', 'host'),
('Michael', 'Johnson', 'michael.johnson@email.com', 'hashed_password_3', '+254701234569', 'guest'),
('Sarah', 'Williams', 'sarah.williams@email.com', 'hashed_password_4', '+254701234570', 'host'),
('David', 'Brown', 'david.brown@email.com', 'hashed_password_5', '+254701234571', 'guest'),
('Lisa', 'Davis', 'lisa.davis@email.com', 'hashed_password_6', '+254701234572', 'host'),
('Robert', 'Miller', 'robert.miller@email.com', 'hashed_password_7', '+254701234573', 'guest'),
('Jennifer', 'Wilson', 'jennifer.wilson@email.com', 'hashed_password_8', '+254701234574', 'host'),
('James', 'Moore', 'james.moore@email.com', 'hashed_password_9', '+254701234575', 'guest'),
('Mary', 'Taylor', 'mary.taylor@email.com', 'hashed_password_10', '+254701234576', 'host'),
('Christopher', 'Anderson', 'christopher.anderson@email.com', 'hashed_password_11', '+254701234577', 'guest'),
('Patricia', 'Thomas', 'patricia.thomas@email.com', 'hashed_password_12', '+254701234578', 'host'),
('Matthew', 'Jackson', 'matthew.jackson@email.com', 'hashed_password_13', '+254701234579', 'guest'),
('Linda', 'White', 'linda.white@email.com', 'hashed_password_14', '+254701234580', 'host'),
('Anthony', 'Harris', 'anthony.harris@email.com', 'hashed_password_15', '+254701234581', 'guest'),
('Barbara', 'Martin', 'barbara.martin@email.com', 'hashed_password_16', '+254701234582', 'host'),
('Mark', 'Thompson', 'mark.thompson@email.com', 'hashed_password_17', '+254701234583', 'guest'),
('Susan', 'Garcia', 'susan.garcia@email.com', 'hashed_password_18', '+254701234584', 'host'),
('Daniel', 'Martinez', 'daniel.martinez@email.com', 'hashed_password_19', '+254701234585', 'guest'),
('Admin', 'User', 'admin@airbnb.com', 'hashed_password_20', '+254701234586', 'admin');

-- Insert 20 Properties (using host users only)
INSERT INTO Properties (host_id, name, description, location, pricepernight) VALUES
((SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), 'Cozy Downtown Apartment', 'Beautiful 2-bedroom apartment in Westlands with city views', 'Westlands, Nairobi', 3500.00),
((SELECT user_id FROM Users WHERE email = 'sarah.williams@email.com'), 'Beachfront Villa', 'Stunning 4-bedroom villa with direct beach access', 'Diani Beach, Mombasa', 12000.00),
((SELECT user_id FROM Users WHERE email = 'lisa.davis@email.com'), 'Mountain Retreat', 'Peaceful 3-bedroom house in the Aberdares', 'Aberdare Mountains', 5500.00),
((SELECT user_id FROM Users WHERE email = 'jennifer.wilson@email.com'), 'City Center Studio', 'Modern studio apartment in the heart of Nairobi', 'CBD, Nairobi', 2500.00),
((SELECT user_id FROM Users WHERE email = 'mary.taylor@email.com'), 'Safari Lodge', 'Luxurious lodge near Maasai Mara National Reserve', 'Maasai Mara', 15000.00),
((SELECT user_id FROM Users WHERE email = 'patricia.thomas@email.com'), 'Lakeside Cottage', 'Charming cottage overlooking Lake Naivasha', 'Lake Naivasha', 4500.00),
((SELECT user_id FROM Users WHERE email = 'linda.white@email.com'), 'Urban Loft', 'Trendy loft in Kilimani with modern amenities', 'Kilimani, Nairobi', 4000.00),
((SELECT user_id FROM Users WHERE email = 'barbara.martin@email.com'), 'Garden Apartment', 'Spacious apartment with private garden in Karen', 'Karen, Nairobi', 6000.00),
((SELECT user_id FROM Users WHERE email = 'susan.garcia@email.com'), 'Coastal Bungalow', 'Traditional Swahili bungalow near the beach', 'Malindi', 3800.00),
((SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), 'Penthouse Suite', 'Luxury penthouse with panoramic city views', 'Upperhill, Nairobi', 8000.00),
((SELECT user_id FROM Users WHERE email = 'sarah.williams@email.com'), 'Country House', 'Spacious house in the countryside near Nakuru', 'Nakuru', 4200.00),
((SELECT user_id FROM Users WHERE email = 'lisa.davis@email.com'), 'Beach House', 'Family-friendly house just steps from the beach', 'Watamu', 7500.00),
((SELECT user_id FROM Users WHERE email = 'jennifer.wilson@email.com'), 'Modern Apartment', 'Contemporary 2-bedroom apartment in Lavington', 'Lavington, Nairobi', 5000.00),
((SELECT user_id FROM Users WHERE email = 'mary.taylor@email.com'), 'Treehouse Experience', 'Unique treehouse accommodation in Sagana', 'Sagana', 3200.00),
((SELECT user_id FROM Users WHERE email = 'patricia.thomas@email.com'), 'Riverside Cabin', 'Rustic cabin by the Tana River', 'Tana River', 2800.00),
((SELECT user_id FROM Users WHERE email = 'linda.white@email.com'), 'Executive Suite', 'Business-friendly suite in Westlands', 'Westlands, Nairobi', 4500.00),
((SELECT user_id FROM Users WHERE email = 'barbara.martin@email.com'), 'Family Villa', 'Large villa perfect for family gatherings', 'Runda, Nairobi', 9000.00),
((SELECT user_id FROM Users WHERE email = 'susan.garcia@email.com'), 'Boutique Hotel Room', 'Elegant hotel room in downtown Kisumu', 'Kisumu', 3000.00),
((SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), 'Shared House', 'Comfortable shared accommodation for backpackers', 'Westlands, Nairobi', 1500.00),
((SELECT user_id FROM Users WHERE email = 'sarah.williams@email.com'), 'Luxury Tent', 'Glamping experience in the Maasai Mara', 'Maasai Mara', 18000.00);

-- Insert 20 Bookings
INSERT INTO Bookings (property_id, user_id, start_date, end_date, total_price, status) VALUES
((SELECT property_id FROM Properties WHERE name = 'Cozy Downtown Apartment'), (SELECT user_id FROM Users WHERE email = 'john.doe@email.com'), '2024-08-15', '2024-08-20', 17500.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Beachfront Villa'), (SELECT user_id FROM Users WHERE email = 'michael.johnson@email.com'), '2024-08-22', '2024-08-25', 36000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Mountain Retreat'), (SELECT user_id FROM Users WHERE email = 'david.brown@email.com'), '2024-09-01', '2024-09-05', 22000.00, 'pending'),
((SELECT property_id FROM Properties WHERE name = 'City Center Studio'), (SELECT user_id FROM Users WHERE email = 'robert.miller@email.com'), '2024-09-10', '2024-09-12', 5000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Safari Lodge'), (SELECT user_id FROM Users WHERE email = 'james.moore@email.com'), '2024-09-15', '2024-09-18', 45000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Lakeside Cottage'), (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com'), '2024-09-20', '2024-09-23', 13500.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Urban Loft'), (SELECT user_id FROM Users WHERE email = 'matthew.jackson@email.com'), '2024-09-25', '2024-09-28', 12000.00, 'pending'),
((SELECT property_id FROM Properties WHERE name = 'Garden Apartment'), (SELECT user_id FROM Users WHERE email = 'anthony.harris@email.com'), '2024-10-01', '2024-10-04', 18000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Coastal Bungalow'), (SELECT user_id FROM Users WHERE email = 'mark.thompson@email.com'), '2024-10-05', '2024-10-08', 11400.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Penthouse Suite'), (SELECT user_id FROM Users WHERE email = 'daniel.martinez@email.com'), '2024-10-10', '2024-10-13', 24000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Country House'), (SELECT user_id FROM Users WHERE email = 'john.doe@email.com'), '2024-10-15', '2024-10-18', 12600.00, 'pending'),
((SELECT property_id FROM Properties WHERE name = 'Beach House'), (SELECT user_id FROM Users WHERE email = 'michael.johnson@email.com'), '2024-10-20', '2024-10-23', 22500.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Modern Apartment'), (SELECT user_id FROM Users WHERE email = 'david.brown@email.com'), '2024-10-25', '2024-10-28', 15000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Treehouse Experience'), (SELECT user_id FROM Users WHERE email = 'robert.miller@email.com'), '2024-11-01', '2024-11-04', 9600.00, 'pending'),
((SELECT property_id FROM Properties WHERE name = 'Riverside Cabin'), (SELECT user_id FROM Users WHERE email = 'james.moore@email.com'), '2024-11-05', '2024-11-08', 8400.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Executive Suite'), (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com'), '2024-11-10', '2024-11-13', 13500.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Family Villa'), (SELECT user_id FROM Users WHERE email = 'matthew.jackson@email.com'), '2024-11-15', '2024-11-18', 27000.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Boutique Hotel Room'), (SELECT user_id FROM Users WHERE email = 'anthony.harris@email.com'), '2024-11-20', '2024-11-23', 9000.00, 'pending'),
((SELECT property_id FROM Properties WHERE name = 'Shared House'), (SELECT user_id FROM Users WHERE email = 'mark.thompson@email.com'), '2024-11-25', '2024-11-28', 4500.00, 'confirmed'),
((SELECT property_id FROM Properties WHERE name = 'Luxury Tent'), (SELECT user_id FROM Users WHERE email = 'daniel.martinez@email.com'), '2024-12-01', '2024-12-04', 54000.00, 'confirmed');

-- Insert 20 Payments
INSERT INTO Payments (booking_id, amount, payment_method) VALUES
((SELECT booking_id FROM Bookings WHERE total_price = 17500.00 LIMIT 1), 17500.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 36000.00 LIMIT 1), 36000.00, 'paypal'),
((SELECT booking_id FROM Bookings WHERE total_price = 22000.00 LIMIT 1), 22000.00, 'stripe'),
((SELECT booking_id FROM Bookings WHERE total_price = 5000.00 LIMIT 1), 5000.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 45000.00 LIMIT 1), 45000.00, 'paypal'),
((SELECT booking_id FROM Bookings WHERE total_price = 13500.00 AND user_id = (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com') LIMIT 1), 13500.00, 'stripe'),
((SELECT booking_id FROM Bookings WHERE total_price = 12000.00 LIMIT 1), 12000.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 18000.00 LIMIT 1), 18000.00, 'paypal'),
((SELECT booking_id FROM Bookings WHERE total_price = 11400.00 LIMIT 1), 11400.00, 'stripe'),
((SELECT booking_id FROM Bookings WHERE total_price = 24000.00 LIMIT 1), 24000.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 12600.00 LIMIT 1), 12600.00, 'paypal'),
((SELECT booking_id FROM Bookings WHERE total_price = 22500.00 LIMIT 1), 22500.00, 'stripe'),
((SELECT booking_id FROM Bookings WHERE total_price = 15000.00 LIMIT 1), 15000.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 9600.00 LIMIT 1), 9600.00, 'paypal'),
((SELECT booking_id FROM Bookings WHERE total_price = 8400.00 LIMIT 1), 8400.00, 'stripe'),
((SELECT booking_id FROM Bookings WHERE total_price = 13500.00 AND user_id = (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com') LIMIT 1), 13500.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 27000.00 LIMIT 1), 27000.00, 'paypal'),
((SELECT booking_id FROM Bookings WHERE total_price = 9000.00 LIMIT 1), 9000.00, 'stripe'),
((SELECT booking_id FROM Bookings WHERE total_price = 4500.00 LIMIT 1), 4500.00, 'credit_card'),
((SELECT booking_id FROM Bookings WHERE total_price = 54000.00 LIMIT 1), 54000.00, 'paypal');

-- Insert 20 Reviews
INSERT INTO Reviews (property_id, user_id, rating, comment) VALUES
((SELECT property_id FROM Properties WHERE name = 'Cozy Downtown Apartment'), (SELECT user_id FROM Users WHERE email = 'john.doe@email.com'), 5, 'Amazing apartment! Perfect location and very clean.'),
((SELECT property_id FROM Properties WHERE name = 'Beachfront Villa'), (SELECT user_id FROM Users WHERE email = 'michael.johnson@email.com'), 4, 'Beautiful villa with stunning ocean views. Highly recommend!'),
((SELECT property_id FROM Properties WHERE name = 'Mountain Retreat'), (SELECT user_id FROM Users WHERE email = 'david.brown@email.com'), 5, 'Peaceful and relaxing getaway. Perfect for nature lovers.'),
((SELECT property_id FROM Properties WHERE name = 'City Center Studio'), (SELECT user_id FROM Users WHERE email = 'robert.miller@email.com'), 3, 'Good location but a bit small. Clean and functional.'),
((SELECT property_id FROM Properties WHERE name = 'Safari Lodge'), (SELECT user_id FROM Users WHERE email = 'james.moore@email.com'), 5, 'Unforgettable safari experience! Luxury at its finest.'),
((SELECT property_id FROM Properties WHERE name = 'Lakeside Cottage'), (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com'), 4, 'Charming cottage with beautiful lake views. Very peaceful.'),
((SELECT property_id FROM Properties WHERE name = 'Urban Loft'), (SELECT user_id FROM Users WHERE email = 'matthew.jackson@email.com'), 4, 'Modern and stylish. Great amenities and good location.'),
((SELECT property_id FROM Properties WHERE name = 'Garden Apartment'), (SELECT user_id FROM Users WHERE email = 'anthony.harris@email.com'), 5, 'Spacious apartment with lovely garden. Perfect for families.'),
((SELECT property_id FROM Properties WHERE name = 'Coastal Bungalow'), (SELECT user_id FROM Users WHERE email = 'mark.thompson@email.com'), 4, 'Authentic Swahili architecture. Close to the beach.'),
((SELECT property_id FROM Properties WHERE name = 'Penthouse Suite'), (SELECT user_id FROM Users WHERE email = 'daniel.martinez@email.com'), 5, 'Luxury penthouse with incredible city views. Worth every penny!'),
((SELECT property_id FROM Properties WHERE name = 'Country House'), (SELECT user_id FROM Users WHERE email = 'john.doe@email.com'), 3, 'Nice house but a bit far from town. Good for quiet retreats.'),
((SELECT property_id FROM Properties WHERE name = 'Beach House'), (SELECT user_id FROM Users WHERE email = 'michael.johnson@email.com'), 5, 'Perfect beach house! Direct beach access and family friendly.'),
((SELECT property_id FROM Properties WHERE name = 'Modern Apartment'), (SELECT user_id FROM Users WHERE email = 'david.brown@email.com'), 4, 'Contemporary design with all modern amenities. Great stay.'),
((SELECT property_id FROM Properties WHERE name = 'Treehouse Experience'), (SELECT user_id FROM Users WHERE email = 'robert.miller@email.com'), 5, 'Unique and adventurous! Kids loved the treehouse experience.'),
((SELECT property_id FROM Properties WHERE name = 'Riverside Cabin'), (SELECT user_id FROM Users WHERE email = 'james.moore@email.com'), 4, 'Rustic charm by the river. Great for fishing and relaxation.'),
((SELECT property_id FROM Properties WHERE name = 'Executive Suite'), (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com'), 4, 'Perfect for business travelers. Good wifi and workspace.'),
((SELECT property_id FROM Properties WHERE name = 'Family Villa'), (SELECT user_id FROM Users WHERE email = 'matthew.jackson@email.com'), 5, 'Excellent for large groups. Spacious and well-equipped.'),
((SELECT property_id FROM Properties WHERE name = 'Boutique Hotel Room'), (SELECT user_id FROM Users WHERE email = 'anthony.harris@email.com'), 3, 'Nice room but service could be better. Good value for money.'),
((SELECT property_id FROM Properties WHERE name = 'Shared House'), (SELECT user_id FROM Users WHERE email = 'mark.thompson@email.com'), 4, 'Great for budget travelers. Clean and safe accommodation.'),
((SELECT property_id FROM Properties WHERE name = 'Luxury Tent'), (SELECT user_id FROM Users WHERE email = 'daniel.martinez@email.com'), 5, 'Incredible glamping experience! Safari and luxury combined perfectly.');

-- Insert 20 Messages
INSERT INTO Messages (sender_id, recipient_id, message_body) VALUES
((SELECT user_id FROM Users WHERE email = 'john.doe@email.com'), (SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), 'Hi! Is your apartment available for the dates I requested?'),
((SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), (SELECT user_id FROM Users WHERE email = 'john.doe@email.com'), 'Hello! Yes, the apartment is available. Looking forward to hosting you!'),
((SELECT user_id FROM Users WHERE email = 'michael.johnson@email.com'), (SELECT user_id FROM Users WHERE email = 'sarah.williams@email.com'), 'Hello, I have some questions about the beachfront villa.'),
((SELECT user_id FROM Users WHERE email = 'sarah.williams@email.com'), (SELECT user_id FROM Users WHERE email = 'michael.johnson@email.com'), 'Feel free to ask any questions about the villa!'),
((SELECT user_id FROM Users WHERE email = 'david.brown@email.com'), (SELECT user_id FROM Users WHERE email = 'lisa.davis@email.com'), 'Is parking available at the mountain retreat?'),
((SELECT user_id FROM Users WHERE email = 'lisa.davis@email.com'), (SELECT user_id FROM Users WHERE email = 'david.brown@email.com'), 'Yes, there is free parking available for guests.'),
((SELECT user_id FROM Users WHERE email = 'robert.miller@email.com'), (SELECT user_id FROM Users WHERE email = 'jennifer.wilson@email.com'), 'What is the check-in time for the studio apartment?'),
((SELECT user_id FROM Users WHERE email = 'jennifer.wilson@email.com'), (SELECT user_id FROM Users WHERE email = 'robert.miller@email.com'), 'Check-in is from 2 PM onwards. Let me know your arrival time.'),
((SELECT user_id FROM Users WHERE email = 'james.moore@email.com'), (SELECT user_id FROM Users WHERE email = 'mary.taylor@email.com'), 'Can you arrange airport pickup for the safari lodge?'),
((SELECT user_id FROM Users WHERE email = 'mary.taylor@email.com'), (SELECT user_id FROM Users WHERE email = 'james.moore@email.com'), 'Yes, we can arrange airport pickup for an additional fee.'),
((SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com'), (SELECT user_id FROM Users WHERE email = 'patricia.thomas@email.com'), 'Are pets allowed at the lakeside cottage?'),
((SELECT user_id FROM Users WHERE email = 'patricia.thomas@email.com'), (SELECT user_id FROM Users WHERE email = 'christopher.anderson@email.com'), 'Sorry, pets are not allowed at this property.'),
((SELECT user_id FROM Users WHERE email = 'matthew.jackson@email.com'), (SELECT user_id FROM Users WHERE email = 'linda.white@email.com'), 'Is there a gym in the building?'),
((SELECT user_id FROM Users WHERE email = 'linda.white@email.com'), (SELECT user_id FROM Users WHERE email = 'matthew.jackson@email.com'), 'Yes, there is a gym and swimming pool available for guests.'),
((SELECT user_id FROM Users WHERE email = 'anthony.harris@email.com'), (SELECT user_id FROM Users WHERE email = 'barbara.martin@email.com'), 'Thank you for the wonderful stay! The garden was beautiful.'),
((SELECT user_id FROM Users WHERE email = 'barbara.martin@email.com'), (SELECT user_id FROM Users WHERE email = 'anthony.harris@email.com'), 'Thank you for the great review! You are welcome back anytime.'),
((SELECT user_id FROM Users WHERE email = 'mark.thompson@email.com'), (SELECT user_id FROM Users WHERE email = 'susan.garcia@email.com'), 'Is WiFi available at the coastal bungalow?'),
((SELECT user_id FROM Users WHERE email = 'susan.garcia@email.com'), (SELECT user_id FROM Users WHERE email = 'mark.thompson@email.com'), 'Yes, free WiFi is available throughout the property.'),
((SELECT user_id FROM Users WHERE email = 'daniel.martinez@email.com'), (SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), 'Can I get a late checkout for the penthouse?'),
((SELECT user_id FROM Users WHERE email = 'jane.smith@email.com'), (SELECT user_id FROM Users WHERE email = 'daniel.martinez@email.com'), 'Late checkout until 2 PM is available for an additional fee.');

-- Display counts of all tables
SELECT 'Users' AS table_name, COUNT(*) AS record_count FROM Users
UNION ALL
SELECT 'Properties' AS table_name, COUNT(*) AS record_count FROM Properties  
UNION ALL
SELECT 'Bookings' AS table_name, COUNT(*) AS record_count FROM Bookings
UNION ALL
SELECT 'Payments' AS table_name, COUNT(*) AS record_count FROM Payments
UNION ALL
SELECT 'Reviews' AS table_name, COUNT(*) AS record_count FROM Reviews
UNION ALL
SELECT 'Messages' AS table_name, COUNT(*) AS record_count FROM Messages;
