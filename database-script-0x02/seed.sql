-- AirBnB Database Seed Data
-- Script 0x02: Sample data population

-- Clear existing data (optional, use with caution in production)
TRUNCATE TABLE Message, Review, Payment, Booking, Property, User RESTART IDENTITY CASCADE;

-- Insert sample users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    (uuid_generate_v4(), 'John', 'Doe', 'john.doe@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRqQph6U6m8C7WGWQO7LB/3.5QrJ7W', '+1234567890', 'guest', '2023-01-15 09:30:00'),
    (uuid_generate_v4(), 'Jane', 'Smith', 'jane.smith@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRqQph6U6m8C7WGWQO7LB/3.5QrJ7W', '+1987654321', 'host', '2023-02-20 14:15:00'),
    (uuid_generate_v4(), 'Alice', 'Johnson', 'alice.j@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRqQph6U6m8C7WGWQO7LB/3.5QrJ7W', '+1122334455', 'host', '2023-03-10 11:20:00'),
    (uuid_generate_v4(), 'Bob', 'Williams', 'bob.w@example.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRqQph6U6m8C7WGWQO7LB/3.5QrJ7W', '+1555666777', 'guest', '2023-04-05 16:45:00'),
    (uuid_generate_v4(), 'Admin', 'User', 'admin@airbnb.com', '$2a$10$N9qo8uLOickgx2ZMRZoMy.MQRqQph6U6m8C7WGWQO7LB/3.5QrJ7W', '+1000000000', 'admin', '2023-01-01 00:00:00');

-- Store user IDs for later reference
WITH user_ids AS (
    SELECT user_id FROM User WHERE email IN (
        'john.doe@example.com',
        'jane.smith@example.com',
        'alice.j@example.com',
        'bob.w@example.com',
        'admin@airbnb.com'
    )
    ORDER BY created_at
)
SELECT 
    user_id INTO TEMP TABLE temp_users
FROM user_ids;

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 1 LIMIT 1), 
     'Cozy Downtown Apartment', 
     'Beautiful 1-bedroom apartment in the heart of the city', 
     'New York, NY', 120.00, '2023-02-25 10:00:00'),
     
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 1 LIMIT 1), 
     'Beachfront Villa', 
     'Luxury villa with private beach access', 
     'Miami, FL', 350.00, '2023-03-01 12:30:00'),
     
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 2 LIMIT 1), 
     'Mountain Cabin Retreat', 
     'Rustic cabin with stunning mountain views', 
     'Aspen, CO', 180.00, '2023-03-15 09:15:00'),
     
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 2 LIMIT 1), 
     'Modern Loft', 
     'Stylish loft in arts district with great amenities', 
     'Austin, TX', 95.00, '2023-04-01 14:00:00');

-- Store property IDs for later reference
WITH property_ids AS (
    SELECT property_id FROM Property ORDER BY created_at
)
SELECT 
    property_id INTO TEMP TABLE temp_properties
FROM property_ids;

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 0 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 0 LIMIT 1), 
     '2023-06-10', '2023-06-15', 600.00, 'confirmed', '2023-05-01 08:20:00'),
     
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 1 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 3 LIMIT 1), 
     '2023-07-20', '2023-07-27', 2450.00, 'confirmed', '2023-05-15 11:45:00'),
     
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 2 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 0 LIMIT 1), 
     '2023-08-05', '2023-08-10', 900.00, 'pending', '2023-06-10 14:30:00'),
     
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 3 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 3 LIMIT 1), 
     '2023-09-01', '2023-09-03', 190.00, 'canceled', '2023-06-20 16:15:00');

-- Store booking IDs for later reference
WITH booking_ids AS (
    SELECT booking_id FROM Booking ORDER BY created_at
)
SELECT 
    booking_id INTO TEMP TABLE temp_bookings
FROM booking_ids;

-- Insert sample payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    (uuid_generate_v4(), (SELECT booking_id FROM temp_bookings OFFSET 0 LIMIT 1), 
     600.00, '2023-05-01 08:25:00', 'credit_card'),
     
    (uuid_generate_v4(), (SELECT booking_id FROM temp_bookings OFFSET 1 LIMIT 1), 
     2450.00, '2023-05-15 11:50:00', 'paypal'),
     
    (uuid_generate_v4(), (SELECT booking_id FROM temp_bookings OFFSET 3 LIMIT 1), 
     190.00, '2023-06-20 16:20:00', 'stripe');

-- Insert sample reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 0 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 0 LIMIT 1), 
     5, 'Amazing location and very comfortable!', '2023-06-16 10:00:00'),
     
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 1 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 3 LIMIT 1), 
     4, 'Beautiful villa, but the wifi was spotty', '2023-07-28 15:30:00'),
     
    (uuid_generate_v4(), (SELECT property_id FROM temp_properties OFFSET 3 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 3 LIMIT 1), 
     2, 'Noisy neighborhood, difficult to sleep', '2023-09-04 09:15:00');

-- Insert sample messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 0 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 1 LIMIT 1), 
     'Hi, is the apartment available for early check-in?', '2023-05-30 14:20:00'),
     
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 1 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 0 LIMIT 1), 
     'Yes, we can arrange for 1pm check-in', '2023-05-30 15:05:00'),
     
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 3 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 2 LIMIT 1), 
     'Is the cabin pet-friendly?', '2023-07-10 11:30:00'),
     
    (uuid_generate_v4(), (SELECT user_id FROM temp_users OFFSET 2 LIMIT 1), 
     (SELECT user_id FROM temp_users OFFSET 3 LIMIT 1), 
     'Sorry, we don''t allow pets due to allergies', '2023-07-10 12:45:00');

-- Clean up temporary tables
DROP TABLE temp_users;
DROP TABLE temp_properties;
DROP TABLE temp_bookings;