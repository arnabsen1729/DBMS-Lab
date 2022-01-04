drop table if exists emp;
drop function if exists raiseWage;

create table emp(
    emp_id numeric(10) primary key,
    salary numeric(10, 2)
);

insert into emp values (10001, 300);
insert into emp values (10002, 1100);
insert into emp values (10003, 1200);
insert into emp values (10004, 900);

select * from emp order by emp;

create function raiseWage() returns void as $$
    declare
        emp_rec record;
        emp_cursor cursor for select * from emp;
    begin
        open emp_cursor;

        loop
            fetch emp_cursor into emp_rec;
            exit when not found;

            update emp
            set salary = salary + salary * 15 /100
            where emp_id = emp_rec.emp_id;
        end loop;

        close emp_cursor;
    end;
-- $$ language plpgsql;

select raiseWage();

select * from emp order by emp;
