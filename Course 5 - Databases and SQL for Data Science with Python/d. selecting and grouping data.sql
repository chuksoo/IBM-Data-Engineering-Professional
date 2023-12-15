--- Create Table
DROP TABLE IF EXISTS bball_stats;
CREATE TABLE bball_stats(
						player_id		INT			NULL,
						player_name		VARCHAR(50)	NULL,
						player_num		INT			NULL,
						player_position	VARCHAR(50)	NULL,
						assist			INT			NULL,
						rebounds		INT			NULL,
						games_played	INT			NULL,
						points			INT			NULL,
						players_coach	VARCHAR(50)	NULL
						);

--- Run Script
INSERT INTO bball_stats(player_id, player_name,player_num,player_position,assist,rebounds,games_played,points,players_coach)
	select 1,'ali',20,'guard',125,80,10,60,'thompson' union
	select 2,'james',22,'forward',65,100,10,65,'garret' union
	SELECT 3,'ralph',24, 'center',30 ,120,9,70,'samson' union
	SELECT 4,'terry',30,'guard',145,90,9,75,'garret' union
	SELECT 5,'dirk',32,'forward',70,110,10,80,'thompson'union
	SELECT 6,'alex',34,'center',35 ,130,10,90,'garret' union
	SELECT 7,'nina',40,'guard',155 ,100,9,100 ,' samson'union
	SELECT 8,'krystal',42,'forward',75,100,9,95,'thompson' union
	SELECT 9,'bud',44, 'center',40,125,10,90,'thompson' union
	SELECT 10,'tiger',50, 'guard',160,90,10,85,'samson' union
	SELECT 11,'troy',52, 'forward',80,125,10,80,'samson' union
	SELECT 12,'anand',54, 'center',50,145,10,110,'samson' union
	SELECT 13,'kishan',60, 'guard',120,150,9,115,'samson' union
	SELECT 14,'spock',62, 'forward',85,105,8,120,'thompson' union
	SELECT 15,'cory',64, 'center',55,175,10,135,'samson';

--- Questions
/*
Find the Number of Players at each Position 
*/
SELECT		player_position, COUNT(player_name) AS number_players
FROM		bball_stats
GROUP BY	player_position;

/*
Find the Number of Players assigned to each Coach
*/
SELECT		players_coach, COUNT(player_name) AS number_players
FROM		bball_stats
GROUP BY	players_coach;

/*
Find the Most Points scored per game by Position
*/
SELECT		player_position, MAX(points / games_played) AS pointscored_per_game
FROM		bball_stats
GROUP BY	player_position;

/*
Find the Number of Rebounds per game by Coach
*/
SELECT		players_coach, SUM(rebounds / games_played) AS rebounds_per_games
FROM		bball_stats
GROUP BY	players_coach;

/*
Find the Average number of Assist by Coach
*/
SELECT		players_coach, AVG(assist) AS avg_assist
FROM		bball_stats
GROUP BY	players_coach;

/*
Find the Average number of Assist per game by Position
*/
SELECT		player_position, AVG(assist / games_played) AS avg_assist_per_game
FROM		bball_stats
GROUP BY	player_position;

/*
Find the Total number of Points by each Player Position
*/
SELECT		player_position, SUM(points) AS total_points
FROM		bball_stats
GROUP BY	player_position;

