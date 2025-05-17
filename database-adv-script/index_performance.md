# 📈 Index Performance Report

## 🎯 Objective

To improve query performance by identifying and indexing high-usage columns in the `user`, `booking`, and `property` tables.

---

## 🔍 Identified High-Usage Columns

The following columns were frequently used in `JOIN`, `WHERE`, or `ORDER BY` clauses and thus selected for indexing:

| Table        | Column         | Usage                                      |
|--------------|----------------|--------------------------------------------|
| `user`      | `id`           | Joins with `bookings.user_id`              |
| `booking`   | `user_id`      | Joins and filtering for user bookings      |
| `booking`   | `property_id`  | Joins and aggregation for property ranking |
| `booking`   | `check_in`     | Filtering bookings by date range           |
| `property`  | `id`           | Joins with `booking.property_id`          |

---
## 🧪 Performance Improvement Notes

- **Before Indexing:** Queries such as `SELECT * FROM Booking WHERE user_id = ?` resulted in full table scans.
- **After Indexing:** Execution plans showed usage of the respective index with a large reduction in scanned rows.

Use Example:
```sql
EXPLAIN SELECT * FROM Booking WHERE user_id = 1;

## 🛠 SQL Indexes Created

These indexes were created in `database_index.sql`:

**File: `database_index.sql`**

```sql
-- Index for user bookings
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index for property bookings
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on user ID (usually primary key)
CREATE INDEX idx_users_id ON users(id);

-- Index on property ID (usually primary key)
CREATE INDEX idx_properties_id ON properties(id);

-- Index on check-in date for date filtering
CREATE INDEX idx_bookings_checkin ON bookings(check_in);
