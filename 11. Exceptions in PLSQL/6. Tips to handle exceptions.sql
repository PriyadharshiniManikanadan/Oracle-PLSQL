/* Tips to handle the exceptions

BEST PRACTICE

1. To capture the errors
2. Need to create the error log table
2. Then create the reusable program as Independent transaction which will not affect the main transactions

   In reusable program (Procedure)
   2 keywords which is very importamnt   - AUTHID DEFINER as
                                         - PRAGMA AUTONOMOUS TRANSACTION  */

--------------------------------------------------------------------------------
-- 1. Do not use 'NUll' statement in the exception block
-- 2. Do not use 'dbms_output.put_line()' statement in the exception block, 
      --Because it is just a temporary memory, with this we cant debug anything in the future
set serveroutput on;

declare 
v_num number := 100;
e_error exception;   -- Associated exception

begin

    begin
        if v_num < 150 then
        raise e_error;   
        end if;      
    exception
        when e_error then 
     -- null;
     -- dbms_output.put_line('Inner block');  
        raise;
    end;

exception
    when e_error then
    dbms_output.put_line('Outer block');
end;
/
--------------------------------------------------------------------------------

declare 
v_num number := 100;
e_error exception;   -- Associated exception

begin

    begin
        if v_num < 150 then
        raise e_error;   
        end if;      
    exception
        when e_error then 
        -- DML Operations sholud be commited, but if we commit here, it will commit all the pending transactions above, so it is not a good practice
        -- thereby, we should not use any DML operations in Exception block
         
        insert into error_log_table(                  
                    Name,
                    Description,
                    Callstack,
                    Errorstack,
                    Errortraceback,
                    Created_by
                    )            
            values( 'Title',
                    'Error in Inner block',
                    dbms_utility.format_call_stack,
                    dbms_utility.format_error_stack,
                    dbms_utility.format_error_traceback,
                    user)
                    
                  
            
    end;

exception
    when e_error then
    dbms_output.put_line('Outer block');
end;
/

-- BEST PRACTICE  -> create a REUSABLE PROGRAM to use the DML operations.

--------------------------------------------------------------------------------
-- By using Resuable program - Procedure

declare 
v_num number := 100;
e_error exception;   -- Associated exception

begin

    begin
        if v_num < 150 then
        raise e_error;   
        end if;      
    exception
        when e_error then 
        pr_error_log(p_name => 'Title',
                     p_desc => 'Error in Inner Block');            
    end;

exception
    when e_error then
    dbms_output.put_line('Outer block');
end;
/

select * from error_log_table;
