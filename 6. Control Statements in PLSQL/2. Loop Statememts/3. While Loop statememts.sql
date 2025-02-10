/* Control Statememts in PLSQL

3. Types

2nd. Loop Statememts

LOOP 
For Loop
While Loop
*/

-------------------------------------------------------------------------------

-- While Loop

set serveroutput on;

declare
v_demo number := 1;

begin 
    while v_demo < 10   -- loop condition
      loop
        dbms_output.put_line(v_demo);
        v_demo := v_demo + 2;    -- increament counter
      end loop;
end;
/
-------------------------------------------------------------------------------

-- While Loop 

set serveroutput on;

declare
v_id employees.employee_id%type := 100;
v_name employees.first_name%type;

begin 
    while v_id < 110   -- loop condition
      loop
        select first_name into v_name from employees where employee_id = v_id;
        dbms_output.put_line(v_id ||' ' || v_name );
        v_id := v_id + 2;    -- increament counter
      end loop;
end;
/