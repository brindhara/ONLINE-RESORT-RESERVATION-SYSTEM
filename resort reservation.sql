use logicfirst;
DROP TABLE ROOM;
create table Room(
Room_no int, 
Rate int,
Type varchar(30)
);
insert into Room values(101,5000,'single');
insert into Room values(102,4000,'double');
 insert into Room values(201,5100,'large');
 insert into Room values(202,4000,'single');
 SELECT * FROM room;
 Alter table room modify rate int not null; 
desc room;
Select Distinct Type From Room;

Select room_no from room where type like 's%'; 
Select room_no from room where type like '%e'; 
Select room_no from room where type like 'd%e'; 
select room_no,rate ,min(rate) from room group by room_no,rate order by rate;
select room_no,rate ,max(rate) from room group by room_no,rate order by rate; 



 DROP TABLE RESORT;
CREATE TABLE Resort (
    Name VARCHAR(50),
    Resort_Id VARCHAR(30),
    Address VARCHAR(50),
    Room_no INT
);

INSERT INTO Resort VALUES ('VGP Golden Beach Resort', 'VGP1001', 'Injambakkam Chennai Tamil Nadu', 101);
INSERT INTO Resort VALUES ('Green Cocount Resort', 'GCR2201', 'Mahabalipuram Muttukadu Chennai Tamil Nadu', 102);
INSERT INTO Resort VALUES ('VGP Golden Beach Resort1', 'VGP1001', 'Injambakkam Chennai Tamil Nadu2', 101);
INSERT INTO Resort VALUES ('Green Cocount Resort1', 'GCR2101', 'Mahabalipuram Muttukadu Chennai Tamil Nadu2', 102);
SELECT * FROM Resort;
ALTER TABLE Resort ADD UNIQUE (Name) ;
DESC Resort;
SHOW INDEX FROM Resort;
ALTER TABLE Resort ADD CONSTRAINT Resort_uni UNIQUE (Name,Address);
Desc Resort;
select * from resort where  resort_id='vGP1001'; 
Select r.resort_id,r.name,r.address,ro.room_no,ro.type,ro.rate from resort r  join room ro on r.room_no= ro.room_no;
select name from resort 
union 
select name from workers order by name; 




DROP TABLE WORKERS;
create table Workers(
 Name varchar(50),
Workers_Id varchar(30) ,
 Address varchar(50),
Resort_Id varchar(20)
);
insert into Workers values('Karthi',01,'vallarstreet vellore','VGP1001',23); 
insert into Workers values('kala',02,'Madamstreet vellore','VGP1001',34); 
insert into Workers values('Ramesh',03,'kannanstreet chennai','GCR2201',78); 
insert into Workers values('Ranjini',04,'kamalastreet chennai','GCR2201',88);
select*from workers;
ALTER TABLE Workers ADD age VARCHAR(3); 
select * from Workers;

ALTER TABLE Workers DROP COLUMN age; 
select * from Workers;
INSERT INTO Workers (Name, Workers_Id, Address, Resort_ID, Age) VALUES ('Kathir', 5, 'vallar vellore', 'VGP1001', 34);
DELETE FROM Workers WHERE Age = 34 LIMIT 2;
select * from workers; 




CREATE TABLE Bills (
    Bill_No VARCHAR(10), 
    Amount INT, 
    Paying_Method VARCHAR(30),
    Guest_Id INT
);
INSERT INTO Bills VALUES ('234', 6000, 'Credit Card', 1001);
INSERT INTO Bills VALUES ('254', 5500, 'Cash', 1002);
INSERT INTO Bills VALUES ('334', 4000, 'Debit Card', 1003);
INSERT INTO Bills VALUES ('253', 4700, 'Debit Card', 1004);
SELECT * FROM Bills;
ALTER TABLE Bills ADD COLUMN Bill_Date DATE;
SET SQL_SAFE_UPDATES = 0;
UPDATE Bills SET Bill_Date = '2014-07-05';
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM Bills;
drop table bills;
Select Avg(Amount) From Bills;



create table Food(
 Food_Id varchar(30),
 Type varchar(30),
Rate int
);
insert into Food values('V1','VEG',200);
insert into Food values('NV1','NON VEG',300); 
insert into Food values('V2','VEG',250);
insert into Food values('NV2','NON VEG',200);
select * from food;
select type,count(type) from food group by type;
 
create table Facilities(
Facility_Id varchar(30) ,
Type varchar(30),
Rate int
);
insert into Facilities values('F100','Swimming Pool',400); 
insert into Facilities values('F110','outdoor restaurant',500); 
insert into Facilities values('F200','outdoor restaurant',520);
 insert into Facilities values('F210','Swimming Pool',600);
 select * from Facilities;
 select type,count(type) from Facilities group by type;


