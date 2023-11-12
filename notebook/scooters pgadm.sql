SELECT *
FROM scooters
LIMIT 3000000;

SELECT *
FROM trips;

SELECT *
FROM trips inner join scooters using (sumdid)
LIMIT 100000;

SELECT max(latitude) as max_lat, min(latitude) as min_lat, 
       max(longitude) as max_long, min(longitude) as min_long
FROM scooters;


SELECT max(tripduration) as duration_max, min(tripduration) as duration_min, 
       max(tripdistance) as distance_max, min(tripdistance) as distance_min
FROM trips;


SELECT avg(tripduration) as avg_duration, sumdgroup,(SELECT extract(month from pubtimestamp) as month)
FROM trips inner join scooters using (sumdid)
WHERE scooters.companyname = 'Lime'
   AND trips.companyname = 'Lime'
GROUP BY sumdgroup,month
LIMIT 500;

SELECT SUM(tripdistance)  AS total_trip_distance, companyname
FROM trips 
GROUP BY companyname
ORDER BY total_trip_distance DESC;

SELECT COUNT(DISTINCT sumdid)AS total_scooters, companyname
FROM trips
GROUP BY companyname
ORDER BY total_scooters DESC;

SELECT avg(chargelevel) as average_charge, companyname
FROM scooters
GROUP BY companyname
ORDER BY average_charge;


