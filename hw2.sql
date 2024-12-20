-- 1. Найдите общую сумму, потраченную на полеты каждым пассажиром. Выведите имя и стоимость всех полетов.

SELECT 
name,
SUM(f.price)
FROM passengers p
INNER JOIN fly_mapping fm ON p.id = fm.passenger_id
INNER JOIN flying f ON fm.FLYING_ID = f.ID
GROUP BY p.name;


-- 2. Найдите среднее количество времени, потраченное в воздухе каждой возрастной группой. Выведите возрастную группу и кол-во времени в минутах (округленное до двух знаков после запятой.

SELECT 
AGE_GROUP,
SUM(FLIGHT_TIME) AS Sum_flight_time
FROM passengers p
INNER JOIN fly_mapping fm ON p.id = fm.passenger_id
INNER JOIN flying f ON fm.FLYING_ID = f.ID
GROUP BY p.AGE_GROUP;


-- 3. Определите пассажиров с максимальным количеством полетов. Выведите имя и количество полетов

SELECT
p.name,
COUNT(fm.passenger_id) AS Max_flights
FROM fly_mapping fm
INNER JOIN passengers p ON p.id = fm.passenger_id
GROUP BY p.name
HAVING COUNT(fm.passenger_id) = (
        SELECT MAX(flight_count)
        FROM (SELECT COUNT(*) AS flight_count
            FROM fly_mapping
            GROUP BY passenger_id));


-- 4. Определите пассажиров, у которых количество полетов больше среднего.

SELECT name
FROM passengers p
INNER JOIN fly_mapping fm ON p.id = fm.passenger_id
GROUP BY p.name
HAVING COUNT(fm.passenger_id) > (
    SELECT ROUND(AVG(flight_count), 0) as Averege_flight_count
    FROM (
        SELECT COUNT(*) AS flight_count
        FROM fly_mapping
        GROUP BY passenger_id));

 
-- 5. Определите самые популярные направления полетов. Направления с максимальным количеством прилетов.

SELECT point_to
FROM flying f
INNER JOIN fly_mapping fm ON f.id = fm.flying_id
GROUP BY point_to
HAVING COUNT(flying_id) = (
    SELECT MAX(Count_fly_to)
    FROM (SELECT COUNT(flying_id) as Count_fly_to
        FROM flying f
        INNER JOIN fly_mapping fm ON f.id = fm.flying_id
        GROUP BY point_to));

