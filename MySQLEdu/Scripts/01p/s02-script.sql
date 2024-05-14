/* Code for 01p/s02-scripts*/
/*Primary Key, Foreign Key */


/* 
 * 
Example 1:
on delete cascade
on update cascade
 * 
 * */


/***** 1. Parent Table *****/
use practice;

create table member(
id varchar(3) primary key,
name varchar(5)
);

/***** 2. Child Table *****/
create table car(
id varchar(3),
carNum varchar(4),
foreign key(id) references member(id)
on delete cascade
on update cascade
);



insert into member values
('AAA', 'Nina'),
('BBB', 'Tom'),
('CCC','Amy');


insert into car values
('AAA', '1234'),
('AAA', '4567'),
('BBB', '7777'),
('CCC','0000');

select * from car;
select * from member;

/*Returns error FK constraint*/
insert into car values
('DDD', 'hhhh');

/*Updating parent table*/
update member set id='DDD' where id='AAA';

select * from car;

/* FK error*/
#1
drop table member;
#2
drop table car;
#3
drop table member;

/* Example 2*/

create table member(
id varchar(3) primary key,
name varchar(5)
);
create table car(
id varchar(3),
carNum varchar(4),
foreign key(id) references member(id)
on delete set null
);

insert into member values
('AAA', 'Nina'),
('BBB', 'Tom'),
('CCC','Amy');


insert into car values
('AAA', '1234'),
('AAA', '4567'),
('BBB', '7777'),
('CCC','0000');

select * from car;
select * from member;

delete from member where id='AAA';

# Example from https://medium.com/buzz-code/mysql-on-update-cascade-delete-cascade-set-null-cd78d382f44f 
