/* Procedure Calling Methods
 
 3 Methods  -> Begin & end block  - works for all IN/OUT/IN OUT parameters
            -> Execute            - works only for IN parameter
            -> Call               - works only for IN parameter  */
            
--------------------------------------------------------------------------------
-- Begin & end

create or replace procedure pro_demo(p_deptid number,
                                     p_name OUT employees.first_name%type,
                                     p_sal IN OUT number) as
                                                                         

begin

 select first_name, salary into p_name, p_sal
 from employees 
 where department_id  = p_deptid
       and  salary = p_sal;
       
end;
/

-- Calling the procedure -> Begin & end 

declare 
v_name employees.first_name%type;
v_sal number := 24000;

begin
pro_demo( p_deptid => 90,             
          p_name => v_name,          
          p_sal => v_sal);   
                    
dbms_output.put_line(v_name || ' - ' || v_sal);
end;
/
--------------------------------------------------------------------------------
-- Execute

create or replace procedure pro_demo(p_empid IN number) 
as

v_name varchar2(20);                                                                         

begin

 select first_name into v_name
 from employees 
 where employee_id = p_empid;
 
 dbms_output.put_line(v_name);
       
end;
/

-- Calling the procedure -> Execute

execute pro_demo(105);

--------------------------------------------------------------------------------
-- call

create or replace procedure pro_demo(p_empid IN number) 
as

v_name varchar2(20);                                                                         

begin

 select first_name into v_name
 from employees 
 where employee_id = p_empid;
 
 dbms_output.put_line(v_name);
       
end;
/

-- Calling the procedure -> Execute

call pro_demo(105);
