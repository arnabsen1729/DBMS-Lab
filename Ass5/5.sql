drop table if exists emp;
drop procedure if exists raiseWage(id numeric(10), amount numeric(10));

create table emp(
    emp_id numeric(10) primary key,
    salary numeric(10)
);

insert into emp values (1007, 100000);
insert into emp values (1008, 110000);
insert into emp values (1009, 120000);
insert into emp values (1010, 900000);

select * from emp order by emp_id;

create procedure raiseWage(id numeric(10), amount numeric(10))
    language plpgsql as $$
        begin
            if(id not in (select E.emp_id from emp E)) then
                raise exception 'nonexistent ID --> %', emp_id
                    using hint= 'Please check your emp_id';
            elsif (amount is null) then
              raise exception 'amount can''t be null'
                    using hint= 'Please check your amount';
            end if;

            update emp
               set salary=salary + amount
             where emp_id = id;
        end;
    $$;

call raiseWage(1010,NULL);

select * from emp order by emp_id;
