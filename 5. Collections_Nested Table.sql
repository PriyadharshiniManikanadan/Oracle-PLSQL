/*collections 

3 types
 
2. Nested Table / Nested Array 
 
syntax 
    type type_name
    is table of [(binary_interger / pls_integer / simple_integer / varchar2(n)] */ 
-------------------------------------------------------------------------------   
set serveroutput on;

declare
type emp_data is table of employees%rowtype;

v_emp emp_data := emp_data();   -- start / initilize this collection

begin 
v_emp.extend(2);  -- Listed format

select * into v_emp(1) from employees where employee_id = 103;

dbms_output.put_line(v_emp(1).first_name);
end;
/
-------------------------------------------------------------------------------

declare
type emp_data is table of employees.first_name%type;

v_emp emp_data := emp_data();   -- start / initilize this collection

begin 
-- v_emp.extend(2);  -- Listed format

select first_name into v_emp(1) from employees where employee_id = 105;

dbms_output.put_line(v_emp(1));
end;
/

-------------------------------------------------------------------------------

declare
type emp_data is table of varchar2(20) not null;

v_emp emp_data := emp_data('Priya','Mani');   -- Array format & start / initilize this collection

begin 

dbms_output.put_line(v_emp(1));
end;
/