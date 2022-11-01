create database sales;
use sales;
create table SalesPeople (Snum varchar(30) Primary key,Sname varchar(50) , 
city varchar(10),Comm varchar(5),Unique(Sname ));
alter table SalesPeople modify Comm varchar(5);
insert into SalesPeople(snum, sname,city,comm) values(1001,'Peel','London',12);
insert into SalesPeople(snum, sname,city,comm) values(1002,'Serres','Sanjose',13);
insert into SalesPeople(snum, sname,city,comm) values(1004 ,'Motika',' London',11);
insert into SalesPeople(snum, sname,city,comm) values(1007,'Rifkin','Barcelona',15);
insert into SalesPeople(snum, sname,city,comm) values(1003,'Axelrod','Newyork',10);
select * from SalesPeople;

create table Customers (Cnum varchar(10) primary key,Cname varchar(30),
City varchar(10) Not Null,Snum varchar(30),foreign key(Snum)references SalesPeople(Snum));
insert into Customers(Cnum,Cname,City,Snum) values(2001,'Hoffman','London',1001);
insert into Customers(Cnum,Cname,City,Snum) values(2002,'Giovanni','Rome',1003);
insert into Customers(Cnum,Cname,City,Snum) values(2003,'Liu','Sanjose',1002);
insert into Customers(Cnum,Cname,City,Snum) values(2004,'Grass','Berlin',1002);
insert into Customers(Cnum,Cname,City,Snum) values(2006,'Clemens','London',1001);
insert into Customers(Cnum,Cname,City,Snum) values(2008,'Cisneros','Sanjose',1007);
insert into Customers(Cnum,Cname,City,Snum) values(2007,'Pereira','Rome',1004);
select * from Customers;
create table Orders(Onum varchar(20) primary key,Amt varchar(20),
Odate date,Cnum varchar(30),Snum varchar(20),foreign key(Cnum) references Customers(Cnum),
foreign key(Snum) references SalesPeople(Snum));
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3001,18.69,'1990-10-3',2008,1007);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3003,767.19,'1990-10-3',2001,1001);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3002,1900.10,'1990-10-3',2007,1004);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3005,5160.45,'1990-10-3',2003,1002);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3006,1098.16,'1990-10-3',2008,1007);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3009,1713.23,'1990-10-4',2002,1003);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3007,75.75,'1990-10-4',2004,1002);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3008,4273.00,'1990-10-5',2006,1001);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3010,1309.95,'1990-10-6',2004,1002);
insert into Orders(Onum,Amt,Odate,Cnum,Snum) values(3011,9891.88,'1990-10-6',2006,1001);
select * from Orders;
-- Q1  Count the number of Salesperson whose name begin with ‘a’/’A’.

select count(sname)from SalesPeople where Sname like'%a'or'%A';

-- Q2  Display all the Salesperson whose all orders worth is more than Rs. 2000.
select sname from SalesPeople Inner Join Orders on SalesPeople.snum=Orders.snum where Amt>2000;

-- Q3  Count the number of Salesperson belonging to Newyork. 
select count(sname) from SalesPeople where city='newyork' ;

-- Q4  Display the number of Salespeople belonging to London and belonging to Paris.
select count(sname) from SalesPeople where city='london' or city='Paris';

-- Q5 Display the number of orders taken by each Salesperson and their date of orders.
select Sname, count (odate) AS number_of_orders_taken, Odate from Orders 
RIGHT JOIN salespeople
ON orders.Snum = SalesPeople.Snum
group by Sname;