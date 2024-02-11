drop table product;
drop table customer;
drop table transaction;
drop table address_full;

create table product (
	new_product_id varchar(100) primary key unique not null
	,product_id int4
	,brand text
	,product_line varchar(10)
	,product_class varchar(10)
	,product_size varchar(10)
);
	
create table address_full (
	address_id varchar(100) primary key unique not null
	,address text
	,postcode int4
	,state varchar(20)
	,country varchar(20)
);	
	
create table customer (
	customer_id int4 primary key unique not null
	,first_name text
	,last_name text
	,gender varchar(10)
	,DOB date
	,job_title text
	,job_industry_category varchar(30)
	,wealth_segment varchar(30)
	,deceased_indicator varchar(5)
	,owns_car varchar(5)
	,address_id varchar(100)
	,property_valuation int4
);

create table transaction (
	transaction_id int4 primary key unique not null
	,new_product_id varchar(100)
	,customer_id int4
	,transaction_date date
	,online_order varchar(10)
	,order_status varchar(10)
	,list_price float4
	,standard_cost float4
);

-- Добавление внешнb[ ключей в таблицы
ALTER TABLE customer
ADD FOREIGN KEY (address_id)
REFERENCES address_full(address_id);

ALTER TABLE transaction
ADD FOREIGN KEY (customer_id)
REFERENCES customer(customer_id);
ALTER TABLE transaction
ADD FOREIGN KEY (new_product_id)
REFERENCES product(new_product_id);
