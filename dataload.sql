drop table if exists train;
create table train
(id char(50), click int, hour char(8), C1 char(4), banner_pos char(8), 
site_id char(8), site_domain char(8), site_category char(8),
app_id char(8), app_domain char(8), app_category char(8),
device_id char(8), device_ip char(8), device_model char(8), device_type char(8), device_conn_type char(8),
C14 char(8), C15 char(8), C16 char(8), C17 char(8), C18 char(8), C19 char(8), C20 char(8), C21 char(8));

copy train from '/home/tweetytrails/Kaggle/CTR/train_woheader.csv' delimiter ',' csv;


drop table if exists test;
create table test
(id char(50), hour char(8), C1 char(4), banner_pos char(8), 
site_id char(8), site_domain char(8), site_category char(8),
app_id char(8), app_domain char(8), app_category char(8),
device_id char(8), device_ip char(8), device_model char(8), device_type char(8), device_conn_type char(8),
C14 char(8), C15 char(8), C16 char(8), C17 char(8), C18 char(8), C19 char(8), C20 char(8), C21 char(8));

copy test from '/home/tweetytrails/Kaggle/CTR/test_woheader.csv' delimiter ',' csv;



