-- Global Variable & Local variable

--Outer block
<<outer>>
declare 
v_manager_name varchar2(20) := 'Manikandan';
v_dob date default '13-Jan-1989';

begin 
     -- Inner block
     declare
     v_employee_name varchar(20) := 'Priya';
     v_dob date := '09-Aug-1992';
     begin
     dbms_output.put_line('Manager_name: ' || v_manager_name);
     dbms_output.put_line('Manager_dob: ' || outer.v_dob);
     dbms_output.put_line('Employee_name: ' || v_employee_name);
     dbms_output.put_line('Employee_dob: ' || v_dob);
     end;
     
--dbms_output.put_line();
end;
/

-------------------------------------------------------------------------------   


-- Substitution Variable

set serveroutput on;
declare
v_first_name varchar2(20);

begin
select first_name into v_first_name 
from employees 
where employee_id = &emp_id;              -- '&' ampersent symbol 

dbms_output.put_line(v_first_name);
end;
/