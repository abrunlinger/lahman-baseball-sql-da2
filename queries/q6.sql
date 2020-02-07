/*
    QUESTION ::
        Find the player who had the most success stealing bases in 2016, where success is measured 
		as the percentage of stolen base attempts which are successful. (A stolen base attempt 
		results either in a stolen base or being caught stealing.) Consider only players who 
		attempted at least 20 stolen bases.

    SOURCES ::
        * batting

    DIMENSIONS ::
        * playerid, sb, cs

    FACTS ::
        * steal_attempts, success_rate

    FILTERS ::
        * Where SB +CS is greater than 20

    DESCRIPTION ::
        Select the stolen bases along with caught stealing, then sum them together. Divide stolen
		bases by the sum to calculate the success percentage. Cast the percentage and round. 

    ANSWER ::
        owingch01 has the greatest success stealing at a 91% rate

*/

SELECT playerid, sb AS stolen_bases, cs AS caught_stealing, (sb+cs) AS steal_attempts, 
ROUND((sb/(sb+cs)::numeric)*100) AS success_rate
FROM batting
WHERE yearid = '2016' AND (sb+cs) >= 20
ORDER BY success_rate DESC
;
