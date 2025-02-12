 -- IN , OUT, IN OUT parameters in procedures in PLSQL
 
create or replace procedure pro_demo (p_num number,
                                      p_name OUT employees.first_name%type,
                                      p_id IN OUT number) 
                                      as
                            
begin

  select first_name,salary into p_name, p_id
  from employees
  where department_id = p_num 
        and  salary = p_id;
        
end;
/ 

-- Calling a Procedure

declare
v_name employees.first_name%type;
v_id number := 24000;

begin
pro_demo(90,v_name,v_id);

dbms_output.put_line(v_name);
dbms_output.put_line(v_id);
end;
/


                            