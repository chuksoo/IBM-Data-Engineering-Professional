/*
Write two statements for each of the following operators using the emp and dept tables. Be sure to include AND & OR statements as well.
OPERATORS:
= (equals)
<> (not equal to)
> (greater than)
< (less than)
in
not in
LIKE
between
not LIKE
*/

/*
Working on the emp and dept table
*/

/*
= (equals)	
*/
SELECT	*
FROM	emp
WHERE	empname = 'Ali'

SELECT	empid
FROM	emp
WHERE	deptid = 4

/*
<> (not equal to)	
*/
SELECT	*
FROM	emp
WHERE	deptid <> 4

SELECT	*
FROM	dept
WHERE	deptname <> 'Analytics'

/*
> (greater than)	
*/
SELECT	deptname
FROM	dept
WHERE	deptid < 5

SELECT	*
FROM	emp
WHERE	empid < 3

/*
< (less than)	
*/
SELECT	*
FROM	emp
WHERE	empid > 2
	OR deptid > 5

SELECT	*
FROM	dept
WHERE	deptid > 5

/*
in	
*/
SELECT	*
FROM	emp
WHERE	empname IN ('Promise', 'Uche')

SELECT	*
FROM	dept
WHERE	deptname IN ('O&G', 'Marketing', 'Admin')

/*
not in	
*/
SELECT	*
FROM	emp
WHERE	empname NOT IN ('Promise', 'Uche')

SELECT	*
FROM	dept
WHERE	deptname NOT IN ('O&G', 'Marketing', 'Admin')

/*
LIKE	
*/
SELECT	*
FROM	emp
WHERE	empname 
	LIKE '%A%' 
	OR  empname 
		LIKE 'T%'

SELECT	*
FROM	dept
WHERE	deptname LIKE 'Analytics'

/*
NOT LIKE	
*/
SELECT	*
FROM	dept
WHERE	deptid > 3
	AND	deptname 
	NOT LIKE 'DataScience'

SELECT	*
FROM	emp
WHERE	empname NOT LIKE 'Lauren'

/*
between	
*/
SELECT	*
FROM	dept
WHERE	deptid
	BETWEEN 4 AND 9

SELECT	*
FROM	emp
WHERE	empid
	BETWEEN 3 AND 5

SELECT	*
FROM	emp
WHERE	empid = 7
	OR	deptid = 7

/*
Working on the teachers table
*/

-- Filtering rows using WHERE
SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

-- Examples of WHERE comparison operators
-- Teachers with first name of Janet
SELECT first_name, last_name, school
FROM teachers
WHERE first_name = 'Janet';

-- School names not equal to F.D. Roosevelt HS
SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';

-- Teachers hired before Jan. 1, 2000
SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01';

-- Teachers earning 43,500 or more
SELECT first_name, last_name, salary
FROM teachers
WHERE salary >= 43500;

-- Teachers who earn between $40,000 and $65,000
SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

-- Filtering with LIKE AND ILIKE
SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%';

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%';

-- Combining operators using AND and OR
SELECT *
FROM teachers
WHERE school = 'Myers Middle School'
      AND salary < 40000;

SELECT *
FROM teachers
WHERE last_name = 'Cole'
      OR last_name = 'Bush';

SELECT *
FROM teachers
WHERE school = 'F.D. Roosevelt HS'
      AND (salary < 38000 OR salary > 40000);

-- SELECT statement including WHERE and ORDER BY
SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;