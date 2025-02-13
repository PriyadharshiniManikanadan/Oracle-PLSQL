/* Functions in Procedures in PLSQL

- Return a value / expression
- Must have 2 'return' statement with same datatype
- Can be stored in database as schema object
- Return datatype size should not be mentioned

- For calling the Function there are many methods, 1 among them is
     - use 'SELECT fun_name from dual' */

--------------------------------------------------------------------------------
-- Creating a function using expression

create or replace function fun_demo      --parameters are optional
return number    -- datatype (same)
as

begin
return 10*10;    -- expression datatype (same)
end;
/

-- Calling the Function

select fun_demo from dual;

--------------------------------------------------------------------------------
-- Creating a function using variable

create or replace function fun_demo      --parameters are optional
return number    -- datatype (same)

as
v_sal number;

begin
  select salary into v_sal
  from employees 
  where employee_id = 130;
  
  return v_sal;    -- variable datatype (same)
end;
/

-- Calling the Function

select fun_demo from dual;

--------------------------------------------------------------------------------

-- Creating a function using variable 
create or replace function fun_demo      --parameters are optional
return varchar2    -- datatype (same)

as
v_name varchar2(20);

begin
  select first_name into v_name
  from employees 
  where employee_id = 130;
  
  return v_name;    -- variable datatype (same)
end;
/

-- Calling the Function

select fun_demo from dual;

--------------------------------------------------------------------------------