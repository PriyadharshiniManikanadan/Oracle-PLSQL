/* Explicit Cursor

Must follow 4 steps
                     1. Declare cursor
                     2. Open cursor
                     3. Fetch cursor
                     4. Close cursor  */
--------------------------------------------------------------------------------     

declare
  cursor cur_demo       -- Cursor specification
  is                    -- Cursor body
  Select first_name
  from employees
  where department_id = 30;

v_name employees.first_name%type ;

Begin
    open cur_demo;
        Loop
            fetch cur_demo into v_name;
            exit when cur_demo%notfound;
            dbms_output.put_line(v_name);
        end loop;
        
    if cur_demo%isopen then
    close cur_demo;
    dbms_output.put_line('cur_demo is closed');
    end if;
    
end;
/
  
  

                     

