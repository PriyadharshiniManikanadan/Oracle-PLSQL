 /* Calling NOtations in Functions
     
     3 types
     
        1. Positional Notation
        2. Named Notation
        3. Mixed Notation  */
        
--------------------------------------------------------------------------------        
-- 1.  Positional Notation   

create or replace function fun_demo (p_id number,
                                     p_sal number,
                                     p_deptid number)
return varchar2
as
v_name employees.first_name%type;

begin

  select first_name into v_name
  from employees 
  where employee_id = p_id and
        salary > p_sal and
        department_id = p_deptid;
        
return v_name; 

end;
/

-- Calling the function
declare 
v_ename employees.first_name%type;

begin
    v_ename := fun_demo(102,16000,90);
    dbms_output.put_line(v_ename);
end;
/

--------------------------------------------------------------------------------        
-- 1. Named Notation   

create or replace function fun_demo (p_id number,
                                     p_sal number,
                                     p_deptid number)
return varchar2
as
v_name employees.first_name%type;

begin

  select first_name into v_name
  from employees 
  where employee_id = p_id and
        salary > p_sal and
        department_id = p_deptid;
        
return v_name; 

end;
/

-- Calling the function
declare 
v_ename employees.first_name%type;

begin
    v_ename := fun_demo(p_id => 102,
                        p_sal => 16000,
                        p_deptid => 90);
    dbms_output.put_line(v_ename);
end;
/

--------------------------------------------------------------------------------        
-- 1. Mixed Notation   

create or replace function fun_demo (p_id number,
                                     p_sal number,
                                     p_deptid number)
return varchar2
as
v_name employees.first_name%type;

begin

  select first_name into v_name
  from employees 
  where employee_id = p_id and
        salary > p_sal and
        department_id = p_deptid;
        
return v_name; 

end;
/

-- Calling the function
declare 
v_ename employees.first_name%type;

begin
    v_ename := fun_demo(102,
                        p_sal => 16000,
                        p_deptid => 90);
    dbms_output.put_line(v_ename);
end;
/

 
                                     
                                     