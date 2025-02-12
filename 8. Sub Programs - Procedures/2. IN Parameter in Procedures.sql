-- IN parameter mode in Procedure




-- create or replace procedure pr_demo (pr_id IN number)           -- no need to mention the size of the datatype
-- create or replace procedure pr_demo (pr_id number)              -- IN is a default parameter
-- create or replace procedure pr_demo (pr_id number default 105)  -- constant variable & No need to mention the parameter when calling the procedure
create or replace procedure pr_demo (pr_id number)          -- No need to mention the parameter when calling the procedure
as

v_name employees.first_name%type;

begin
select first_name into v_name
from employees 
where employee_id = pr_id;

dbms_output.put_line(v_name);
end;
/
--------------------------------------------------------------------------------
-- constatnt value
begin
pr_demo(103); -- Passing a value as an 'IN parameter' to the procedure
end;
end;
/
--------------------------------------------------------------------------------

begin
pr_demo;
end;
/
--------------------------------------------------------------------------------
-- Inizialized variable
declare 
id number := 130;
begin
pr_demo(id);  -- passing the variable as an 'IN parameter' to the procedure
end;
/