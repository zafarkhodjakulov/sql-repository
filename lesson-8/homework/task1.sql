create table Groupings (
	ID int primary key identity,
	Status  varchar(10)
);
insert into Groupings
values  ('Passed'),
		('Passed'),
		('Passed'),
		('Passed'),
		('Failed'),
		('Failed'),
		('Failed'),
		('Failed'),
		('Failed'),
		('Passed'),
		('Passed'),
		('Passed');

select
    MIN(ID) as MinStepNumber,
    MAX(ID) as MaxStepNumber,
    Status,
    MAX(ID) - MIN(ID) + 1 as ConsecutiveCount
from
    (
        select
            *,
            ID - ROW_NUMBER() over(partition by Status order by ID) as GroupID
        from GROUPINGS
    )
    as t
group by Status, GroupID
order by MinStepNumber;