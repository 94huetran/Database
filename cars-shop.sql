-- we don't know how to generate schema cars_shop (class Schema) :(
create table office
(
	office_id int not null
		primary key,
	office_address varchar(255) charset utf8 not null,
	office_phone varchar(11) not null,
	office_country varchar(20) charset utf8 not null,
	office_city varchar(20) charset utf8 not null,
	postalCode int not null
)
;

create table employees
(
	employee_id int not null
		primary key,
	employees_name varchar(255) charset utf8 not null,
	employee_email varchar(30) not null,
	employee_jobTitle varchar(255) not null,
	reportTo int not null,
	office_id int not null,
	constraint employees_employees_employee_id_fk
		foreign key (reportTo) references employees (employee_id),
	constraint employees_office_office_id_fk
		foreign key (office_id) references office (office_id)
)
;

create table customer
(
	customer_id int auto_increment
		primary key,
	customer_name varchar(255) charset utf8 not null,
	customer_phone varchar(11) not null,
	customer_address varchar(255) charset utf8 not null,
	salesRepEmployee_id int not null,
	customer_city varchar(20) not null,
	customer_postalcode int not null,
	customer_creditLimit double null,
	constraint customer_employees_employee_id_fk
		foreign key (salesRepEmployee_id) references employees (employee_id)
)
;

create table orders
(
	order_id int auto_increment
		primary key,
	order_date date not null,
	order_delivery_date date not null,
	actual_delivery_date date not null,
	order_amount int not null,
	order_total_price double not null,
	customer_id int not null,
	constraint orders_customer_customer_id_fk
		foreign key (customer_id) references customer (customer_id)
)
;

create table payment
(
	payment_id int not null
		primary key,
	payment_date date not null,
	payment_money double not null,
	customer_id int not null,
	constraint payment_customer_customer_id_fk
		foreign key (customer_id) references customer (customer_id)
)
;

create table productLine
(
	productLine_id int not null
		primary key,
	`describe` varchar(255) charset utf8 not null,
	product_img binary(1) null
)
;

create table products
(
	product_id int auto_increment
		primary key,
	product_name varchar(255) charset utf8 not null,
	product_vendor varchar(255) not null,
	product_amount int not null,
	product_buy_price double not null,
	product_MSRP double not null,
	productLine_id int not null,
	product_scales varchar(10) not null,
	product_quanlity_stock int not null,
	constraint products_productLine_productLine_id_fk
		foreign key (productLine_id) references productLine (productLine_id)
)
;

create table product_order_detail
(
	product_id int not null,
	order_id int not null,
	primary key (product_id, order_id),
	constraint product_order_detail_orders_order_id_fk
		foreign key (order_id) references orders (order_id),
	constraint product_order_detail_products_product_id_fk
		foreign key (product_id) references products (product_id)
)
;

