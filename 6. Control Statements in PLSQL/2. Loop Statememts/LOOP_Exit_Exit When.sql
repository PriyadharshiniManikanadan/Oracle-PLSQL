/* Simple LOOP  ( with EXIT condition) 
                                           
EXIT statement -> 2 Types
                    (i) EXIT
                    (ii) EXIT WHEN   */

-- Simple LOOP - EXIT - using IF statement

set serveroutput on; 

declare
v_num number := 1;

begin
    loop
      dbms_output.put_line(v_num);
      v_num := v_num + 1;            -- Increament Statement
      if v_num = 5 then
       exit;
      end if;
    end loop;
end;
/
-------------------------------------------------------------------------------
-- another logic flow

declare
v_num number := 1;

begin
  loop
    dbms_output.put_line(v_num);
    if v_num = 5 then
      exit;
    else
      v_num := v_num + 1;
    end if;
  end loop;
end;
/
-------------------------------------------------------------------------------

-- Simple LOOP - EXIT - using CASE statement

declare
var1 number := 1;

begin
    loop 
     dbms_output.put_line(var1);
       case
          when var1 = 5 then
            exit;
          else
           var1 := var1 + 1;
        end case;
    end loop;
end;
/
-------------------------------------------------------------------------------
-- Simple LOOP - Using  EXIT WHEN

declare
v_num number := 1;

begin 
  loop
    dbms_output.put_line(v_num);
      exit when v_num = 5;
      v_num := v_num + 1;
  end loop;  
end;
/