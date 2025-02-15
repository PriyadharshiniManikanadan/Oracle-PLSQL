 /* Exceptions in PLSQL

3 steps -> 1. Identifing errors  - Errors in code
           2. Trapping errors    - using when clause
           3. Handle errors      - statements
           
3 TYPES of Exceptions 
                     1. Pre defined Exceptions      -> Errors raised implicitly by the ORACLE
                     2. Non pre defined exceptions  -> Errors raised by the User/Programmer
                     
                     3. User defined exceptions     ->  2 Types
                                                               1. Named - User defined Exceptions
                                                               2. UnNamed - User defined Exceptions */
                  
-------------------------------------------------------------------------------- 
/* 3. User defined exceptions
                              
-- Type 1: Named User defined exceptions
                    - Must have conditional statement
                    - Must have 'RAISE' keyword to raise the error 
                    - error should be declare in the declare block (associated exception)
                    - Used for Testing & Debugging */

declare 
v_num number := 100;
e_error Exception;    -- Associated Exception

begin  

    if v_num < 150 then     -- Conditional statement (whenever the condition is True)
    RAISE e_error;          -- Use 'RAISE' keyword to raise the error  
    end if;
    
    dbms_output.put_line('Provided value: '|| v_num);
exception
    when e_error then
    dbms_output.put_line('Value is less than 150');

end;
/
---------------------------------------------------------------------------------
/* Type 2: UnNamed User defined exceptions
                    - Must have conditional statement
                    - Must have 'RAISE_Application_error' Procedure with 2 parameters to raise the user defined error 
                    - 2 parameters -> - Error_code = (20000 - 20999), Error_message = (2048 characters long)
                    - Used for raising the errors in  calling program / Application 
                    */
declare
v_data number := 100;
begin
  if v_data < 150 then
  raise_application_error(-20001, 'Error message');
  end if;
end;
/
                    
                    

               
               

