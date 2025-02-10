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
v_first_name employees.first_name%type;
v_id number(10) := 105;

begin
   <<emp_name>>        -- Label
   select first_name into v_first_name 
   from employees 
   where employee_id = v_id;
   
   -- sub Block
   begin
     dbms_output.put_line(v_id ||' '||v_first_name);
     v_id := v_id + 5;
     
          
     if v_id < 130 then
      goto emp_name;    -- GOTO label
     end if;  
   end;      
end;
/

--------------------------------------------------------------------------------
-- Rule 1 : GOTO statement must have a label

declare 
v_valid boolean := True;

begin
  goto emp_data;     -- Rule 1
    if v_valid then
      dbms_output.put_line('Valid');
    end if;
    
    <<emp_data>>  -- Rule 2 : label before the statement
    null;         -- PL/SQL procedure successfully completed, but it will execute any value
end;
/
--------------------------------------------------------------------------------
-- Rule 2 : Label must be before block / statement

declare 
v_valid boolean := True;

begin
  goto emp_data;
    if v_valid then
      dbms_output.put_line('Success'); 
    end if;
   
    <<emp_data>>    -- Rule 2 : label before the block
    begin               
        if v_valid then
          dbms_output.put_line('Label Success'); 
        end if;
    end;  
end;
/
--------------------------------------------------------------------------------
declare
v_valid boolean := True;

begin
  goto emp_data;
    
    if v_valid then
    dbms_output.put_line('Success');
    end if;
    
    <<emp_data>>    -- Rule 2: Label before Statement
    dbms_output.put_line('Label');
    
    if v_valid then
    dbms_output.put_line('Label Success');
    end if;

end;
/
--------------------------------------------------------------------------------
-- Rule 3 : Cannot transfer control into (IF/CASE/LOOP/SUB Block) statements

declare
v_valid boolean := True;

begin
  goto emp_data;
  
  if v_valid then
   <<emp_data>>      -- ERROR : illegal GOTO statement (Into IF statement)
      null;
  end if;
end;
/
--------------------------------------------------------------------------------

declare
v_valid boolean := True;

begin
  goto emp_data;
-- <<emp_data>>       (remove label from there and provide it here it will solve this error)
  case 
  when v_valid then
   <<emp_data>>      -- ERROR : illegal GOTO statement (Into CASE statement)
      null;
  end case;
end;
/
--------------------------------------------------------------------------------

declare
v_valid number := 10;

begin
  goto emp_data;
-- <<emp_data>>       (remove label from there and provide it here it will solve this error)
    loop  
     <<emp_data>>       -- ERROR : identifier 'EMP_DATA' must be declared (Into LOOP statement)
      dbms_output.put_line(v_valid);
      v_valid := v_valid + 2;
      
      if v_valid > 20 then
        exit;
      end if;
    end loop;
end;
/

--------------------------------------------------------------------------------

declare
v_valid boolean := True;

begin
  
      begin
        goto emp_data;
          if v_valid then
          dbms_output.put_line('Success');
          end if;
      end;
      
   -- <<emp_data>>       (remove label from there and provide it here it will solve this error)  
      begin
       <<emp_data>>     -- ERROR : identifier 'EMP_DATA' must be declared (Into SUB BLOCK statement)
         if v_valid then
         dbms_output.put_line('Invalid');
         end if;   
      end;
      
end;
/

--------------------------------------------------------------------------------
-- Rule 4 : Cannot transfer control into (from one IF to another statements)
--          
declare
v_valid boolean := True;

begin
      
     if v_valid then
     goto emp_data;   
     dbms_output.put_line('Success');
     end if;

        
     if v_valid then
     <<emp_data>>
     dbms_output.put_line('Invalid');
     end if;  
      
end;
/
--------------------------------------------------------------------------------
-- Rule 4 : Cannot transfer control into (from one CASE to another statements)

--          
declare
v_valid boolean := True;

begin
      
     case 
     when v_valid then
     goto emp_data;       -- illegal GOTO statement; this GOTO cannot branch to label 'EMP_DATA
     dbms_output.put_line('Success');
     end case;

        
     case
     when v_valid then
     <<emp_data>>         -- illegal GOTO statement; this GOTO cannot branch to label 'EMP_DATA
     dbms_output.put_line('Invalid');
     end case;  
      
