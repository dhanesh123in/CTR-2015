alter table train add column day char(6);
alter table test add column day char(6);

update train
set day=substring(hour from 1 for 6);

update test
set day=substring(hour from 1 for 6);

create table train_p as
select *, 
count(*) over w1 as numv1, count(*) over w2 as numv2, count(*) over w3 as numv3,
count(*) over w4 as numv4, count(*) over w5 as numv5, count(*) over w6 as numv6,
count(*) over w7 as numv7, count(*) over w8 as numv8, count(*) over w9 as numv9,
count(*) over w10 as numv10, count(*) over w11 as numv11, count(*) over w12 as numv12
from train
window w1 as (partition by device_id, site_id, day order by id),
w2 as (partition by device_id, site_domain, day order by id),
w3 as (partition by device_id, site_category, day order by id),
w4 as (partition by device_id, app_id, day order by id),
w5 as (partition by device_id, app_domain, day order by id),
w6 as (partition by device_id, app_category, day order by id),
w7 as (partition by device_ip, site_id, day order by id),
w8 as (partition by device_ip, site_domain, day order by id),
w9 as (partition by device_ip, site_category, day order by id),
w10 as (partition by device_ip, app_id, day order by id),
w11 as (partition by device_ip, app_domain, day order by id),
w12 as (partition by device_ip, app_category, day order by id);

create table test_p as
select *, 
count(*) over w1 as numv1, count(*) over w2 as numv2, count(*) over w3 as numv3,
count(*) over w4 as numv4, count(*) over w5 as numv5, count(*) over w6 as numv6,
count(*) over w7 as numv7, count(*) over w8 as numv8, count(*) over w9 as numv9,
count(*) over w10 as numv10, count(*) over w11 as numv11, count(*) over w12 as numv12
from test
window w1 as (partition by device_id, site_id, day order by id),
w2 as (partition by device_id, site_domain, day order by id),
w3 as (partition by device_id, site_category, day order by id),
w4 as (partition by device_id, app_id, day order by id),
w5 as (partition by device_id, app_domain, day order by id),
w6 as (partition by device_id, app_category, day order by id),
w7 as (partition by device_ip, site_id, day order by id),
w8 as (partition by device_ip, site_domain, day order by id),
w9 as (partition by device_ip, site_category, day order by id),
w10 as (partition by device_ip, app_id, day order by id),
w11 as (partition by device_ip, app_domain, day order by id),
w12 as (partition by device_ip, app_category, day order by id);


