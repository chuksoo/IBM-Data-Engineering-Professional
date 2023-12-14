-- ========================================================================
-- Create the following table
-- ========================================================================
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS SalesRep;
DROP TABLE IF EXISTS Customer;

-- CREATE Customer Table
CREATE TABLE Customer(
    CustID      INT         NULL,
    CustName    VARCHAR(50) NULL,
    EntryDate   TIMESTAMP   NULL
);

-- CREATE SalesRep Table
CREATE TABLE SalesRep(
    RepID     INT         NULL,
    RepName   VARCHAR(50) NULL,
    HireDate  TIMESTAMP   NULL
);

-- CREATE TABLE Sales
CREATE TABLE Sales(
    SalesID           INT         NULL,
    CustID            INT         NULL,
    RepID             INT         NULL,
    SalesDate         TIMESTAMP   NULL,
    UnitCount         INT         NULL,
    VerificationCode  VARCHAR(255) NULL
);

-- ===========================================================================
-- Create Unique key on Sales.VerificationCode
-- ===========================================================================
ALTER TABLE Sales
ADD CONSTRAINT uc_VerificationCode
UNIQUE (VerificationCode);

-- ============================================================================
-- Run the following script to ensure the Constraints have been added correctly
-- ============================================================================
INSERT INTO Customer (CustName)
VALUES
    ('Ali'),
    ('Anand'),
    ('Alex'),
    ('Jack'),
    ('Nina'),
    ('Joel'),
    ('Keon'),
    ('James'),
    ('Mike'),
    ('Sai'),
    ('Terry');

INSERT INTO SalesRep (RepName)
VALUES
    ('Joseph'),
    ('Jermaine'),
    ('Marshall'),
    ('Marvin'),
    ('Mitchell'),
    ('Johnson'),
    ('Robert'),
    ('Rachel'),
    ('Rene'),
    ('Brandy'),
    ('Dirk');

INSERT INTO Sales (CustID, RepID, UnitCount, VerificationCode)
VALUES
    (100, 120, 1, 'Ver01'),
    (102, 118, 2, 'Ver02'),
    (104, 116, 3, 'Ver03'),
    (106, 114, 4, 'Ver04'),
    (108, 112, 5, 'Ver05'),
    (110, 110, 1, 'Ver06'),
    (112, 108, 2, 'Ver07'),
    (114, 106, 3, 'Ver08'),
    (116, 104, 4, 'Ver09'),
    (118, 102, 5, 'Ver10'),
    (120, 100, 6, 'Ver11');
