-- Drop the tables in case they exist
DROP TABLE  IF EXISTS emp;
DROP TABLE  IF EXISTS dept;

-- Create table emp
CREATE TABLE emp (
	empid INTEGER,
	empname VARCHAR(50),
	deptid INTEGER
);

-- Insert into table emp
INSERT INTO emp (empid, empname, deptid)
VALUES (5, 'Tanya', 4);

INSERT INTO emp (empid, empname, deptid)
VALUES (4, 'Keke', 3);

INSERT INTO emp (empid, empname, deptid)
VALUES (6, 'Uche', 5);

-- Create table dept
CREATE TABLE dept (
	deptid INTEGER,
	deptname VARCHAR(50)
);

-- Insert into table dept
INSERT INTO dept (deptid, deptname)
VALUES (1, 'DataScience'),
       (2, 'SQL'),
       (3, 'SRSS'),
       (4, 'Analytics'),
       (5, 'BI');

-- Select from emp and dept
SELECT * FROM emp;

SELECT * FROM dept;
