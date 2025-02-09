-- Logical Operator -> AND & OR

--------------------------------------------------------------------------------
-- AND -> Both expressions are true

set serveroutput on;

declare
v_sal number := 1000;
v_id number := 10;

begin
    If v_sal >= 1000 and v_id = 10 then
    dbms_output.put_line('Approved');
    else
    dbms_output.put_line('Rejected');
    end if;
end;
/
--------------------------------------------------------------------------------
-- AND

declare
v_sal number := 1000;
v_id number := 10;

begin
    If v_sal > 1000 and v_id = 10 then
    dbms_output.put_line('Approved');
    else
    dbms_output.put_line('Rejected');
    end if;
end;
/
--------------------------------------------------------------------------------
-- OR  -> if only one expression is true & always with ()

declare
v_sal number := 1000;
v_id number := 105;

begin
    If (v_sal >= 1000 or v_id = 10) then
    dbms_output.put_line('Approved');
    else
    dbms_output.put_line('Rejected');
    end if;
end;
/
--------------------------------------------------------------------------------
-- OR  

declare
v_sal number := 1000;
v_id number := 105;

begin
    If (v_sal > 1000 or v_id = 10) then
    dbms_output.put_line('Approved');
    else
    dbms_output.put_line('Rejected');
    end if;
end;
/


