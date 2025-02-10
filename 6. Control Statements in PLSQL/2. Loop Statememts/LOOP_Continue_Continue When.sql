 /* Continue statements  - 2 types
                            (i) CONTINUE 
                            (i) CONTINUE WHEN  */
                            
-------------------------------------------------------------------------------

-- Continue    -> in simple loop

set serveroutput on;

declare 
v_num number(10) := 5;

begin
  loop
    v_num := v_num + 1;    
        if v_num = 10 then
          continue;
        end if;        
           dbms_output.put_line('Value for v_num: ' || v_num);
        exit when v_num = 15;        
   end loop;       
end;
/
-------------------------------------------------------------------------------

-- Continue when    -> in simple loop

declare 
v_num number(10) := 5;

begin
  loop
    v_num := v_num + 1;
        continue when v_num = 10;        
         dbms_output.put_line('Value for v_num: ' || v_num);         
        exit when v_num = 15;        
   end loop;       
end;
/             
-------------------------------------------------------------------------------

-- Continue     -> in for loop

begin
  for i in 1..10
    loop
      if i <> 8 then
        continue;
      end if;
         dbms_output.put_line('Value is :' || i);
    end loop;        
end;
/
-------------------------------------------------------------------------------

-- Continue When     -> in for loop

begin
  for i in 1..10
    loop
      continue when i != 5;
         dbms_output.put_line('Value is :' || i);
    end loop;        
end;
/
-------------------------------------------------------------------------------

-- Continue When     -> in for loop

declare
v_name employees.first_name%type;

begin
  for i in 100 .. 105
        loop
            select first_name into v_name from employees where employee_id = i;
              continue when i = 103;
                 dbms_output.put_line('Name: ' || v_name);
            end loop;        
end;
/
                        
 