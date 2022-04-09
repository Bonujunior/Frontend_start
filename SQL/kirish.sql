--  Yaratish
CREATE TABLE student2(
  student_id serial,
  student_name varchar(30) not null,
  student_password varchar(20) not null
);
-- qo'shish va qo'shgan ma'lumotni ko'rish
INSERT INTO student2(student_name,student_password) VALUES('Bonu','bonu123') RETURNING *;
-- qo'shish
INSERT INTO student2(student_name,student_password) VALUES('Asal','0123');
INSERT INTO student2(student_name,student_password) VALUES('Guli','0123');
INSERT INTO student2(student_name,student_password) VALUES('Vali','0123');
INSERT INTO student2(student_name,student_password) VALUES('Ali','0123');
--  0 va 1 chiqishi kk


-- select so'rov yuborib ma'lumot olish
SELECT column_name from table_name;
agar * bolsa hamma qatorlar select qilinadi
SELECT * from student2;

-- where va delete
-- id si 1 ga teng bo'lgan qatorni hamma ustunlarini chiqarish
SELECT * from student2 where student_id=1;
-- name si 'Bonu' ga teng bo'lgan qatorni hamma ustunlarini chiqarish
SELECT * from student2 where student_name='Bonu';
-- o'chirish
DELETE from student2 where student_name='Bonu';
-- kirish=# DELETE from student2 where student_name='Bonu';
-- DELETE 5  5 ta qator o'chganligi haqida mana shunday xabar chiqishi kk
 DELETE * from student2;
--  hamma qatorlar o'chadi
--
--
-- UPDATE
UPDATE student2 set student_name='Robiya' where student_id=10;


--
--
--
-- BETWEEN
CREATE TABLE product(
  product_id serial,
  product_name varchar(50) not null,
  product_price Int
);
insert into product (product_name,product_price) values('olma',2000);
insert into product (product_name,product_price) values('nok',3000);
insert into product (product_name,product_price) values('anor',6000);
insert into product (product_name,product_price) values('gilos',8000);
insert into product (product_name,product_price) values('olcha',3000);
insert into product (product_name,product_price) values('tarvuz',18000);
insert into product (product_name,product_price) values('pomidor',20000);
insert into product (product_name,product_price) values('piyoz',3000);
insert into product (product_name,product_price) values('karam',4000);
insert into product (product_name,product_price) values('qovun',15000);

insert into product (product_name,product_price) values('olma1',2000);
insert into product (product_name,product_price) values('nok2',3000);
insert into product (product_name,product_price) values('anor3',6000);
insert into product (product_name,product_price) values('gilos1',8000);
insert into product (product_name,product_price) values('olcha3',3000);
insert into product (product_name,product_price) values('tarvuz1',18000);
insert into product (product_name,product_price) values('_pomidor',20000);
insert into product (product_name,product_price) values('piyoz',3000);
insert into product (product_name,product_price) values('1_karam',4000);
insert into product (product_name,product_price) values('2_qovun',15000);

select product_name,product_price from product where product_price  BETWEEN 1000 and 10000;

select product_name,product_price from product where product_price  BETWEEN 10000 and 20000;====
===select product_name,product_price from product where product_price not BETWEEN 1000 and 10000;
-- Yuqoridagi 2 qator natijasi birxil bo'ladi

-- LIKE -o'xshashlarini select qilib chiqarib beradi
select * from product where product_name like 'olcha';
-- natija
         5 | olcha        |          3000
select * from product where product_name like 'ol%';
-- natija
          1 | olma         |          2000
          5 | olcha        |          3000
         14 | olcha3       |          3000
select * from product where product_name like '%or%';
-- natija
          3 | anor         |          6000
          7 | pomidor      |         20000
         12 | anor3        |          6000
         16 | _pomidor     |         20000
select * from product where product_name like '_o%';
-- natija
select * from product where product_name like '___o_';
--  ORDER BY , ASC,DESC
-- alefbo tartibida chiqarish
SELECT *from product order by product_name ASC;====
===SELECT *from product order by product_name;
SELECT *from product order by product_price;
SELECT *from product order by product_price DESC;
--  shakliy unsurlar aniqlanadi.Bunda,birinchi galda
-- PRIMARY KEY / FOREIGN KEY
CREATE TABLE users(
  user_id serial PRIMARY KEY,
  user_name varchar(100) not null

);
CREATE TABLE post(
  post_id serial PRIMARY KEY,
  post_title varchar(100) not null,
  post_author Int references users(user_id)
);
insert into users(user_name) values('Bonu');
insert into users(user_name) values('Asal');
insert into users(user_name) values('Guli');
insert into users(user_name) values('Ali');


insert into post(post_title,post_author) values('Today in...',3);