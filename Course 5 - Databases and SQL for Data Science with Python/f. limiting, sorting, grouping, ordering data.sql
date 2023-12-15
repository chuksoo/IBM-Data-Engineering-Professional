/*
Lesson:		Limiting, Sorting, Group by, Order by and CASE statement
*/

-- ========================================================================
-- Lab 1: UPDATE, DELETE AND TRUNCATE
-- ========================================================================
DROP TABLE IF EXISTS Menu;
CREATE TABLE Menu (
	ItemID			SERIAL		PRIMARY KEY,
	ItemName		VARCHAR(50)	NULL,
	ItemType		VARCHAR(50)	NOT NULL,
	CostToMake		NUMERIC		NULL,
	Price			NUMERIC		NULL,
	WeeklySales		INT			NULL,
	MonthlySales	INT			NULL,
	YearlySales		INT			NULL,			
	CONSTRAINT CK_Menu CHECK (CostToMake > 0)
	);

-- 2. Run the following script to populate the table 
INSERT INTO Menu (ItemName, ItemType, CostToMake, Price, WeeklySales, MonthlySales, YearlySales)
VALUES
    ('Big Mac', 'Hamburger', 1.25, 3.24, 1015, 5000, 15853),
    ('Quarter Pounder / Cheese', 'Hamburger', 1.15, 3.24, 1000, 4589, 16095),
    ('Half Pounder / Cheese', 'Hamburger', 1.35, 3.50, 500, 3500, 12589),
    ('Whopper', 'Hamburger', 1.55, 3.99, 989, 4253, 13000),
    ('Kobe Cheeseburger', 'Hamburger', 2.25, 5.25, 350, 1500, 5000),
    ('Grilled Stuffed Burrito', 'Burrito', 0.75, 5.00, 2000, 7528, 17896),
    ('Bean Burrito', 'Burrito', 0.50, 1.00, 1750, 7000, 18853),
    ('7 layer Burrito', 'Burrito', 0.78, 2.50, 350, 1000, 2563),
    ('Dorrito Burrito', 'Burrito', 0.85, 1.50, 600, 2052, 9857),
    ('Turkey and Cheese Sub', 'Sub Sandwich', 1.75, 5.50, 1115, 7878, 16853),
    ('Philly Cheese Steak Sub', 'Sub Sandwich', 2.50, 6.00, 726, 2785, 8000),
    ('Tuna Sub', 'Sub Sandwich', 1.25, 4.50, 825, 3214, 13523),
    ('Meatball Sub', 'Sub Sandwich', 1.95, 6.50, 987, 4023, 15287),
    ('Italian Sub', 'Sub Sandwich', 2.25, 7.00, 625, 1253, 11111),
    ('3 Cheese Sub', 'Sub Sandwich', 0.25, 6.00, 815, 3000, 11853);
	
--3. Create a Menu_backup using SELECT INTO Statement
DROP TABLE IF EXISTS Menu_backup;

SELECT *
INTO Menu_backup
FROM Menu;

-- Retrieve data from Menu_backup
SELECT *
FROM Menu_backup;

--4. The 3 Cheese Sub is now made with 4 Cheeses.  The new name will be 4 Cheese Sub
UPDATE	Menu_backup
SET	ItemName = '4 Cheese Sub'
WHERE	ItemName = '3 Cheese Sub';

SELECT	ItemName
FROM	Menu_backup;

--5. Italian Sub Monthly Sales were reported incorrectly.  There were really 1353 Sales.
UPDATE	Menu_backup
SET	MonthlySales = 1353
WHERE	ItemName = 'Italian Sub';

SELECT	ItemName, MonthlySales
FROM	Menu_backup;

--6. The Whopper increased it's price to $4.25
UPDATE	Menu_backup
SET	Price = 4.25
WHERE	ItemName = 'Whopper';

--Check--
SELECT	ItemName, Price
FROM	Menu_backup;

--7. It now cost $2.75 to make the 7 layer Burrito
UPDATE	Menu_backup
SET	CostToMake = 2.75
WHERE	ItemName = '7 layer Burrito';

