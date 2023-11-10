SELECT *
FROM scooters
LIMIT 3000000;

SELECT *
FROM trips;

SELECT *
FROM scooters inner join trips using (sumdid)
LIMIT 100000;


SELECT max(tripdistance) as max_distance, sumdgroup,
                                                   (SELECT extract(day from pubtimestamp) as day)
FROM trips inner join scooters using (sumdid)
WHERE scooters.companyname = 'Lime'
   AND trips.companyname = 'Lime'
GROUP BY sumdgroup,day
LIMIT 500;

SELECT avg(tripduration) as avg_duration, sumdgroup,(SELECT extract(day from pubtimestamp) as day)
FROM trips inner join scooters using (sumdid)
WHERE scooters.companyname = 'Lime'
   AND trips.companyname = 'Lime'
GROUP BY sumdgroup,day
LIMIT 500;

SELECT SUM(tripdistance)* 0.0001894  AS total_miles, companyname
FROM trips 
GROUP BY companyname
ORDER BY total_miles DESC;

SELECT COUNT(DISTINCT sumdid)AS total_scooters, companyname
FROM trips
GROUP BY companyname
ORDER BY total_scooters DESC;

SELECT avg(chargelevel) as average_charge, companyname
FROM scooters
GROUP BY companyname
ORDER BY average_charge;


