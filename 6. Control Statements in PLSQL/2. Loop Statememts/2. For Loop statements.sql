/* Control Statememts in PLSQL

3. Types

2nd. Loop Statememts

LOOP 
For Loop
While Loop
*/

-------------------------------------------------------------------------------

/* For Loop

*  i -> Oracle declares the Implicit variable as 'pls_integer' datatype as default
*  lower bound .. upper bound (default ascending order & only two dots inbetween)
*  add REVERSE keyword for descending order */
 

set serveroutput on;
begin
  for i in 1..5    
    loop
      dbms_output.put_line(i);
    end loop;
end;
/
-------------------------------------------------------------------------------

-- For Loop  

begin
  for i in reverse 1..5    -- add REVERSE keyword for descending order 
    loop
      dbms_output.put_line(i);
    end loop;
end;
/
-------------------------------------------------------------------------------

-- For Loop  

begin
  for i in 5..6.5    -- decimal value
    loop 
      dbms_output.put_line(i);
    end loop;
end;
/
-------------------------------------------------------------------------------

-- For Loop  

begin
  for i in 5..25/5    -- in fraction value
    loop 
      dbms_output.put_line(i);
    end loop;
end;
/
-------------------------------------------------------------------------------

-- For Loop  (from Table)
declare
v_name employees.first_name%type;

begin
  for i in 100..105     -- default ascending order
    loop
      select first_name into v_name from employees where employee_id = i;
      dbms_output.put_line(v_name);
    end loop;
end;
/
-------------------------------------------------------------------------------

-- For Loop  (from Table)

declare
v_name employees.first_name%type;

begin
  for i in reverse 100..105    -- descending order
    loop
      select first_name into v_name from employees where employee_id = i;
      dbms_output.put_line(v_name);
    end loop;
end;
/
