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


SELECT create_dt, starttime, sumdid
FROM trips
LIMIT 10;

WITH hours AS(SELECT EXTRACT(HOUR from starttime)AS hour, sumdid
		FROM trips
		WHERE companyname = 'Lime'
		ORDER BY hour DESC)
SELECT hour, COUNT(hour)AS num_of_start_times
FROM hours
GROUP BY hour
ORDER BY num_of_start_times DESC;

SELECT sumdid, ROUND(MAX(tripdistance)* 0.0001894, 2)AS max_distance_miles, startlatitude, startlongitude
	FROM trips
	WHERE companyname = 'Lime'
	GROUP BY sumdid, startlatitude, startlongitude
	ORDER BY max_distance_miles DESC
	LIMIT 50;




SELECT starttime, endtime, create_dt, sumdid, pubtimestamp
FROM trips
LIMIT 2000;

SELECT COUNT(sumdid)AS num_scooters, startdate
FROM trips
WHERE companyname = 'Lime'
GROUP BY startdate
ORDER BY num_scooters DESC;

SELECT DISTINCT(sumdgroup), sumdid
FROM scooters
LIMIT 20;



WITH top_scooters AS(SELECT sumdid, ROUND(MAX(tripdistance)* 0.0001894, 2)AS max_distance_miles, startlatitude, startlongitude
	FROM trips
	WHERE companyname = 'Lime'
	GROUP BY sumdid, startlatitude, startlongitude
	ORDER BY max_distance_miles DESC
	LIMIT 50);
	
SELECT sumdid, triproute
FROM trips INNER JOIN top_scooters USING (sumdid)
WHERE sumdid IN(top_scooters);

(SELECT sumdid
FROM scooters)
EXCEPT
(SELECT sumdid
FROM trips);

SELECT COUNT(DISTINCT sumdid)
FROM scooters;

SELECT COUNT(DISTINCT sumdid)
FROM scooters
WHERE companyname = 'Lime';

SELECT COUNT(DISTINCT sumdid)
FROM trips;

SELECT ROUND(SUM(tripdistance)* 0.0001894 ,2) AS total_miles_lime, companyname
FROM trips 
WHERE companyname = 'Lime' OR companyname = 'SPIN' OR companyname = 'Bird'
GROUP BY companyname;

SELECT ROUND(SUM(tripdistance)* 0.0001894 ,2) AS total_miles, companyname
FROM trips 
GROUP BY companyname
ORDER BY total_miles DESC;

SELECT DISTINCT(companyname), ROUND(AVG(costpermin), 2)
FROM scooters
WHERE costpermin > 0.0
GROUP BY companyname;

SELECT COUNT(DISTINCT sumdid)AS total_scooters, companyname
FROM trips
GROUP BY companyname
ORDER BY total_scooters DESC;




