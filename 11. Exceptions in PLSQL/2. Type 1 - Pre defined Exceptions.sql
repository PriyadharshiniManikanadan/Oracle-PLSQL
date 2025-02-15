/* Exceptions in PLSQL

3 steps -> 1. Identifing errors  - Errors in code
           2. Trapping errors    - using when clause
           3. Handle errors      - statements
           
3 TYPES of Exceptions 
                     1. Pre defined Exceptions      -> Errors raised implicitly by the ORACLE
                     2. Non pre defined exceptions  ->
                     3. User defined exceptions     ->  */
                  
--------------------------------------------------------------------------------  
-- 1. Pre defined Exceptions 
        --> 1 Begin & End block -> Must have 1 Exception

set serveroutput on;

declare
v_name varchar2(2);

begin
  select first_name into v_name
  from employees
  where department_id = 10;
    
exception
  when too_many_rows then
  dbms_output.put_line('Many rows');
  --dbms_output.put_line(sqlerrm);
  
  when no_data_found then
  dbms_output.put_line('No Department');
  --dbms_output.put_line(sqlerrm);
  
  when invalid_number then
  dbms_output.put_line('Pass the valid number');
  --dbms_output.put_line(sqlerrm);
  
  when others then
  dbms_output.put_line('Error Message');
  dbms_output.put_line(sqlcode);
  dbms_output.put_line(sqlerrm);

end;
/

           
           