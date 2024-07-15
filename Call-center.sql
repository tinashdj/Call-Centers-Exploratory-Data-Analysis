------------------------------------------------------------------------------------------
--------------------------------------EXPLORING DATA--------------------------------------
------------------------------------------------------------------------------------------


----1. How many call centers?----
SELECT DISTINCT call_center FROM calls;

----2. What is the most reason of the calls?----
SELECT reason, COUNT(*),
ROUND(COUNT(*) * 100.0/ (SELECT COUNT(*) FROM calls) ,2) AS percentage
FROM calls GROUP BY reason ORDER BY reason ASC;

----3. Where is the city has the most calls and what is the reason?----
SELECT city, reason, COUNT(*) as total_calls
FROM calls 
GROUP BY city,reason ORDER BY total_calls DESC
LIMIT 10;

----4. Which day has the most calls?----
SELECT To_Char(call_timestamp, 'Day') as Day_of_call, COUNT(*) AS count_of_calls 
FROM calls GROUP BY Day_of_call ORDER BY count_of_calls DESC;

----5. Maximal, Minimal and the Average of the calls duration----
SELECT MAX (call_duration_minutes) AS max_call_duration_, 
MIN (call_duration_minutes) AS min_call_duration_,
ROUND (AVG(call_duration_minutes),2) AS avg_call_duration_
FROM calls;

----6. Response time by call centers----
SELECT call_center, response_time, COUNT(*) AS count
FROM calls GROUP BY call_center, response_time 
ORDER BY call_center, count DESC;

----7. How many channels?----
SELECT DISTINCT channel
FROM calls;

----8. What is the most used channel by state?----
SELECT state, channel, COUNT(*) AS count
FROM calls
GROUP BY state, channel ORDER BY count DESC
LIMIT 10;

----9. What is the most sentiment?----
SELECT sentiment, COUNT(*),
ROUND(COUNT(*) * 100.0/ (SELECT COUNT(*) FROM calls) ,2) AS percentage
FROM calls GROUP BY sentiment ORDER BY sentiment ASC;

----10. Who has given the 'Very Positive' sentiment?----
SELECT customer_name, sentiment
FROM calls
WHERE sentiment = 'Very Positive'
GROUP BY sentiment, customer_name
LIMIT 10;


$$ LANGUAGE plpgsql;
