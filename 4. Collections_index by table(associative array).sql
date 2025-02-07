/* 4. PLSQL collections 

3 types

1. Index by Table / Associative Array

syntax 
    type type_name
    is table of datatype
    index by [(binary_interger / pls_integer / simple_integer / varchar2(n)] */
-------------------------------------------------------------------------------   
-- Hard code
set serveroutput on; 
declare
type emp_data is table of varchar2(20)
index by simple_integer;  -- simple_integer

v_emp emp_data;

begin
v_emp(1) := 'Priya';
v_emp(5) := 'Mani';

dbms_output.put_line(v_emp(1));
end;
/
-------------------------------------------------------------------------------
declare
type emp_data is table of varchar2(20)
index by varchar2(20);  -- varchar

v_emp emp_data;

begin
v_emp('A') := 'Priya';
v_emp('B') := 'Mani';

dbms_output.put_line(v_emp('A'));
end;
/

-------------------------------------------------------------------------------

declare
type emp_data is table of employees%rowtype    -- %rowtype
index by simple_integer;

v_emp emp_data;

begin
select * into v_emp(1) from employees where employee_id = 103;

dbms_output.put_line(v_emp(1).salary);
end;
/
-------------------------------------------------------------------------------
declare
type emp_data is table of employees.first_name%type   -- %type
index by simple_integer;

v_emp emp_data;

begin
select first_name into v_emp(5) from employees where employee_id = 103;

dbms_output.put_line(v_emp(5));
end;
/