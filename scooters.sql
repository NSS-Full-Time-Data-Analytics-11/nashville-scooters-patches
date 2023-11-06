SELECT COUNT(companyname), companyname
FROM scooters
GROUP BY companyname
ORDER BY COUNT DESC;

SELECT sumdid, ROUND(SUM(tripdistance)* 0.0001894, 2)AS total_miles, ROUND(SUM(tripduration)/60, 2)AS total_hours
FROM trips
WHERE companyname = 'Lime'
GROUP BY sumdid
ORDER BY total_miles DESC;

WITH top_hours AS(SELECT EXTRACT(HOUr from pubtimestamp)AS hour, COUNT(sumdid)AS num_of_scooters
		FROM trips
		WHERE companyname = 'Lime'
		GROUP BY EXTRACT(HOUR from pubtimestamp)
		ORDER BY num_of_scooters DESC
		LIMIT 10)
SELECT  num_of_scooters,
	CASE WHEN hour >12 THEN hour-12 
	 	WHEN hour = 0 THEN hour + 12
		WHEN hour < 12 THEN hour + 0 END AS hour
FROM top_hours;

WITH trips_per_scooter AS(SELECT sumdid, COUNT(sumdid)AS trips
		FROM trips
		WHERE companyname = 'Lime'
		GROUP BY sumdid
		ORDER BY trips DESC)
SELECT ROUND(AVG(trips), 0)AS avg_trips, sumdid
FROM trips_per_scooter
GROUP BY sumdid
ORDER BY avg_trips DESC;