end;
/
--------------------------------------------------------------------------------
-- Rule 4 : Cannot transfer control into (from one CASE to another statements)

--          
declare
v_valid boolean := True;
v_valid_1 number := 10;

begin
      
     case 
     when v_valid then
     goto emp_data;       -- illegal GOTO statement; this GOTO cannot branch to label 'EMP_DATA
     dbms_output.put_line('Success');
     end case;

        
     case
     when v_valid_1 = 10 then
     <<emp_data>>         -- illegal GOTO statement; this GOTO cannot branch to label 'EMP_DATA
     dbms_output.put_line('Invalid');
     end case;  
      
end;
/
--------------------------------------------------------------------------------
-- Rule 5 : Cannot place the LABEL before the END

declare 
v_valid boolean := True;

begin
  goto emp_data;     
    if v_valid then
      dbms_output.put_line('Valid');
    end if;
    
    <<emp_data>>    -- ERROR : Encountered the symbol "END" when expecting one of the following
--  null;           -- add null or a statement to solve this Error
end;
/
--------------------------------------------------------------------------------
-- Rule 5 : Cannot place the LABEL before the END loop also

declare
v_num number := 1;
begin
    goto emp_data;
        loop
            if v_num > 5 then
            dbms_output.put_line(v_num);
            end if;
            <<emp_data>>
        end loop;
end;
/
--------------------------------------------------------------------------------
-- Rule 5 : Cannot place the LABEL before the END loop also

declare
v_valid boolean;

begin
    for i in 1..50
        loop
            if v_valid then
              goto end_loop
            end if;
          <<end_loop>>   -- ERROR : Encountered the symbol "END" when expecting one of the following
        end loop;      
end;
/
--------------------------------------------------------------------------------
-- Rule 6 : Cannot place the LABEL into Exception Handler

set serveroutput on;

declare

v_first_name employees.first_name%type;
v_emp_id employees.employee_id%type := 1005;

begin

 goto emp_data;
 
    select first_name into v_first_name 
    from employees 
    where employee_id = v_emp_id;    
        
    dbms_output.put_line(v_emp_id ||' '||v_first_name);
        
    exception
        when no_data_found then
        <<emp_data>>                -- ERROR : illegal GOTO statement; this GOTO cannot branch to label 'EMP_DATA'
        dbms_output.put_line(v_emp_id ||' '||'is not found in the table');
    
end;
/
--------------------------------------------------------------------------------
-- Rule 7 : Cannot transfer control from an Exception Handler into the current block

set serveroutput on;

declare

v_first_name employees.first_name%type;
v_emp_id employees.employee_id%type := 1005;

begin   -- Main/Current Block
 
    select first_name into v_first_name 
    from employees 
    where employee_id = v_emp_id;    
        
    dbms_output.put_line(v_emp_id ||' '||v_first_name);
    
    <<emp_data>>
    if v_emp_id = 1005 then
    dbms_output.put_line(v_emp_id ||' '||v_first_name);
    end if;
        
    exception
        when no_data_found then
        goto emp_data;           -- ERROR : illegal GOTO statement; this GOTO cannot branch to label 'EMP_DATA'     
        dbms_output.put_line(v_emp_id ||' '||'is not found in the table');
    
end;
/
--------------------------------------------------------------------------------
-- It gives the output because LABEL is inside the Outer block not in the current block

declare

v_first_name employees.first_name%type;
v_emp_id employees.employee_id%type := 1005;

begin   -- Outer block Block

   begin  -- sub block/ current block
   
        select first_name into v_first_name 
        from employees 
        where employee_id = v_emp_id;    
            
         dbms_output.put_line(v_emp_id ||' '||v_first_name);
                
        if v_emp_id = 1005 then
         dbms_output.put_line(v_emp_id ||' '||v_first_name);
        end if;
            
        exception
            when no_data_found then
            goto emp_data;             
            dbms_output.put_line(v_emp_id ||' '||'is not found in the table');
            
    end;

<<emp_data>>     -- It gives the output because LABEL is inside the Outer block not in the current block
dbms_output.put_line('Employee_ID' ||' '||v_emp_id ||' '||'is not found in the table');

end;
/




