#created database
create database ecommerce;

#created tables -1
create table ecommerce.supplier(
supp_id int primary key,
supp_name varchar(50) NOT NULL,
supp_city varchar(50) NOT NULL,
supp_phone varchar(50) NOT NULL
 );
 
 create table ecommerce.customer(
 cus_id int primary key,
 cus_name varchar(20) NOT NULL,
 cus_phone varchar(10) NOT NULL,
 cus_city  varchar(30) NOT NULL,
 cus_gender char 
 );
 
 create table ecommerce.category(
 cat_id int primary key,
 cat_name varchar(20) NOT NULL);
 
 create table ecommerce.product(
 pro_id int primary key,
 pro_name  varchar(20) NOT NULL default "Dummy",
 pro_desc varchar(60) ,
 cat_id int ,
 foreign key(cat_id) references ecommerce.category(cat_id));
 
 
 create table ecommerce.supplierPricing(
 pricing_id int primary key,
 pro_id int ,
 supp_id int,
 foreign key (pro_id) references ecommerce.product(pro_id),
 foreign key (supp_id) references ecommerce.supplier(supp_id),
 supp_price int default 0
 );
 
 create table ecommerce.order(
 ord_id int primary key,
 ord_amount int not null,
 ord_date date not null,
 cus_id int ,
 pricing_id int,
  foreign key (cus_id) references ecommerce.customer(cus_id),
 foreign key (pricing_id) references ecommerce.supplierPricing(pricing_id)
 );
 
 create table ecommerce.rating(
 rat_id int primary key,
 rat_ratstars int not null,
 ord_id int ,
 foreign key (ord_id) references ecommerce.order(ord_id));
 
 #inserted data into the  tables -2
 INSERT INTO `ecommerce`.`supplier`
(`supp_id`,
`supp_name`,
`supp_city`,
`supp_phone`)
VALUES
(1,'Rajesh Retails','Delhi',1234567890),(2,'Appario Ltd','Mumbai',2589631470),(3,'Knome products','Banglore',9785462315),(4,'Bansal Retails','Kochi','8975463285'),(5,'Mittal Ltd.','Lucknow',7898456532);

INSERT INTO `ecommerce`.`customer`
(`cus_id`,
`cus_name`,
`cus_phone`,
`cus_city`,
`cus_gender`)
VALUES
(1,'AAKASH',9999999999,'DELHI','M'),
(2,'AMAN',9785463215,'NOIDA','M'),
(3,'NEHA',9999999999,'MUMBAI','F'),
(4,'MEGHA',9994562399,'KOLKATA','F'),
(5,'PULKIT',7895999999,'LUCKNOW','M');

