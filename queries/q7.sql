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
        On selecting the full range of world series winners, 1981 was an outlier that had far less
		games played that year. The Los Angeles Dodgers had the least number of wins as a WS (world
		series) winner. The Arizona Diamondbacks had the most wins in 2001 but did not win the WS.
		27 percent of world series winners in the year range also possessed the most wins.

*/

/* SELECT name, yearid AS year, W AS wins, G AS games_played, WSwin AS world_series_win
FROM teams
WHERE yearid BETWEEN 1970 AND 2016 AND WSwin LIKE 'Y'
ORDER BY wins */

WITH wsw AS		(SELECT name, yearid AS year, W AS wins, WSwin AS world_series_win
				FROM teams
				WHERE WSwin LIKE 'Y' AND yearid BETWEEN 1970 AND 1980 OR 
				WSwin LIKE 'Y' AND yearid BETWEEN 1982 AND 2016 
				ORDER BY year),
				
maxw AS			(SELECT yearid AS year, MAX(W) AS max_wins
				FROM teams
				WHERE yearid BETWEEN 1970 AND 1980 OR 
				yearid BETWEEN 1982 AND 2016 
				GROUP BY year
				ORDER BY year),
				
 wwhmw AS 		(SELECT wsw.name, maxw.year, 
				CASE WHEN wins = max_wins THEN '1'::numeric
				ELSE '0'::numeric
				END AS ws_winner_had_most_wins,
				wins,
				max_wins 
				FROM wsw
				JOIN maxw
				ON wsw.year = maxw.year)		

SELECT SUM(ws_winner_had_most_wins) AS years_wsw_had_most, COUNT(year) AS total_years,
ROUND(SUM(ws_winner_had_most_wins)/COUNT(year)*100) AS percent_ws_most_wins
FROM wwhmw
;

