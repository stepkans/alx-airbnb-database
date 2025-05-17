SELECT 
    u.id AS user_id,
    u.username,
    COUNT(b.id) AS total_bookings
FROM user u
    LEFT JOIN booking b 
    ON u.id = b.user_id
GROUP BY u.id, u.username;


SELECT 
    p.id AS property_id,
    p.title,
    COUNT(b.id) AS total_booking,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS booking_rank
FROM property p
LEFT JOIN booking b ON p.id = b.property_id
GROUP BY p.id, p.title;