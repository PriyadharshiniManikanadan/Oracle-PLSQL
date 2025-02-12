 /* Calling NOtations in Procedures
     
     3 types
     
        1. Positional Notation
        2. Named Notation
        3. Mixed Notation  */
        
--------------------------------------------------------------------------------        
-- 1.  Positional Notation        

create or replace procedure pro_demo(p_deptid number,
                                     -- p_deptid number := 90,  -- ERROR : wrong number or types of arguments in call to 'PRO_DEMO'
                                     p_name OUT employees.first_name%type,
                                     p_sal IN OUT number) as
                                                                         

begin

 select first_name, salary into p_name, p_sal
 from employees 
 where department_id  = p_deptid
       and  salary = p_sal;
       
end;
/

-- Calling the procedure
set serveroutput on;
declare 
v_name employees.first_name%type;
v_sal number := 24000;

begin
pro_demo(90,v_name,v_sal);                    -- Positional Notation
dbms_output.put_line(v_name || ' - ' || v_sal);
end;
/

--------------------------------------------------------------------------------        
-- 2. Named Notation        

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

-- Calling the procedure
set serveroutput on;

declare 
v_name employees.first_name%type;
v_sal number := 24000;

begin
pro_demo( p_deptid => 90,             
          p_name => v_name,            -- Named Notation (Majorly used in all organizations)
          p_sal => v_sal);   
                    
dbms_output.put_line(v_name || ' - ' || v_sal);
end;
/

--------------------------------------------------------------------------------        
-- 3.  Mixed Notation        

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

-- Calling the procedure
set serveroutput on;

declare 
v_name employees.first_name%type;
v_sal number := 24000;

begin                                  -- Mixed NOtation
pro_demo( 90,                          -- Positional Notation
          p_name => v_name,            -- Named Notation (Majorly used in all organizations)
          p_sal => v_sal);   
                    
dbms_output.put_line(v_name || ' - ' || v_sal);
end;
/