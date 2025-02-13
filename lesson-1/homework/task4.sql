create table category(
	category_id int,
	category_name varchar(50),
	constraint PK_category primary key (category_id),
);

create table item(
	item_id int,
	item_name varchar(50),
	category_id int,
	constraint PK_items primary key (item_id),
	constraint FK_items foreign key (category_id) references category(category_id),
);

Alter table item
drop constraint FK_items;

Alter table item
add constraint FK_item foreign key (category_id) references category(category_id);