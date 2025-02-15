/* Exceptions in PLSQL

3 steps -> 1. Identifing errors  - Errors in code
           2. Trapping errors    - using when clause
           3. Handle errors      - statements
           
3 TYPES of Exceptions 
                     1. Pre defined Exceptions      -> Errors raised implicitly by the ORACLE
                     2. Non pre defined exceptions  -> Errors raised by the User/Programmer
                     3. User defined exceptions     ->  */
                  
-------------------------------------------------------------------------------- 

-- 2. Non predefined exceptions

create table demo_items(item_id number primary key,
                        item_name varchar2(50));
                        
create table demo_sales(sales_id number,
                        customer_name varchar2(20),
                        item_id number, foreign key(item_id) references demo_items(item_id));
                        
insert into demo_items values (1,'toys'),
                              (2,'juice');
                              
insert into demo_sales values (100,'Priya',1),
                              (102,'Mani',2);   

declare
  e_child exception;
  PRAGMA exception_init(e_child,-02292);

begin
  delete from demo_items
  where item_id = 1;

exception
 when e_child then
 dbms_output.put_line('Child record found');
 dbms_output.put_line(SQLERRM || dbms_utility.format_error_backtrace);
end;
/
    
--------------------------------------------------------------------------------

-- Example 2

create table demo_test(demo_id number,
                       demo_name varchar2(20) not null);
                                             
declare
    e_null exception;
    PRAGMA exception_init(e_null, -01400);
begin
    insert into demo_test values (1,null);
exception 
    when e_null then 
    dbms_output.put_line('Null not allowed');
    dbms_output.put_line(SQLERRM || dbms_utility.format_error_backtrace);
end;
/
                              
                        

