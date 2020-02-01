/*
    QUESTION ::
        What range of years does the provided database cover?

    SOURCES ::
        * batting, pitching, fielding

    DIMENSIONS ::
        * -

    FACTS ::
        * min year
		* max year

    FILTERS ::
        * only using 3 main tables from db

    DESCRIPTION ::
        Assumptions from README : 1871 through 2016
		
		Do a check from the 3 main tables as specified in the data dictionary::
			*batting, fielding, pitching

    ANSWER ::
        1871 through 2016

*/
SELECT min(min_year), max(max_year)
FROM (
	SELECT MIN(yearid) as min_year, MAX(yearid) as max_year
	FROM batting

	UNION ALL

	SELECT MIN(yearid), MAX(yearid)
	from pitching

	UNION ALL

	SELECT MIN(yearid), MAX(yearid)
	FROM fielding
	) as sub
;
