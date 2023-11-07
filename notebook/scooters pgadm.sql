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