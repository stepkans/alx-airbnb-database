-- Step 1: Create a new partitioned bookings table
CREATE TABLE booking_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (check_in);

-- Step 2: Create partitions by year
CREATE TABLE bookings_2022 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Optional: Create default partition for other years
CREATE TABLE bookings_default PARTITION OF booking_partitioned
    DEFAULT;

-- Step 3: Index partitions if needed
CREATE INDEX idx_bookings_2023_user_id ON bookings_2023(user_id);
CREATE INDEX idx_bookings_2023_property_id ON bookings_2023(property_id);
