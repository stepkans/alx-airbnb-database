
## Database Schema Overview

This repository contains the SQL Data Definition Language (DDL) scripts for creating the AirBnB database schema.

### Tables Created

1. **User** - Stores user account information
2. **Property** - Contains property listings
3. **Booking** - Manages reservation records
4. **Payment** - Tracks payment transactions
5. **Review** - Stores property reviews and ratings
6. **Message** - Handles user messaging

### Key Features

- UUID primary keys for all tables
- Proper foreign key relationships with ON DELETE CASCADE
- Data validation through CHECK constraints
- Automatic timestamp generation for creation/update times
- Optimized indexes for frequently queried columns
- ENUM-like behavior implemented with CHECK constraints

### Usage

1. Execute the `schema.sql` script in your PostgreSQL database:
   ```bash
   psql -U username -d dbname -f schema.sql