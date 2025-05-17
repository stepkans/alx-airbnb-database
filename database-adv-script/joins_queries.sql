# INNER JOIN
SELECT * 
FROM bookings 
    INNER JOIN users
    ON bookings.id = users.id

# LEFT JOIN
SELECT *
FROM property
    LEFT JOIN review 
    ON property.property_id = RENAMEeview.property_id
ORDER BY property.name;

SELECT *
FROM user
    FULL OUTER JOIN booking
    ON user.id = booking.user_id
LIMIT 50;