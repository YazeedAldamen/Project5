--create table Users(
--id int identity(1,1) Primary Key,
--firstName varchar(50),
--lastName varchar(50),
--email varchar(100),
--password varchar(100),
--phoneNumber int,
--);

select * from Users;

--insert into Users values ('Haitham','Hazaimeh','haitham@gmail.com','9',0778095538);

--create table Category(
--category_id int primary key identity(1,1),
--category_name varchar(50),
--category_img varchar(255),
--category_desc varchar(255),
--category_logo varchar(255),
--);

select * from Category;


--create table Product(
--product_id int primary key identity(1,1),
--product_name varchar(50),
--product_description varchar(255),
--product_img1 varchar(255),
--product_img2 varchar(255),
--product_img3 varchar(255),
--price decimal,
--category_id int foreign key references Category(category_id),
--);

select * from Product;


--create table Orders (
--order_id int primary key identity,
--user_id int foreign key references users(id),
--order_date date ,
--total_price decimal(6,2),
--);

select * from Orders;



--create table Order_Details (
--order_datails_id int primary key identity(1,1),
--order_id int foreign key references orders(order_id),
--product_id int foreign key references  product(product_id),
--product_quantity int ,
--total_price decimal 
--);

select * from Order_Details;


create table Cart(
user_id int foreign key references Users(id),
product_id int foreign key references Product(product_id),
quntity int,
price decimal(18,0),
total_price decimal(18,0),
product_name varchar(255),
product_image varchar(255),
cart_id int primary key identity
);

insert into Product(product_name, product_description, product_img1,product_img2,product_img3,price,category_id) values('Galaxy S20','Samsung Galaxy S20, the smallest of the S20 family, comes with a 6.2-inch display.','\images\s201.png','\images\s202.png','\images\s203.png','500','1');

insert into Category(category_name , category_img, category_desc , category_logo  ) values('samsung' , 'images\Samsung_Logo.svg.png' , '
Samsung Galaxy  is a series of computing and mobile computing devices that are designed, manufactured and 
marketed by Samsung Electronics.' , 'images\Samsung_Logo.svg.png'); 

insert into Category(category_name , category_img, category_desc , category_logo  ) values('Apple' , 'images\Samsung_Logo.svg.png' , '
Apple is considered one of the best manufacturers of smart phones. The phones manufactured by Apple, for example, the "iPhone", are characterized by 
strength and smoothness' , 'images\Samsung_Logo.svg.png');

insert into Category(category_name , category_img, category_desc , category_logo  ) values('Xiaomi' , 'images\Samsung_Logo.svg.png' , '
Xiaomi is a privately owned company that designs, develops, and sells smartphones, an Android-based OS, and other consumer electronics. 
Xiaomi also makes fitness trackers,' , 'images\Samsung_Logo.svg.png');

insert into Category(category_name , category_img, category_desc , category_logo  ) values('Oppo' , 'images\Samsung_Logo.svg.png' , '
Oppo is one of the Chinese phone brands thats currently gaining popularity in the West, with its wide selection of smartphones hitting a broad ' 
, 'images\Samsung_Logo.svg.png');

insert into Category(category_name , category_img, category_desc , category_logo  ) values('Huawei' , 'images\Samsung_Logo.svg.png' , '
Huawei is the second-biggest smartphone maker in the world, after Samsung, as of the first quarter of 2019.' , 'images\Samsung_Logo.svg.png');

insert into Category(category_name , category_img, category_desc , category_logo  ) values('Oneplus' , 'images\Samsung_Logo.svg.png' , '
A China-based manufacturer of Android smartphones. Introduced in 2014, OnePlus models are unlocked Android smartphones with quad-core 
Snapdragon CPUs and up to 8GB RAM ' , 'images\Samsung_Logo.svg.png');