create table Orders(  
Time Timestamp(0), 
Quantity varchar(30),
Guest_Id int,

Rate int
);
DROP TABLE  Orders;
CREATE TABLE Orders (
    Time TIMESTAMP(0), 
    Quantity VARCHAR(30),
    Guest_Id INT,
    Food_Id VARCHAR(10),
    Rate int
);
INSERT INTO Orders (Time, Quantity, Guest_Id, Food_Id ,Rate) VALUES ('2024-06-01 08:00:00', '1', 1001, 'V1' ,200);
INSERT INTO Orders (Time, Quantity, Guest_Id, Food_Id,Rate) VALUES ('2024-06-01 09:00:00', '1', 1002, 'NV1',300);
SELECT * FROM Orders;
SELECT Orders.Time, Orders.Quantity, Orders.Guest_Id, Orders.Food_Id, Orders.Rate, Food.Type FROM Orders INNER JOIN Food ON Orders.Food_Id = Food.Food_Id;
Select Sum(Quantity) From Orders; 



    



	





DROP TABLE Guest;
CREATE TABLE Guest (
    Guest_Name Varchar(30),
    Guest_Id Varchar(10), 
    Address Varchar(50), 
    Check_In_Date DATE, 
    Check_Out_Date DATE,
    Room_no INT
);
INSERT INTO Guest VALUES ('Ezhilarasi', '1001', 'annastreet chennai', '2021-04-10', '2021-04-20', 202);
INSERT INTO Guest VALUES ( ' Brindha','1002', 'Nadustreet chennai', '2020-06-10', '2020-06-20', 201);
INSERT INTO Guest VALUES ('Saranya', '1003', 'Savadistreet chennai', '2020-07-10', '2020-07-20', 202);
INSERT INTO Guest VALUES ('Punitha', '1004', 'Mariyammanstreet vellore', '2020-10-10', '2020-10-20', 101);
SELECT * FROM Guest;
Alter table Guest modify Guest_Name varchar(30) not null; 
select * from Guest; 
USE your_database_name;
SELECT * FROM Guest WHERE Check_In_Date='2020-10-10';


SELECT guest_id, guest_name 
FROM guest 
WHERE guest_id IN ( SELECT guest_id FROM orders JOIN food ON orders.food_id = food.food_id WHERE type = 'VEG');
select orders.guest_id,orders.quantity ,food.food_id 
from orders 
left join food on orders.food_id=food.food_id order by food.food_id; 
SELECT Orders.Guest_Id,Orders.Quantity ,Food.Food_Id
FROM Orders
RIGHT JOIN Food ON Orders.Food_Id=Food.Food_Id ORDER BY Food.Food_Id;




SET SQL_SAFE_UPDATES = 0;
UPDATE guest
SET guest_name = 'ezhilarasi k',
    address = 'annastreet chennai23'
WHERE guest_id = 1001;
SET SQL_SAFE_UPDATES = 1;
SELECT * FROM guest WHERE guest_id = 1001;
select * from guest;
ALTER TABLE Guest ADD G_name VARCHAR(30); 
select * from Guest;



drop table guest_phone_no;
create table Guest_Phone_No( 
Phone_no varchar(15),
Guest_Id int
);
insert into Guest_Phone_No values('2345678192','1001'); 
insert into Guest_Phone_No values('7745878192','1002');
 insert into Guest_Phone_No values('3342678192','1003'); 
 insert into Guest_Phone_No values('9048678195','1004');
select *from guest_phone_no;




drop table resort_phone_no;
create table Resort_Phone_No( 
Phone_no varchar(15),
Resort_Id varchar(10)
);
insert into Resort_Phone_No values('2178234677','VGP1001'); 
insert into Resort_Phone_No values('9758364679','VGP1001'); 
insert into Resort_Phone_No values('4178534672','GCR2201'); 
insert into Resort_Phone_No values('9078634672','GCR2201');
select *from resort_phone_no;
ALTER TABLE Resort MODIFY name VARCHAR(50) NOT NULL;





create table Workers_Phone_No( 
Phone_no varchar(10),
Workers_Id int
);
insert into Workers_Phone_No values('2170934677',01); 
insert into Workers_Phone_No values('9753964679',02); 
insert into Workers_Phone_No values('4176934672',03); 
insert into Workers_Phone_No values('9048734672',04);
select *from workers_phone_no;

Alter table workers_phone_no add primary key(phone_no); 
desc workers_phone_no; 

SHOW TABLES LIKE 'Uses';

DROP TABLE  Uses;

CREATE TABLE Uses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    facility_id INT
);

DESC Uses;
ALTER TABLE Uses 
ADD CONSTRAINT uses_gid_fk FOREIGN KEY (guest_id) REFERENCES guest(guest_id);

ALTER TABLE Uses 
ADD CONSTRAINT uses_fid_fk FOREIGN KEY (facility_id) REFERENCES facilities(facility_id);
DESC Uses;



