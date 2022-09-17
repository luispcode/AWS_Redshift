-- Verificar si las quieries necesitan optimización.

SELECT *
FROM stl_alert_event_log;

SELECT *
FROM stl_query
WHERE query = xxxxx;

--Visualizar costos asociados a queries con explain.

explain
SELECT eventid, eventname, event.venueid, venuename
FROM event, venue;

explain
SELECT eventid, eventname, event.venueid, venuename
FROM event, venue
WHERE event.venueid = venue.venueid;

SELECT *
FROM pg_table_def
WHERE tablename IN ('event', 'venue');

CREATE TABLE IF NOT EXISTS public.event_2
(
	eventid INTEGER NOT NULL  ENCODE az64
	,venueid SMALLINT NOT NULL  ENCODE az64 distkey sortkey
	,catid SMALLINT NOT NULL  ENCODE az64
	,dateid SMALLINT NOT NULL  ENCODE RAW
	,eventname VARCHAR(200)   ENCODE lzo
	,starttime TIMESTAMP WITHOUT TIME ZONE   ENCODE az64
);

INSERT INTO event_2 (SELECT * FROM event);

explain
SELECT eventid, eventname, event_2.venueid, venuename
FROM event_2, venue
WHERE event_2.venueid = venue.venueid;

analyze event_2;

explain
SELECT e.eventname, SUM(pricepaid)
FROM sales s
INNER JOIN event e ON s.eventid = e.eventid
GROUP BY e.eventname;

explain
SELECT SUM(pricepaid)
FROM sales s;

SELECT *
FROM pg_table_def
WHERE tablename IN ('event');

explain
SELECT *
FROM event;

explain
SELECT *
FROM event
ORDER BY eventid;

explain
SELECT *
FROM event
ORDER BY dateid;






