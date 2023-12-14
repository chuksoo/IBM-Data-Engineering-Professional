-- Drop the tables in case they exist
DROP TABLE IF EXISTS coaches;
DROP TABLE IF EXISTS players;

-- Create table coaches
CREATE TABLE coaches (
	coach_id INTEGER
	, coach_name VARCHAR(50)
	, coach_type VARCHAR(25)
	, start_date DATE
);

-- Create table players 
CREATE TABLE players (
	player_id INTEGER
	, player_position VARCHAR(25)
	, jersey_number INTEGER
	, start_date DATE
);

-- Insert values into coaches table
INSERT INTO	coaches (coach_id, coach_name, coach_type, start_date)
VALUES 
	(2, 'Kliff Kingsbury', 'Quarterback Coach', '1/1/2019'::date),
	(3, 'Arthur Smith', 'Wide receiver', '1/1/2021'::date),
	(4, 'John Harbaugh', 'Offense', '1/1/2008'::date),
	(5, 'Kevin Stefanski', 'Offense', '1/1/2020'::date),
	(6, 'Vic Fangio', 'Defense', '1/1/2019'::date),
	(7, 'David Culley', 'Wide receiver', '1/1/2021'::date),
	(8, 'Frank Reich', 'Quarterback', '1/1/2018'::date),
	(9, 'Brandon Staley', 'Defense', '1/1/2021'::date),
	(10, 'Mike Zimmer', 'Running Back', '1/1/2017'::date);
	
-- Insert values into players table
INSERT INTO	players 
SELECT 2 AS player_id, 'Quarterback' AS player_position, 89 AS jersey_number, '1/1/2019'::date
UNION
SELECT 3, 'Receiver', 45, '1/1/2010'::date
UNION
SELECT 4, 'Wide receiver', 10, '1/1/2017'::date
UNION
SELECT 5, 'Offense', 22, '1/1/2021'::date
UNION
SELECT 6, 'Defense', 66, '1/1/2017'::date
UNION
SELECT 7, 'Running Back', 99, '1/1/2021'::date
UNION
SELECT 8, 'Offense', 25, '1/1/2015'::date
UNION
SELECT 9, 'Wide receiver', 19, '1/1/2021'::date
UNION
SELECT 10, 'Quarterback', 72, '1/1/2018'::date;

-- Retrieve data
/*
Retrieve All Players with Jersey numbers in the 20’s
*/
SELECT *
FROM players
WHERE jersey_number > 20; 

/*
Retrieve All Coaches with CoachID less than 5
*/
SELECT	*
FROM	coaches
WHERE	coach_id < 5;

/*
Retrieve All players who joined the team this year
*/	
SELECT	*
FROM	players
WHERE start_date BETWEEN '2021-01-01' AND '2021-12-31';

/*
Retrieve All coaches who joined the team last year
*/	
SELECT	*
FROM	coaches
WHERE	start_date BETWEEN '2020-01-01' AND '2020-12-30';

/*
Retrieve All players with PlayerID greater than 5
*/
SELECT	*
FROM	players
WHERE	player_id > 5;

/*
Retrieve All running backs
*/
SELECT	*
FROM	players
WHERE	player_position LIKE 'Running Back';

/*
Retrieve All Quarter Back Coaches
*/
SELECT	*
FROM	coaches
WHERE	coach_type LIKE 'Quarterback%';
