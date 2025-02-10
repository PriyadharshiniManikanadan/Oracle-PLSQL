/* Control Statememts in PLSQL

3. Types

2nd. Loop Statememts  - 3 Types

Simple LOOP 
For Loop
While Loop
*/

-------------------------------------------------------------------------------

-- Simple LOOP  ( with buffer overflow without exit condition)

set serveroutput on;

begin
    loop
    dbms_output.put_line('Welcome');
    end loop;
end;
/

/* Raised an error --> buffer overflow, limit of 1000000 bytes
because there is no EXIT condition to come out of the loop */

-------------------------------------------------------------------------------

/* Simple LOOP  ( with EXIT condition) 
                                           
EXIT statement -> 2 Types
                    (i) EXIT
                    (ii) EXIT WHEN   */

-- Simple LOOP - EXIT - using IF statement

declare
v_num number := 1;

begin
    loop
      dbms_output.put_line(v_num);
      v_num := v_num + 1;            -- Increament Statement
      if v_num = 5 then
       exit;
      end if;
    end loop;
end;
/
-------------------------------------------------------------------------------
-- another logic flow

declare
v_num number := 1;

begin
  loop
    dbms_output.put_line(v_num);
    if v_num = 5 then
      exit;
    else
      v_num := v_num + 1;
    end if;
  end loop;
end;
/
-------------------------------------------------------------------------------


