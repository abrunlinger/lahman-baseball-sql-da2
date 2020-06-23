/*
    QUESTION ::
        Using the attendance figures from the homegames table, find the teams and parks which 
		had the top 5 average attendance per game in 2016 (where average attendance is defined 
		as total attendance divided by number of games). 
		Only consider parks where there were at least 10 games played. 
		Report the park name, team name, and average attendance. Repeat for the lowest 5 average 
		attendance.

    SOURCES ::
        * homegames

    DIMENSIONS ::
        * team, park

    FACTS ::
        * avg attendance per game

    FILTERS ::
        * 2016, at least 10 games played, Limit top 5 and bottom 5

    DESCRIPTION ::
        ...

    ANSWER ::
        ...

*/

SELECT *
FROM
		--top 5 query
		((SELECT DISTINCT team, park, year,
		attendance / games as avg_attendance_per_game, 'top 5' as category
		FROM homegames
		WHERE year = 2016
		  AND games >= 10
		ORDER BY avg_attendance_per_game DESC
		LIMIT 5)
		UNION
		--bottom 5 query 
		(SELECT DISTINCT team, park, year,
		attendance / games as avg_attendance_per_game, 'bottom 5' as category
		FROM homegames
		WHERE year = 2016
		   AND games >= 10
		ORDER BY avg_attendance_per_game
		LIMIT 5))
		AS top_bottom_5
	INNER JOIN teams t ON top_bottom_5.team = t.teamid AND top_bottom_5.year = t.yearid
ORDER BY avg_attendance_per_game		
;