--Check--
SELECT	ItemName, CostToMake
FROM	Menu_backup;

--8. The prices of tortillas have gone up.  All Burrito prices should increase 10%
UPDATE	Menu_backup
SET	Price = Price + (Price * 10 /100.)
WHERE	ItemType LIKE 'Burrito';

--Check--
SELECT	*
FROM	Menu_backup
WHERE	ItemName LIKE '%Burrito';

--9. All products that bring in  < $1.00 profit per purchase need to be deleted
DELETE	FROM	Menu_backup
WHERE		(Price - CostToMake < 1);

--10. We will be discontinuing any products that didn't clear $10,000 in YearlySales Profit. (delete)
DELETE FROM		Menu_backup
WHERE			YearlySales < 10000;

--11. We just found out all the previous changes were incorrect.  Truncate the dbo.menu_backup table.
TRUNCATE TABLE Menu_backup;

--Check--
SELECT	*
FROM	Menu_backup;


-- ========================================================================
-- Lab 2: LIMITING, SORTING, GROUP BY, HAVING, ORDER BY function
-- ========================================================================
SELECT		*
FROM		Menu;

-- 3. Retrieve all Burritos and sort by Price
SELECT	*
FROM	Menu
WHERE	ItemName LIKE '%Burrito'
ORDER BY	Price;

--4. Retrieve all items that Cost more than $1.00 to make and sort by WeeklySales
SELECT	*
FROM	Menu
WHERE	CostToMake > 1
ORDER BY	WeeklySales;

--5. What's the sum of total profit by ItemType
SELECT		ItemType, SUM(Price - CostToMake) AS TotalProfit
FROM		Menu
GROUP BY	ItemType;


--6. Retrieve Total Weekly Sales by ItemType of only items with more than 3000 weekly Sales.  Sort by Total Weekly Sales descending.
SELECT		ItemType, SUM(WeeklySales) AS TotalWeeklySales																
FROM		Menu
GROUP BY	ItemType
HAVING	    SUM(WeeklySales) > 3000 
ORDER BY	TotalWeeklySales DESC;

--7. Find out the profit made Weekly, Monthly and Yearly on Big Mac's
SELECT		ItemName, WeeklySales*(Price - CostToMake) AS WeeklyProfit, 
			MonthlySales*(Price - CostToMake) AS MonthlyProfit, 
			YearlySales*(Price - CostToMake) AS YearlyProfit
FROM		Menu
WHERE		ItemName LIKE 'Big Mac';

--8. Retrieve the ItemType has more than $20,000 in Monthly Sales
SELECT		ItemType, SUM(MonthlySales)
FROM		Menu
GROUP BY	ItemType
HAVING		SUM(MonthlySales) > 20000;

--9. Retrieve the ItemType that had the best Profit from MonthlySales
SELECT		ItemType, MonthlySales*(Price - CostToMake) AS MonthlyProfit 
FROM		Menu
LIMIT 1;

--10. SQL Count
SELECT COUNT(ItemName) AS "Count of Items"
FROM Menu;

--11. Item SUM function
SELECT ItemType, SUM(price) AS "Item Price"
FROM Menu
GROUP BY ItemType;

--12. Min/Max function
SELECT 
	MIN(price) AS "Lowest price"
	, MAX(price) AS "Highest price"
	, AVG(price) AS "Average price"
FROM Menu;

--13. GROUP BY, HAVING, ORDER BY function
SELECT 
	ItemType
	, AVG(Price) AS "Average Price"
	, AVG(MonthlySales) AS "Average Sales"
FROM Menu
GROUP BY 1
HAVING AVG(Price) > 3
ORDER BY 3 DESC;

--14. CASE Statement
SELECT 
	ItemName
	, ItemType
	, CASE 
		WHEN Price > 5 THEN 'Expensive'
		WHEN Price BETWEEN 3 AND 5 THEN 'Moderately Expensive'
		WHEN Price BETWEEN 1 AND 3 THEN 'Cheap'
		ELSE 'Very Cheap'
	END AS Affordability
FROM Menu