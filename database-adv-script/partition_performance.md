# 📊 Partitioning Performance Report

## 🎯 Objective

Optimize query performance on the large `booking` table using **range partitioning** on the `check_in` date.

---

## 🛠 Implementation

- Created a new partitioned table: `booking_partitioned`
- Partitioned by `check_in` date using **yearly ranges**
- Subtables:
  - `bookings_2022`
  - `bookings_2023`
  - `bookings_2024`
  - `bookings_default` (catch-all)

SQL script saved in: `database-adv-script/partitioning.sql`

---

## 📈 Performance Test

### 🔍 Query Used for Benchmark

```sql
EXPLAIN ANALYZE
SELECT * 
FROM booking_partitioned
WHERE check_in BETWEEN '2023-06-01' AND '2023-06-30';
