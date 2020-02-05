/*
    QUESTION ::
        Find all players in the database who played at Vanderbilt University. Create a list 
		showing each player’s first and last names as well as the total salary they earned in 
		the major leagues. Sort this list in descending order by the total salary earned. 
		Which Vanderbilt player earned the most money in the majors?

    SOURCES ::
        * players, salaries, collegeplaying, schools

    DIMENSIONS ::
        * namefirst, namelast

    FACTS ::
        * SUM(salary)

    FILTERS ::
        * Where university is Vanderbilt, Grouped by playerid, ordered by SUM(salary) DESC

    DESCRIPTION ::
        Select the name fields from people and then join salaries and collegeplaying using the 
		playerid. Then join the schools table to collegeplaying using the schoolid. Select the 
		SUM(salary) and group by playerid, then order by descending value. 

    ANSWER ::
        David Price is the highest paid player from Vanderbilt University, with a total salary of
		$245,553,888.

*/

SELECT namefirst, namelast, SUM(salary) AS total_salary
FROM people
JOIN salaries
ON people.playerid = salaries.playerid
JOIN collegeplaying
ON people.playerid = collegeplaying.playerid
JOIN schools
ON collegeplaying.schoolid = schools.schoolid
GROUP BY people.playerid, namefirst, namelast, schoolname
HAVING schoolname LIKE 'Vanderbilt University'
ORDER BY total_salary DESC
;
