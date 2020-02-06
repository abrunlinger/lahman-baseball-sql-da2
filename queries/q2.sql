/*
    QUESTION ::
        Find the name and height of the shortest player in the database. 
		How many games did he play in? What is the name of the team for which he played?

    SOURCES ::
        * people, appearances, teams

    DIMENSIONS ::
        * namefirst, namelast, height, g_all, teams.name

    FACTS ::
        * Player 

    FILTERS ::
        * ...

    DESCRIPTION ::
        I concatonated the first and last name listings for the players table and then pulled
		the name along with height from that table. I then joined the appearances table and 
		the teams table so I could also select g_all as games_played and teams.name as team. 

    ANSWER ::
        Eddie Gaedel has a height of 43 units, and has played 1 game with the St. Louis Browns.

*/


SELECT CONCAT(namefirst, ' ', namelast) as player, height, g_all AS games_played, teams.name AS team
FROM people
JOIN appearances
ON people.playerid = appearances.playerid
JOIN teams
ON appearances.teamid = teams.teamid
GROUP BY player, height, games_played, team
ORDER BY height
LIMIT 1

;