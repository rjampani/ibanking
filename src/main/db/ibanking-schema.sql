create database ibanking;

create user 'ibanking'@'%' identified by 'ibanking';

grant all privileges on ibanking.* to 'ibanking'@'%';

flush privileges;

use ibanking;

create table account(account_no int not null, account_holder_nm varchar(30) not null, account_type varchar(20) not null, balance double(10, 2) not null);


