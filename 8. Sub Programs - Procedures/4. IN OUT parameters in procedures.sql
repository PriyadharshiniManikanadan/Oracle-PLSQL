/* IN OUT parameter mode in Procedure */

create or replace procedure pro_demo (p_id in out number)
as

begin

  select salary into p_id
  from employees 
  where employee_id = p_id;
  
end;
/

-- Calling a  Procedure

declare
v_id number := 106;

begin
pro_demo(v_id);
dbms_output.put_line(v_id);
end;
/


