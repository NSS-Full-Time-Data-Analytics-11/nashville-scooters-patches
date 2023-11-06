SELECT *
FROM scooters
LIMIT 3000000;

SELECT *
FROM trips;

SELECT *
FROM scooters inner join trips using (sumdid)
LIMIT 100000;

SELECT tripdistance, max(tripdistance) as max_distance, sumdgroup, count(sumdgroup) as number_sumdgroup
FROM scooters inner join trips using (sumdid)
WHERE scooters.companyname = 'Lime'
   AND trips.companyname = 'Lime'
GROUP BY tripdistance, sumdgroup
LIMIT 100000;