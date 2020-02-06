/*
    QUESTION ::
        Find the average number of strikeouts per game by decade since 1920. Round the numbers 
		you report to 2 decimal places. Do the same for home runs per game. Do you see any trends?

    SOURCES ::
        * batting

    DIMENSIONS ::
        * corr(so, hr), year as decade

    FACTS ::
        * AVG(so), AVG(hr), corr(hr,so),  

    FILTERS ::
        * Group by year

    DESCRIPTION ::
        Select the year and then truncate to create decade, which is grouped by. Then calculate
		averages for hr and so, and establish the correlation between homeruns and strikeouts. 
		Strikeouts per homerun also calculated for comparison, but output is ordered by correlation.

    ANSWER ::
        The rate of strikeouts per homerun increased over the years after leveling off in turbulent
		early years. As (likely) player skill increased, when players did hit the ball they would
		often hit a home run. Otherwise, the pitcher would strike them out. 

*/

SELECT trunc(yearid, -1) AS decade, 
ROUND(AVG(hr), 2) AS avg_homerun, 
ROUND(AVG(so), 2) AS avg_strikeout, 
corr(hr,so) AS correlation, 
AVG(so)/AVG(hr) AS strikeout_per_homerun
FROM batting
GROUP BY decade
ORDER BY correlation
;
