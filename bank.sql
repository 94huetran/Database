-- we don't know how to generate schema bank (class Schema) :(
create table customers
(
	customer_number int not null
		primary key,
	full_name varchar(255) charset utf8 not null,
	address varchar(255) charset utf8 not null,
	email varchar(100) not null,
	phone varchar(11) not null
)
;

create table Account
(
	account_number int not null
		primary key,
	account_type varchar(100) not null,
	date_create date not null,
	balance double not null,
	customer_number int not null,
	constraint Account_customers_customer_number_fk
		foreign key (customer_number) references customers (customer_number)
)
;

create table transactions
(
	tran_number int not null
		primary key,
	date date not null,
	amounts double not null,
	descriptions varchar(255) not null,
	account_number int null,
	constraint transactions_amounts_uindex
		unique (amounts),
	constraint transactions_Account_account_number_fk
		foreign key (account_number) references Account (account_number)
)
;

