/* For loop cursor
                  - It is the 'shortest way to fetch & process all the rows' return by SQL statements.
                  - It is very easy to understand and read.
                  - It automatically 
                               - Opens the cursor
                               - fetches the data
                               - closes the cursor
                                 when all the rows have been retreived
                  - It can accsess multiple columns.
                  - Cursor can also be declare in the declare block */
--------------------------------------------------------------------------------   
-- For Loop Cursor      -> for single column
 
begin

    for cur in (select first_name 
                from employees 
                where department_id = 30)
    loop
    dbms_output.put_line(cur.first_name);
    end loop;
                  
end;
/
--------------------------------------------------------------------------------   
-- For Loop Cursor      -> for multiple columns
 
begin

    for cur in (select * from employees 
                where department_id = 30)
    loop
    dbms_output.put_line(cur.salary);
    end loop;
                  
end;
/
--------------------------------------------------------------------------------   
-- Another method by declaring the cursor initially

-- For Loop Cursor      

declare 
    cursor c1 
    is 
    select * from employees 
    where department_id = 30;

begin

    for cur in c1
    loop
    dbms_output.put_line(cur.last_name);
    end loop;
                  
end;
/



                  