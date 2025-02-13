/* IN parameter mode in Function

- No need to mention the size of the datatype
- IN is a default parameter
- constant variable & No need to mention the parameter when calling the procedure */

--------------------------------------------------------------------------------
create or replace function fun_demo (p_empid IN number)
return varchar2
as
v_name varchar2(20);

begin 

  select first_name into v_name
  from employees 
  where employee_id = p_empid;
  
  return v_name;
  
end;
/

-- Caling the function

select fun_demo(106) from dual;  -- user defined Temporary Table to capture the return value from the function created.

--------------------------------------------------------------------------------
-- Assigning default value to the parameter

create or replace function fun_demo (p_empid IN number := 105)   
return varchar2
as
v_name varchar2(20);

begin 

  select first_name into v_name
  from employees 
  where employee_id = p_empid;
  
  return v_name;
  
end;
/

-- Caling the function

select fun_demo(130) from dual;  -- it will return the value if we are paasing a value to the parameter, eventhough it has a default value

select fun_demo from dual;       -- if we are not paasing any value to the parameter, it will return the dafault parameter value as a result.