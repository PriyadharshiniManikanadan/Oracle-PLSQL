/* Control Statememts in PLSQL

3. Types

1st. Conditional Selection Statememts

 1. IF statememts
 
 2. CASE statememts  - 2 types 
 
                    1. Simple CASE statememt
                           (i)  Standalone CASE statement
                           (ii) Expression CASE statement  - 3 Rules
                           
                    2. Searched CASE statement 
                           (i)  Standalone CASE statement
                           (ii) Expression CASE statement  - 3 Rules  */              
--------------------------------------------------------------------------------

-- CASE statememts

-- 1. Simple CASE statememt  - Standalone CASE statement

set serveroutput on;

declare

v_status varchar2(20) := 'Y';

begin
    case v_status
    when 'Y' then dbms_output.put_line('Approved');
    when 'N' then dbms_output.put_line('Not Approved');
    when 'NA' then dbms_output.put_line('Rejected');
    else dbms_output.put_line('Not Matched');
    end case;
end;
/
--------------------------------------------------------------------------------
-- 1. Simple CASE statememt  - Expression CASE statement -> Storing in variable

declare

v_status varchar2(20) := 'NAA';
v_output varchar2(20);

begin
v_output :=
    case v_status
    when 'Y' then 'Approved'
    when 'N' then 'Not Approved'
    when 'NA' then 'Rejected'
    --else 'Not Matched'
    end;
dbms_output.put_line(v_output);
end;
/
--------------------------------------------------------------------------------
-- 1. Simple CASE statememt  - Expression CASE statement -> passing as an input parameter for procedure / package

declare

v_status varchar2(20) := '2';  -- (Oracle will try to convert string to number IMPLICITLY)
v_output varchar2(20);

begin
dbms_output.put_line( 
                    case v_status
                    when '1' then 'Approved'
                    when 2 then 'Not Approved'   -- Here Oracle implicitly converts string to number , it give the output
                    when '3' then 'Rejected'
                    --else 'Not Matched'
                    end);
end;
/
--------------------------------------------------------------------------------
-- 2. Searched CASE statememt ( can Use Multiple conditions) - Standalone CASE statement

declare
v_status varchar2(20) := 'Y';
v_status1 varchar2(20) := 'NA';

begin
    case 
    when v_status = 'Y' and v_status1 = 'Y' then dbms_output.put_line('Approved');
    when v_status = 'N' and v_status1 = 'Y'  then dbms_output.put_line('Not Approved');
    when v_status = 'NA' and v_status1 = 'Y'  then dbms_output.put_line('Rejected');
    else dbms_output.put_line('Not Matched');
    end case;
end;
/