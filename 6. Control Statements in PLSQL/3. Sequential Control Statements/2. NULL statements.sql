/* Control Statememts in PLSQL

3. Types

3rd. Sequential Control Statements

GOTO statements
NULL statememts
*/

-------------------------------------------------------------------------------

-- NULL statements

-- without NULL it shows error
-- we can use NULL statement, whenever there is no neccessary of executing a statement

begin
 null;    
end;
/

-------------------------------------------------------------------------------
declare
v_num number(10) := 1;

begin
    loop
      case 
          when v_num = 5 then
            null;             -- instaead of using output statement, NULL is used here.
          exit;
          else
          v_num := v_num + 2;
      end case;
    end loop;
end;
/






/* Control Statememts in PLSQL

3. Types

3rd. Sequential Control Statements  - 2 Types

GOTO statements
NULL statememts
*/

-------------------------------------------------------------------------------

-- GOTO statements  --> 7 important Rules to follow

set serveroutput on;

declare
v_name employees.first_name%type;
v_id number(10) := 105;

begin
   <<emp_name>> 
   select first_name into v_name 
   from employees 
   where employee_id = v_id;
   
   begin
     v_id := v_id + 5;
     dbms_output.put_line(v_id ||' '||v_name);
          
     if v_id < 130 then
      goto emp_name;
     end if;  
   end;      
end;
/
