/*
    QUESTION ::
        Find the name and height of the shortest player in the database. 
		How many games did he play in? What is the name of the team for which he played?

    SOURCES ::
        * people, appearances, teams

    DIMENSIONS ::
        * ...

    FACTS ::
        * ...

    FILTERS ::
        * ...

    DESCRIPTION ::
        ...

    ANSWER ::
        ...

*/
WITH minheight as (SELECT CONCAT(namefirst, ' ', namelast) as name, MIN(height) from people)

SELECT CONCAT(namefirst, ' ', namelast) as name, height
FROM people
GROUP BY name, height
ORDER BY height
LIMIT 1
--(SELECT MIN(height) from people)

SELECT *
FROM appearances;

SELECT p.namefirst as First, p.namelast as Last, p.height as Height, t.name as Team
FROM people as p
FULL JOIN appearances as a
ON p.playerid = a.playerid
FULL JOIN teams as t
ON a.teamid = t.teamid 
GROUP BY First, Last, Height
ORDER BY Height
;