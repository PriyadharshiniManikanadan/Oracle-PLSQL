 /* Function Calling Methods
 
 3 Methods  
          1. Using parameter method  -> Passiing a function(para) into a program
             -> Begin & end block 
             -> Execute            
             -> Call    
          2. Using Expresion         -> Assigning function(para) to a variable
          3. Using SELECT statement  -> select function_name(para) from table_name(dual) */
          
            
--------------------------------------------------------------------------------

create or replace function fun_demo (p_id number)
return varchar2
as
v_name varchar2(20);

begin 
    select first_name into v_name
    from employees 
    where employee_id = p_id;
return v_name;
end;
/
--------------------------------------------------------------------------------
-- 1. Using parameter method

-- Begin & end 

begin 
dbms_output.put_line(fun_demo(130));
end;
/

-- Execute

Execute dbms_output.put_line(fun_demo(120));

-- Call

Call dbms_output.put_line(fun_demo(110));

--------------------------------------------------------------------------------
--2. Using Expression

declare
v_ename varchar2(20);

begin
    v_ename := fun_demo(110);
    dbms_output.put_line(v_ename);
end;
/
--------------------------------------------------------------------------------
--3. Using SELECT statement

select fun_demo(130) from dual;
