/* Excetptions 
               -> To handle errors
               -> may be internally defined / user defined - by ORACLE */
       
--------------------------------------------------------------------------------
set serveroutput on;
declare
v_name varchar2(20);
begin

    select first_name into v_name 
    from  employees 
    where employee_id = 98;
  
exception 
    when no_data_found then
    dbms_output.put_line('Error code: '|| SQLCODE);
    dbms_output.put_line('Error no and Error message: '|| SQLERRM);
  
end;
/