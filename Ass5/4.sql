drop table if exists item_mstr;
drop table if exists item_tr;
drop function if exists item_trans_fn;

create table item_tr(
    id numeric(10),
    qty numeric(5)
);

create table item_mstr(
    id numeric(10) primary key,
    qty numeric(5)
);

insert into item_tr values (101, 10);
insert into item_tr values (102, 20);
insert into item_tr values (103, 30);

insert into item_mstr values (101, 100);
insert into item_mstr values (102, 200);
insert into item_mstr values (103, 300);

select * from item_tr;
select * from item_mstr;

create or replace function item_trans_fn() returns trigger language plpgsql as $$
begin
    update item_mstr set qty = qty - new.qty where id = new.id;
    if not found then
        insert into item_mstr values(new.id, 500-new.qty);
    end if;

    return null;
end;
$$;

create trigger item_trans_trigger
after insert on item_tr
for each row
execute function item_trans_fn();

insert into item_tr values (103, 30);
insert into item_tr values (104, 30);

select * from item_tr order by id;
select * from item_mstr order by id;
