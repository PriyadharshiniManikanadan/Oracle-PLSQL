-- MUST KNOW -> General informations in Sub programs

 create or Replace procedure pr_demo(p_id number)
 as
  v_name varchar2(20);
  
 begin
 
   select fisrt_name into v_name
   from employee_table 
   where employee_id = p_id;
   
 end;
 /
-------------------------------------------------------------------------------- 
-- To find errors in the sub programs which is created new
 show errors
 
 -- To find all the errors in the sub programs under users
 select * from user_errors;
 
-- To find the errors in specific sub program
show errors procedure pr_demo;

-------------------------------------------------------------------------------- 
-- To find all the objects under users
 select * from user_objects;
 
--------------------------------------------------------------------------------  
-- To find all the source codes under users
select * from user_source
where text like '%v_name%';

-------------------------------------------------------------------------------- 
-- To create sub program
grant create procedure_name to user_name;

-- To revoke 1 sub program
revoke procedure_name from user_name;

-------------------------------------------------------------------------------- 
-- To EXECUTE a sub program

-- To execute 1 sub program
grant execute on procedure_name to user_name;

-- Revoke execute 1 sub program
revoke execute on procedure_name from user_name;

-- To execute any sub program
grant execute any procedure_name to user_name;

-- Revoke execute any sub program
revoke execute any procedure_name from user_name;

-------------------------------------------------------------------------------- 
-- To drop the sub program
drop procedure/Function pro/fun_name
 
 