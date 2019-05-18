create database W2;

use HW2;

create table item
(
	state char(2),
	city varchar(25),
	street varchar(25),
	name varchar(25),
	itemname varchar(25),
	itemid varchar(25),
	profit varchar(25),
	zipcode varchar(10),
	cost varchar(10),
	retail_price varchar(10),
	notes varchar(255),
	description varchar(255),
	returnable char(1),
	perishable char(1),
	shelf_qty int(50000),
	color1 varchar(25),
	color2 varchar(25),
	color3 varchar(25),
	color4 varchar(25),
	color5 varchar(25),
	CONSTRAINT book_pk primary key(itemid)
);