-- 1. Count how many parts in NYC have more than 70 parts on hand
select Count(part_nyc.part_number)
from part_nyc
where part_nyc.on_hand>70;

-- 2. Count how many total parts on hand, in both NYC and SFO, are Red
select Count(*)
from part_sfo , color
where (part_sfo.color=color.color_id and color.color_name='Red')
or (part_nyc.color=color.color_id and color.color_name='Red')
group by color_name

-- 3. List all the suppliers that have more total
-- on hand parts in NYC than they do in SFO.
select
from
where
-- 4. List all suppliers that supply
-- parts in NYC that aren’t supplied by anyone in SFO.
select
from
where
-- 5. Update all of the NYC on hand values to on hand - 10.
select
from
where
-- 6. Delete all parts from NYC which have less than 30 parts on hand.
select
from
where
