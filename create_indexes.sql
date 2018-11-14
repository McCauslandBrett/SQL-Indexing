create index idx_part_number
on part_nyc
using BTREE
(part_number);

create index idx_supplier_id
on supplier
using BTREE
(supplier_name);

create index idx_color_id
on color
using BTREE
(color_id);
