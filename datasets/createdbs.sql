--------------------------------------------------------------------------------------------
---------------------------------------IMPORTING DATA---------------------------------------
--------------------------------------------------------------------------------------------

BEGIN;

CREATE TABLE calls (
	id CHAR(50),
	customer_name CHAR (50),
	sentiment CHAR (20),
	csat_score INT,
	call_timestamp DATE DEFAULT CURRENT_DATE,
	reason CHAR (20),
	city CHAR (50),
	state CHAR (20),
	channel CHAR (20),
	response_time CHAR (20),
	call_duration_minutes INT,
	call_center CHAR (20)
);

SELECT * FROM calls


COPY calls (id, customer_name, sentiment, csat_score,
call_timestamp, reason, city, state, channel, 
response_time, call_duration_minutes, call_center
)
FROM 'E:\Data Analyst\Projects\Call_Center.csv'
DELIMITER ';'
CSV HEADER;
