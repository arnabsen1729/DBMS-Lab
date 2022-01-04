drop table if exists cust_acct;
drop function if exists updateTable;

create table cust_acct(
    id numeric(10) primary key,
    balance numeric(6) default 0
);

insert into cust_acct values (10001, 300);
insert into cust_acct values (10002, 1100);
insert into cust_acct values (10003, 1200);
insert into cust_acct values (10004, 900);

select * from cust_acct;

create function updateTable() returns void as $$
begin
    update cust_acct
    set balance = balance - 1000
    where balance >= 1000;
end;
$$ language plpgsql;

select updateTable();
select * from cust_acct;
