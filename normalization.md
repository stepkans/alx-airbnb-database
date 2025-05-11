# Database Normalization Analysis (3NF) - AirBnB Schema

## Current Schema Assessment

The initial database design consists of 6 tables:
- User
- Property 
- Booking
- Payment
- Review
- Message

## Normalization Verification

### First Normal Form (1NF)
✅ **All tables satisfy 1NF** because:
- Each table has a primary key
- All attributes contain atomic values (no repeating groups)
- No duplicate rows exist (enforced by primary keys)

### Second Normal Form (2NF)
✅ **All tables satisfy 2NF** because:
- They're all in 1NF
- All non-key attributes are fully functionally dependent on the entire primary key
  - No partial dependencies exist (all PKs are single-column)

### Third Normal Form (3NF)
✅ **All tables satisfy 3NF** because:
- They're all in 2NF
- No transitive dependencies exist (non-key attributes don't depend on other non-key attributes)

## Potential Improvements

While the schema satisfies 3NF, these enhancements could be considered:

1. **User roles normalization** (Optional):
   ```sql
   CREATE TABLE UserRole (
     role_id INT PRIMARY KEY,
     role_name VARCHAR(20) NOT NULL
   );
   
   -- Change User.role to role_id (foreign key)