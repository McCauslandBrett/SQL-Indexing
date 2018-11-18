-- 1. Count how many parts in NYC have more than 70 parts on hand
select Count(part_nyc.part_number)
from part_nyc
where part_nyc.on_hand>70;

-- 2. Count how many total parts on hand, in both NYC and SFO, are Red

-- Select t1.count
-- FROM (select count(*)
--       from part_sfo,color
--       where part_sfo.color=color.color_id and color.color_name='Red'
--       UNION
--       select count(*)
--       from part_nyc,color
--       where part_nyc.color=color.color_id and color.color_name='Red'
--       )
--       AS t1

-- 3. List all the suppliers that have more total
-- on hand parts in NYC than they do in SFO.
-- Select S.supplier_name,S.supplier_id
-- FROM supplier as S,
--    (Select S.supplier_name,S.supplier_id
--      from (
--            Select sfoWITHsum.supplier,sfoWITHsum.partsum
--            FROM (
--                   select part_sfo.supplier,SUM(part_sfo.on_hand) as partsum
--                   from part_sfo
--                   group by supplier
--                 ) as sfoWITHsum
--          )as resultsfo,
--          (
--           Select sfoWITHsum.supplier,sfoWITHsum.partsum
--           FROM (
--                 select part_sfo.supplier,SUM(part_sfo.on_hand) as partsum
--                 from part_sfo
--                 group by supplier
--                ) as sfoWITHsum
--           )as resultnyc
--       where resultsfo.partsum < resultnyc.partsum
--       )as result
-- where S.supplier_id=result.supplier;

Select sfo_sumIDname.supplier_name,sfo_sumIDname.supplier_id
FROM
   (
    select part_sfo.supplier,SUM(part_sfo.on_hand) as partsum
    from part_sfo
    group by part_sfo.supplier
    -- where S.supplier_id=part_sfo.supplier
    ) as sfo_sumIDname
--     (
--      select part_nyc.supplier,SUM(part_nyc.on_hand) as partsum
--      from part_nyc,supplier S
--      group by part_nyc.supplier
--      where S.supplier_id=part_nyc.supplier
--      ) as nyc_sumIDname
-- where sfo_sumIDname.partsum < nyc_sumIDname.partsum;
;
--       ,
--
--       Select nycWITHsum.supplier,nycWITHsum.partsum
--       FROM (select part_nyc.supplier,SUM(part_nyc.on_hand) as partsum
--             from part_nyc
--              group by supplier
--             ) as nycWITHsum
--
--
-- where sfoWITHsum.supplier = nycWITHsum.supplier
-- And sfoWITHsum.partsum < nycWITHsum.partsum;
      -- UNION
      -- select count(*)
      -- from part_nyc,color
      -- where part_nyc.color=color.color_id and color.color_name='Red'
      -- )
      -- AS t1
-- -- 4. List all suppliers that supply
-- -- parts in NYC that aren’t supplied by anyone in SFO.
-- select
-- from
-- where
-- -- 5. Update all of the NYC on hand values to on hand - 10.
-- select
-- from
-- where
-- -- 6. Delete all parts from NYC which have less than 30 parts on hand.
-- select
-- from
-- where
