-- 1. Count how many parts in NYC have more than 70 parts on hand
select Count(part_nyc.part_number)
from part_nyc
where part_nyc.on_hand>70;

-- 2. Count how many total parts on hand, in both NYC and SFO, are Red

Select t1.count
FROM (select count(*)
      from part_sfo,color
      where part_sfo.color=color.color_id and color.color_name='Red'
      UNION
      select count(*)
      from part_nyc,color
      where part_nyc.color=color.color_id and color.color_name='Red'
      )
      AS t1

-- 3. List all the suppliers that have more total
-- on hand parts in NYC than they do in SFO.
-- Select S.supplier_name,S.supplier_id
-- for every supplier
select S.supplier_name, S.supplier_id
from supplier S
where(
       (Select sum(on_hand)
        from part_sfo sfo
        where S.supplier_id = sfo.supplier
        )
        <
        (Select sum(on_hand)
        from part_nyc nyc
        where S.supplier_id = nyc.supplier
        )
     );
-- 4. List all suppliers that supply
-- parts in NYC that aren’t supplied by anyone in SFO.
-- select distinct S.supplier_name,S.supplier_id
-- from supplier S, part_nyc nyc
-- where s.supplier_id = nyc.supplier
-- and not exists(select part_number from part_sfo sfo
--                 where sfo.part_number=nyc.part_number);
-- -- -- 5. Update all of the NYC on hand values to on hand - 10.
-- Update part_nyc
-- set on_hand =  on_hand - 10;
--
-- -- -- 6. Delete all parts from NYC which have less than 30 parts on hand.
-- Delete  from part_nyc
-- where on_hand < 30;
