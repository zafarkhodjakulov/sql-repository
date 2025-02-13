CREATE DATABASE Unversity;

USE Unversity;

CREATE TABLE Student
(
	id int,
	name varchar(50),
	age int
);

ALTER TABLE Student
ALTER COLUMN id int NOT NULL;