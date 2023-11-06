SELECT *
FROM scooters
LIMIT 3000000;

SELECT *
FROM trips;

SELECT *
FROM scooters inner join trips using (sumdid)
LIMIT 100000;

SELECT max(tripdistance) as max_distance, sumdgroup,startdate,enddate
FROM scooters inner join trips using (sumdid)
WHERE scooters.companyname = 'Lime'
   AND trips.companyname = 'Lime'
GROUP BY sumdgroup,startdate,enddate
ORDER BY max_distance
LIMIT 500;

SELECT avg(tripduration) as avarage_trip_time, sumdgrup,startdate, enddate
FROM scooters inner join trips using (sumdid)
WHERE scooters.companyname = 'Lime'
   AND trips.companyname= 'Lime'
GROUP BY sumdgroup,startdate,enddate
ORDER BY average_trip_time
LIMIT 500;