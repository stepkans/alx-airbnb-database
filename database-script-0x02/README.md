# AirBnB Database Seed Data

## Project Structure

alx-airbnb-database/
└── database-script-0x02/
├── seed.sql
└── README.md

## Database Seed Overview

This repository contains SQL scripts to populate the AirBnB database with realistic sample data.

### Data Included

- **5 Users**: 2 guests, 2 hosts, 1 admin
- **4 Properties**: Various types in different locations
- **4 Bookings**: With different statuses (confirmed, pending, canceled)
- **3 Payments**: Covering different payment methods
- **3 Reviews**: With varied ratings and comments
- **4 Messages**: Sample conversations between users

### Usage Instructions

1. Ensure the database schema has been created using the `schema.sql` script
2. Execute the seed script:
   ```bash
   psql -U username -d dbname -f seed.sql