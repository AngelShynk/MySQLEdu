use practice;

create table animals
(
id int primary key,
animal varchar(15)
);

insert into animals values
(1, 'cat'),
(2, 'dog'),
(3, 'hamster');

create table animal_food
(
id int primary key,
food varchar(14),
animal_id int,
foreign key(animal_id) references animals(id)
);

insert into animal_food(id, food, animal_id) values
(1, 'milk', 1),
(2, 'meat', 2),
(3, 'corn',3)
;


-- INNER JOIN

select a.animal, af.food
from animals as a
join animal_food as af
on a.id = af.animal_id;


insert into animals values
(4, 'monkey');

select a.animal, af.food
from animals as a
join animal_food as af
on a.id = af.animal_id;

-- LEFT JOIN
select a.animal, af.food
from animals as a
left join animal_food as af
on a.id = af.animal_id;

-- RIGHT JOIN 
select a.animal, af.food
from animals as a
right join animal_food as af
on a.id = af.animal_id;


-- CROSS JOIN
select a.animal, af.food
from animals as a
cross join animal_food as af;


select a.animal, af.food
from animals as a, animal_food as af;