INSERT INTO `ecommerce`.`category`
(`cat_id`,
`cat_name`)
VALUES
(1,'BOOKS'),
(2,'GAMES'),
(3,'GROCERIES'),
(4,'ELECTRONICS'),
(5,'CLOTHES');
INSERT INTO `ecommerce`.`product`
(`pro_id`,
`pro_name`,
`pro_desc`,
`cat_id`)
VALUES
(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2),
(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5),
(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',3),
(4,'OATS','Highly Nutritious from Nestle ',4),
(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1),
(6,'MILK','1L Toned Milk',3),
(7,'Boat Earphones','1.5Meter long Dolby Atmos',4),
(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5),
(9,'Project IGI','compatible with windows 7 and above',2),
(10,'Hoodie','Black GUCCI for 13 yrs and above ',5),
(11,'Rich Dad Poor Dad','By Robert Kiyosaki',1),
(12,'Train Your Brain','By Shireen Stephen',1)
;




 INSERT INTO `ecommerce`.`supplierpricing`
(`pricing_id`,
`pro_id`,
`supp_id`,
`supp_price`)
VALUES (1,1,2,1500),
(2,3,5,30000),
(3,5,1,3000),
(4,2,3,2500),
(5,4,1,1000);


INSERT INTO `ecommerce`.`supplierpricing`
(`pricing_id`,
`pro_id`,
`supp_id`,
`supp_price`)
VALUES (6,12,2,780),(7,12,4,789),(8,3,1,31000),(9,1,5,1450),(10,4,2,999),(11,7,3,549),(12,7,4,529),(13,6,2,105),(14,6,1,99),(15,2,5,2999),(16,5,2,2999);
INSERT INTO `ecommerce`.`order`
(`ord_id`,
`ord_amount`,
`ord_date`,
`cus_id`,
`pricing_id`)
VALUES
(101,1500,'2021-10-06',2,1),
(102,1000,'2021-10-12',3,5),
(103,30000,'2021-09-16',5,2),
(104,1500,'2021-10-05',1,1),
(105,3000,'2021-08-16',4,3),
(106,1450,'2021-08-18',1,9),
(107,789,'2021-09-01',3,7),
(108,780,'2021-09-07',5,6),
(109,3000,'2021-09-10',5,3),
(110,2500,'2021-09-10',2,4),
(111,1000,'2021-09-15',4,5),
(112,789,'2021-09-16',4,7),
(113,31000,'2021-09-16',1,8),
(114,1000,'2021-09-16',3,5),
(115,3000,'2021-09-16',5,3),
(116,99,'2021-09-17',2,14);


INSERT INTO `ecommerce`.`rating`
(`rat_id`,
`ord_id`,`rat_ratstars`)
VALUES
(1,101,4),
(2,102,3),
(3,103,1),
(4,104,2),
(5,105,4),
(6,106,3),
(7,107,4),
(8,108,4),
(9,109,3),
(10,110,5),
(11,111,3),
(12,112,4),
(13,113,2),
(14,114,1),
(15,115,1),
(16,116,0)
;

#3
select count(Gender) as "genderCount",Gender from (select (c.sumAmount) as "Total Amount",c.cus_gender as "Gender" from (SELECT sum(ord_amount) as "sumAmount",cust.cus_name,cust.cus_gender from ecommerce.customer cust
 left join ecommerce.order ord  on cust.cus_id = ord.cus_id group by cust.cus_name ,cust.cus_gender) as c  where c.sumAmount >= 3000) as d group by d.Gender;
 #4
SELECT ord.ord_id as "Order Id",ord_amount as "Order Amount",ord.ord_date as "Order Id",pro.pro_name as "Product Name" FROM ecommerce.order ord  inner join ecommerce.supplierpricing sup on sup.pricing_id = ord.pricing_id inner join ecommerce.product pro on pro.pro_id = sup.pro_id  where ord.cus_id =2 LIMIT 0, 1000;

 
#5
select a.productCount as "Product Count",a.supp_id as "Supplier Id ",a.supp_name as "Supplier Name" ,a.supp_city as "Supplier City",a.supp_phone as "Supplier Phone" from (select count(sup.pro_id) as 'productCount',supply.supp_id,supply.supp_name,supply.supp_city,supply.supp_phone  from ecommerce.supplierpricing sup  left join ecommerce.supplier supply on sup.supp_id = supply.supp_id  group by sup.supp_id  ) as a where a.productCount >1 ;

#6

 select cate.cat_id as "Category Id",cate.cat_name as "Category Name",pro.pro_name as "Product Name",min(sup.supp_price) as"Product Price" from ecommerce.product as pro inner join  ecommerce.category cate on cate.cat_id = pro.cat_id inner join ecommerce.supplierpricing sup  on sup.pro_id = pro.pro_id  group by pro.cat_id LIMIT 0, 1000;



#7
select pro.pro_id as "Product Id",pro.pro_name as "Product Name" from ecommerce.order as ord inner join ecommerce.supplierpricing sup on ord.pricing_id = sup.pricing_id inner join ecommerce.product pro on pro.pro_id = sup.pro_id where `ord_date` > '2021-10-05';

#8
select cus_name as "Customer Name" ,cus_gender as "Customer Gender" from ecommerce.customer where substr(cus_name,1,1) ='A' OR right(cus_name,1);
#9
create view ecommerce.ratings_view as (select b.supp_id as "Supplier Id",b.supp_name as "Supplier Name",rate.rat_ratstars as 'ratings',case when rate.rat_ratstars = 5 then 'Excellent Service' 
	when  rate.rat_ratstars >4   then 'Good Service'
    when  rate.rat_ratstars>2  then 'Average Service'
    else 'Poor Service'
    END AS Type_of_service from(select a.supp_id,a.supp_name,a.pricing_id,ord.ord_id  from (SELECT sup.supp_id,sup.supp_name,supply.pricing_id  FROM ecommerce.supplier sup left join ecommerce.supplierpricing  supply on sup.supp_id = supply.supp_id) as a   inner join ecommerce.order ord on ord.pricing_id = a.pricing_id) as b inner join ecommerce.rating  rate on b.ord_id = rate.ord_id );


DELIMITER //

CREATE PROCEDURE GetRatings( rating int)
BEGIN
	select * from  ecommerce.ratings_view as ratingsTable
    where ratingsTable.ratings = rating;
END //

DELIMITER ;

CALL GetRatings(3);




