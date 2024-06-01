create database hoteldatabase;
use hoteldatabase;

/* Creating Tables */
create table if not exists customerdetails(cid int primary key,aadhar char(20), cname char(50), cage int, phone char(20), caddress char(100), finalprice float, checkin date,checkout date);
create table if not exists room(roomnum int primary key,roomtypeid int, size int);
create table if not exists roomtype(roomtypeid int primary key,bednum int, ac char(10), rate float, description char(200));
create table if not exists roomservice(orderid int primary key,itemid int, quantity int, rscid int);
create table if not exists items(itemid int primary key,itemname char(20), rate float);
create table if not exists bookingdetails(bid int primary key,cid int, checkin date, checkout date, finalprice float);
create table if not exists employees(empid int primary key, aadhar char(20), ename char(50), age int, gender char(10), roleid int, sal float);
create table if not exists roles(roleid int primary key, rolename char(50),sal float);

/* Inserting Example Values */
insert into customerdetails values(116,'8729328473','Darsh Pandya',22,'9876543210','682 Parker Street, Boston',1500,'2023-11-12','2023-11-13');
insert into roles values(11,'Manager',95000);
insert into employees values(31,'668574239817','Samuel Johnson',32,'Male',11,95000);
insert into items values(1,'Chocolate Ice Cream',150);
insert into roomtype values(1,2,'AC',2500,'Comfortable double room with AC, two single beds, a wardrobe and an outward facing window');
insert into roomtype values(2,2,'AC',3500,'Comfortable double room with AC, two single beds, a wardrobe and an pool facing window');
insert into roomtype values(3,2,'AC',4500,'Comfortable double room with AC, two single beds, a wardrobe and an valley facing window');
insert into roomtype values(4,2,'AC',5500,'Deluxe double room with AC, two single beds, a wardrobe and an pool facing window');
insert into roomtype values(5,2,'AC',6500,'Deluxe double room with AC, two single beds, a wardrobe and an valley facing window');
insert into room values(188,1,268);
insert into room values(189,2,268);
insert into room values(190,3,268);
insert into room values(191,4,268);
insert into room values(192,5,268);
insert into roomservice values(1768,1,3,115);
insert into bookingdetails values(1327,115,'2022-11-12','2022-11-13',1950);

/* Adding Foreign Keys */
alter table room add foreign key(roomtypeid) references roomtype(roomtypeid) on update cascade on delete cascade;
alter table roomservice add foreign key(itemid) references items(itemid) on update cascade on delete cascade;
alter table bookingdetails add foreign key(cid) references customerdetails(cid) on update cascade on delete cascade;
alter table employees add foreign key(roleid) references roles(roleid) on update cascade on delete cascade;
alter table roomservice add foreign key(rscid) references customerdetails(cid);