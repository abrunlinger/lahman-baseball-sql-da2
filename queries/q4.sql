/*
    QUESTION ::
        Using the fielding table, group players into three groups based on their position: 
		label players with position OF as "Outfield", those with position "SS", "1B", "2B", 
		and "3B" as "Infield", and those with position "P" or "C" as "Battery". Determine 
		the number of putouts made by each of these three groups in 2016.

    SOURCES ::
        * fielding, positions_cte, groupings_cte

    DIMENSIONS ::
        * playerid, po

    FACTS ::
        * SUM(pos) 

    FILTERS ::
        * year = 2016, position

    DESCRIPTION ::
        Create a CTE that provides an alias for each pos, and include the year filtering. Create 
		a second CTE that groups the aliased pos from the first, and provides a SUM(po). Then query
		pulls information from the first CTE and joins the second CTE to the first to provide a 
		list of total putouts by position next to each player.

    ANSWER ::
        See output.

*/

WITH positions_cte AS	
(SELECT playerid, yearid, po,
	CASE WHEN pos LIKE 'OF' THEN 'Outfield'
	WHEN pos LIKE 'SS' THEN 'Infield'
	WHEN pos LIKE '1B' THEN 'Infield'
	WHEN pos LIKE '2B' THEN 'Infield'
	WHEN pos LIKE '3B' THEN 'Infield'
	WHEN pos LIKE 'P' THEN 'Battery'
	WHEN pos LIKE 'C' THEN 'Battery'
	END AS position
FROM fielding
WHERE yearid = 2016),

groupings_cte AS
(SELECT position, SUM(po) AS putouts
FROM positions_cte
GROUP BY position)

SELECT playerid, putouts, positions_cte.position
FROM positions_cte
JOIN groupings_cte
ON positions_cte.position = groupings_cte.position
;