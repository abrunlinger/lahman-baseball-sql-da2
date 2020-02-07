/*
    QUESTION ::
        From 1970 – 2016, what is the largest number of wins for a team that did not win the 
		world series? What is the smallest number of wins for a team that did win the world 
		series? Doing this will probably result in an unusually small number of wins for a 
		world series champion – determine why this is the case. Then redo your query, excluding 
		the problem year. How often from 1970 – 2016 was it the case that a team with the most 
		wins also won the world series? What percentage of the time?

    SOURCES ::
        * teams

    DIMENSIONS ::
        * name

    FACTS ::
        * COUNT(WSwin), SUM(W)

    FILTERS ::
        * yearid BETWEEN(1970, 2016), GROUP BY name

    DESCRIPTION ::
        ...

    ANSWER ::
        ...

*/

/* SELECT name, yearid AS year, W AS wins, G AS games_played, WSwin AS world_series_win
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 AND WSwin LIKE 'Y'
ORDER BY wins */

WITH wsw AS		(SELECT name, yearid AS year, MAX(W) AS wins, G AS games_played, WSwin AS world_series_win
				FROM teams
				WHERE WSwin LIKE 'Y' AND yearid BETWEEN 1970 AND 1980 OR 
				WSwin LIKE 'Y' AND yearid BETWEEN 1982 AND 2016 
				GROUP BY name, year, games_played, world_series_win
				ORDER BY year),
/*
most_wins AS 	(SELECT name, yearid AS year, (W) AS wins, WSwin
				FROM teams
				WHERE yearid BETWEEN 1970 AND 1980 OR yearid BETWEEN 1982 AND 2016
				
				ORDER BY year, wins DESC) */
;