create table account(
  id serial primary key,
  name varchar(255),
  credit real,
  currency varchar(10),
  bank_name varchar(50)
);


insert into account(Name, Credit, Currency, BankName) values
	('Account 1', 1000, 'RUB', 'SberBank'),
	('Account 2', 1000, 'RUB', 'Tinkoff'),
	('Account 3', 1000, 'RUB', 'SberBank'),
	('Account 4', 0, 'RUB', '');

create table ledger(
  id serial primary key,
  from_id int references account (id),
  to_id int references account(id),
  fee real,
  amount real,
  transaction_date_time timestamp
);


begin transaction;
  SAVEPOINT sp1;
  update account set credit = credit - 500 where name = 'Account 1';
  update account set credit = credit + 500 where name = 'Account 3';
  insert into ledger(from_id, to_id, fee, amount, transaction_date_time) values 
  (1, 3, 0, 500, DATE_TRUNC('second', CURRENT_TIMESTAMP::timestamp));
commit;

begin transaction;
  SAVEPOINT sp2;
  update account set credit = credit - 700 where name = 'Account 2';
  update account set credit = credit + 700 where name = 'Account 1';
  update account set credit = credit + 30 where name = 'Account 4';
  insert into ledger(from_id, to_id, fee, amount, transaction_date_time) values
  (2, 1, 30, 700, DATE_TRUNC('second', CURRENT_TIMESTAMP::timestamp));
commit;

begin transaction;
  SAVEPOINT sp3;
  update account set credit = credit - 100 where name = 'Account 2';
  update account set credit = credit + 100 where name = 'Account 3';
  update account set credit = credit + 30 where name = 'Account 4';
  insert into ledger(from_id, to_id, fee, amount, transaction_date_time) values
  (2, 3, 30, 500, DATE_TRUNC('second', CURRENT_TIMESTAMP::timestamp));
commit;
