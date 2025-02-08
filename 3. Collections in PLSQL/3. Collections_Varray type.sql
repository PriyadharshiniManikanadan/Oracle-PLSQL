/*collections 

3 types
 
3. Varray type
 
syntax 
    type type_name
    is varray(size) of [(binary_interger / pls_integer / simple_integer / varchar2(n)] */ 
-------------------------------------------------------------------------------  
set serveroutput on;
declare
type emp_data is varray(10) of varchar2(20);
v_emp emp_data := emp_data();     -- start / initilize this collection

--hard code
begin
v_emp.extend(5);
v_emp(1) := 'Priya';
v_emp(3) := 'Mani';

dbms_output.put_line(v_emp(3));
end;
/

------------------------------------------------------------------------------- 
-- getting data from the Employee Table

declare
type emp_data is varray(10) of employees%rowtype;
v_emp emp_data := emp_data();     -- start / initilize this collection

begin
v_emp.extend(5);
select * into v_emp(1) from employees where employee_id = 106;

dbms_output.put_line(v_emp(1).first_name);
end;
/