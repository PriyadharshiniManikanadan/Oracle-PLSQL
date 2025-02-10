/* Control Statememts in PLSQL

3. Types

1st. Conditional Selection Statememts

 1. IF statememts  - 3 types
                (i) If..then
                (ii) If..then..else
                (iii) If..then..elsif..then..else
     
 2. CASE statememts */


-------------------------------------------------------------------------------

--  IF statememts 

-- If ...then...

set serveroutput on;

declare
v_sal number := 2000;

begin
    if v_sal > 2000 then
    dbms_output.put_line(1);
    end if;
end;
/

-------------------------------------------------------------------------------

-- If ...then...else

declare
v_sal number := 2000;

begin
    if v_sal > 2000 then
    dbms_output.put_line(1);
    else
    dbms_output.put_line(2);
    end if;
end;
/

-------------------------------------------------------------------------------

-- If...then...elsif...then...elsif...then...else

declare
v_sal number := 2500;

begin
    if v_sal between 1000 and 2000 then
    dbms_output.put_line(1);
    elsif v_sal between 3000 and 5000 then
    dbms_output.put_line(2);
    elsif v_sal between 5000 and 1000 then
    dbms_output.put_line(3);
    else
    dbms_output.put_line(4);
    end if;
end;
/