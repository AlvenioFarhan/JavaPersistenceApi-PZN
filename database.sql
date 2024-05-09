create database java_persistence_api_pzn;

use java_persistence_api_pzn;

create table customers(
id varchar(255) not null primary key,
name varchar(100) not null
) engine InnoDB;

select * from customers;

alter table customers 
add column primary_email varchar(150);

create table categories(
id int not null auto_increment primary key,
name varchar(100) not null,
description varchar(500)
) engine InnoDB;

select * from categories ;

alter table customers 
add column age tinyint;

alter table customers 
add column married boolean;

select * from customers ;

alter table customers 
add column type varchar(50);

alter table categories 
add column created_at timestamp;

alter table categories 
drop column created_at;

alter table categories 
add column updated_at timestamp;

alter table categories 
drop column updated_at;

select * from categories ;

create table images(
id int not null auto_increment primary key,
name varchar(100) not null,
description text,
image blob
)engine InnoDB;

select * from images;

create table members(
id int not null auto_increment primary key,
email varchar(150) not null,
title varchar(100),
first_name varchar(100) not null,
middle_name varchar(100),
last_name varchar(100)
)engine InnoDB;

select * from members ;

create table departments(
company_id varchar(100) not null,
department_id varchar(100) not null,
name varchar(150) not null,
primary key(company_id, department_id)
)engine InnoDB;

select * from departments ;

create table hobbies(
id int not null auto_increment primary key,
member_id int not null,
name varchar(150) not null,
foreign key  fk_members_hobbies (member_id)
references members (id) 
)engine InnoDB;

select * from hobbies ;

create table skills(
id int not null auto_increment primary key,
member_id int not null,
name varchar(100) not null,
value int not null,
foreign key fk_members_skills (member_id) references members(id),
constraint skill_unique unique (member_id,name)
)engine InnoDB;

select * from skills;

select * from members m where id =1;

create table credentials(
id varchar(100) not null primary key,
email varchar(150) not null,
password varchar(150) not null
)engine InnoDB;

select * from credentials ;

create table users(
id varchar(100) not null primary key,
email varchar(150) not null
)engine InnoDB;

select * from users;

create table wallet(
id int not null auto_increment primary key,
user_id varchar(100) not null,
balance bigint not null,
foreign key fk_users_wallet (user_id) references users(id)
)engine InnoDB;

select * from wallet ;

create table brands(
id varchar(100) not null primary key,
name varchar(100) not null,
description varchar(500)
)engine InnoDB;

select * from brands ;

create table products (
id varchar(100) not null primary key,
brand_id varchar(100) not null,
name varchar(100) not null,
price bigint not null,
description varchar(500),
foreign key fk_brands_products (brand_id) references brands(id)
)engine InnoDB;

select * from products ;

create table users_like_products(
user_id varchar(100) not null,
product_id varchar(100) not null,
foreign key fk_users_to_users_like_products (user_id) references users(id),
foreign key fk_products_to_users_like_products (product_id) references products(id),
primary key (user_id,product_id)
)engine InnoDB;

select * from users_like_products ;

create table employees(
id varchar(100) not null primary key,
type varchar(50) not null,
name varchar(100) not null,
total_manager int,
total_employee int
)engine InnoDB;

select * from employees ;

create table payts(
id varchar(100) not null primary key,
amount bigint not null
)engine InnoDB;

select * from payments;

create table payments_gopay(
id varchar(100) not null primary key,
gopay_id varchar(100) not null,
foreign key fk_payments_gopay (id) references payments(id)
)engine InnoDB;

select * from payments_gopay ;

create table payments_credit_card(
id varchar(100) not null primary key,
masked_card varchar(100) not null,
bank varchar(100) not null,
foreign key fk_payments_credit_card (id) references payments(id)
)engine InnoDB;

select * from payments_credit_card ;

create table transactions(
id varchar(100) not null primary key,
balance bigint not null,
created_at timestamp not null
)engine InnoDB;

select * from transactions ;

create table transactions_credit(
id varchar(100) not null primary key,
balance bigint not null,
created_at timestamp not null,
credit_amount bigint not null
)engine InnoDB;

select * from transactions_credit ;

create table transactions_debit(
id varchar(100) not null primary key,
balance bigint not null,
created_at timestamp not null,
debit_amount bigint not null
)engine InnoDB;

select * from transactions_debit ; 

alter table brands 
add column created_at timestamp;

alter table brands 
add column updated_at timestamp;

select * from brands b ;

alter table brands 
add column version bigint;

select * from brands b ;

create database java_persistence_api_test;

use java_persistence_api_test;