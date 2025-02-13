create table account(
	account_id int primary key,
	balance decimal,
	account_type varchar(10),
	constraint check_age check(balance>=0),
	constraint check_type check(account_type = 'Saving' AND account_type = 'Checking')
);

Alter table account
drop constraint check_age;

Alter table account
drop constraint check_type;

Alter table account
add constraint check_type check(balance>=0 AND account_type = 'Saving' AND account_type = 'Checking')