-- ERROR LOG TABLE Creation

create table error_log_table(
                             Log_id number,
                             Name varchar2(100),
                             Description varchar2(2000),
                             Callstack varchar2(4000),
                             ErrorStack varchar2(4000),
                             Errorbacktrace varchar2(4000),
                             Created_by varchar2(30),
                             Created_at timestamp default current_timestamp);
                             
select * from error_log_table;