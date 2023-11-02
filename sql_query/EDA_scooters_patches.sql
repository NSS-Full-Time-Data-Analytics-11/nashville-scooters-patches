--EDA
--First half of may
SELECT *
FROM scooters
WHERE pubdatetime BETWEEN '2019-05-01%' AND '2019-05-15%'
--second half of may
SELECT *
FROM scooters
WHERE pubdatetime BETWEEN '2019-05-16%' AND '2019-05-31%'
--First half of June
SELECT *
FROM scooters
WHERE pubdatetime BETWEEN '2019-06-1%' AND '2019-06-15%'
--Second half of June
SELECT *
FROM scooters
WHERE pubdatetime BETWEEN '2019-06-16%' AND '2019-06-31%'
--First half of July data
SELECT *
FROM scooters
WHERE pubdatetime BETWEEN '2019-07-01%' AND '2019-07-15%'
--Second half of July
SELECT *
FROM scooters
WHERE pubdatetime BETWEEN '2019-07-16%' AND '2019-07-31%'

--What are the minimum and maximum values for all the latitude and longitude columns? Do these ranges make sense, or is there anything surprising?
SELECT MAX(latitude)
FROM scooters
SELECT MIN(latitude)
FROM scooters
--investigate max latitude number seems way to large
--NOTE: lat 36.16, long 86.7 coordinates for nashville tn
SELECT MAX(longitude)
FROM scooters
SELECT MIN(longitude)
FROM scooters
--What is the range of values for trip duration and trip distance? Do these values make sense? Explore values that might seem questionable.

SELECT *
FROM scooters
WHERE chargelevel IS NULL
--Sus latitude 
SELECT *
FROM scooters
WHERE latitude = (SELECT MAX(latitude)
				 FROM scooters)
--Only problem area is above section in latitude (could be misread by a sensor)	 
SELECT latitude
FROM scooters
ORDER BY latitude DESC
LIMIT 15;
