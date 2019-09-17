env = LOAD 'wthr.txt' USING PigStorage(' ') AS (year:int,temp:int,city:chararray);
recs = FOREACH env GENERATE temp,city;
groups = GROUP recs BY city;
maxtemp = FOREACH groups GENERATE MAX(recs.temp) as temp, group as city;
DUMP maxtemp;
