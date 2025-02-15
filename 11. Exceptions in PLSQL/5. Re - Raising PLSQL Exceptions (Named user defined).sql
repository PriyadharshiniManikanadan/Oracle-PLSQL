-- Re-Raising a PLSQL Exceptions 
          -- Used in Calling program / Outer Block

declare
v_name employees.first_name%type;
e_error exception;
e_error1 exception;

begin       -- Outer block

    begin   -- Inner block
        select first_name into v_name
        from employees
        where employee_id = 130;
        
        if v_name = 'Mozhe' then
        raise e_error;
        end if;
        
    exception  -- Inner block
        when e_error then
        dbms_output.put_line('Inner Block error message');
        --raise;
        raise e_error1;
    
    end;

exception    -- Outer Block
    when e_error then 
    dbms_output.put_line('Outer Block error message');
    
    when e_error1 then
    dbms_output.put_line('Outer1 Block error message');
    
    
end;
/