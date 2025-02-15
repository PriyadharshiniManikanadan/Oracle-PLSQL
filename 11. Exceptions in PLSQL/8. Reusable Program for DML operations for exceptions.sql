-- Reusable Program 

create or replace procedure pr_error_log( p_name In error_log_table.name%type,
                                          p_desc In error_log_table.description%type)
AUTHID DEFINER                                         
as
PRAGMA AUTONOMOUS_TRANSACTION;

begin

    insert into error_log_table(                  
                    Name,
                    Description,
                    Callstack,
                    Errorstack,
                    Errorbacktrace,
                    Created_by
                    )            
            values( p_name,
                    p_desc,
                    dbms_utility.format_call_stack,
                    dbms_utility.format_error_stack,
                    dbms_utility.format_error_backtrace,
                    user);
Commit;

end;
/



pr_error_log(p_name => 'Title',
             p_desc => 'Error in Inner block');


                                          
                                          