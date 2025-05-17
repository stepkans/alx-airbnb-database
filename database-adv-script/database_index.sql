CREATE INDEX idx_user_email ON User (email);

CREATE INDEX idx_property_host_id ON Property (host_id);

CREATE INDEX idx_booking_property_id ON Booking (property_id);

CREATE INDEX idx_booking_user_id ON Booking (user_id);

-- DROP INDEX idx_booking_user_id ON Booking;

CREATE INDEX idx_payment_booking_id ON Payment (booking_id);

CREATE INDEX idx_review_property_id ON Review (property_id);

CREATE INDEX idx_review_user_id ON Review (user_id);

EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE
    user_id = "11111111-1111-1111-1111-111111111111";