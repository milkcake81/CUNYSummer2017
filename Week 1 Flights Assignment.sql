#1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
#Show the SQL query(s) that support your conclusion.

Select dest from flights order by distance DESC Limit 1;

#2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
#the most number of seats? Show the SQL statement(s) that support your result.
Select engines, max(seats) 
from planes
group by engines;

#3. Show the total number of flights
Select Count(*)
from flights;

#4. Show the total number of flights by airline (carrier)
Select carrier, Count(*)
from flights
group by carrier;

#5. Show all of the airlines, ordered by number of flights in descending order.
Select carrier, count(*)
from flights
group by carrier
order by count(*) DESC;

#6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.
Select carrier, count(*)
from flights
group by carrier
order by count(*) DESC
Limit 5;

#7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
#flights in descending order.
Select carrier, count(*)
from flights
where distance >= 1000
group by carrier
order by count(*) DESC
Limit 5;


#8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
#write down both the question, and the query that answers the question.

#Question: What is the average arrival delay by each carrier where flight distance is greater than 1000?

Select carrier, avg(arr_delay)
from flights
where distance >= 1000
group by carrier;