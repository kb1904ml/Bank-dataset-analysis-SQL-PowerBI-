
-- Cleaning Transactions table

--1. fixing currency column
UPDATE Transactions
SET Currency = UPPER(Currency)
WHERE Currency IS NOT NULL;
--2. fixing type column
UPDATE Transactions
SET Type = UPPER(Type)
WHERE Type IS NOT NULL;
--3. Updating amount column
UPDATE Transactions
SET Amount = ABS(Amount)
WHERE Amount < 0;



-- Cleaning Accounts table 
UPDATE Accounts
SET Type = UPPER(Type)
WHERE Type IS NOT NULL;
UPDATE Accounts
SET Balance = CASE WHEN Balance < 0 THEN 0 ELSE Balance END;
UPDATE Accounts
SET CustomerID = NULL
WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers);

--Cleaning Customers table
--Step 1: Trim and Proper Case for Name
--Normalize names such that they have initial capitals (e.g., "priya singh" → "Priya Singh"), and remove leading/trailing spaces.
UPDATE Customers
SET Name = 
    UPPER(LEFT(LTRIM(RTRIM(Name)), 1)) + LOWER(SUBSTRING(LTRIM(RTRIM(Name)), 2, LEN(Name)));
--Fixing Gender column
UPDATE Customers
SET Gender = 'F'
WHERE Gender IS NULL;


--Step 4: Clean Address and Email
UPDATE Customers
SET Address = NULLIF(LTRIM(RTRIM(ISNULL(Address, ''))), '');

UPDATE Customers
SET Email = NULLIF(LTRIM(RTRIM(ISNULL(Email, ''))), '');

--Step 5: Clean Phone by trimming spaces
UPDATE Customers
SET Phone = LTRIM(RTRIM(ISNULL(Phone, '')));
--Step 6: (Optional) Review AccountID for validity
--If you have an Accounts table, you may want to flag or null invalid AccountIDs:
UPDATE Customers
SET AccountID = NULL
WHERE AccountID NOT IN (SELECT AccountID FROM Accounts);



