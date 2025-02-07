-- Complex / Composite Datatypes -> To store multiple values 
-- 4 types

-- 1. %Type    -> to get the datatype from another schema / table / column 

set serveroutput on;
declare
v_deptid departments.department_id%type;   -- getting the datatype from another table & column
v_empid v_deptid%type;                     -- getting the datatype from another variable called 'internal consistency'

begin 
select department_id into v_empid
from employees
where employee_id = 103;

dbms_output.put_line(v_empid);
end;
/
-------------------------------------------------------------------------------   

-- 2. %Rowtype          -> getting the datatypes from all the columns of a particular table

declare 
v_row employees%rowtype;
begin
select * into v_row from employees where employee_id = 106;
dbms_output.put_line(v_row.first_name);
end;
/
-------------------------------------------------------------------------------   

-- 3. PLSQL Records      -> Storing multiple columns in 1 variable


declare
type rec_demo is record(v_1 employees.first_name%type,                 -- these are all sub variables
                        v_2 employees.salary%type, -- or number
                        v_3 departments.department_name%type);

-- (v_demo) is a  main variable, (rec_demo) is a datatype 
v_demo rec_demo;  
v_demo1 rec_demo;
v_demo2 rec_demo;

begin
    select e.first_name, e.salary, d.department_name into v_demo
    from employees e, departments d
    where e.department_id = d.department_id
    and employee_id = 103;
    
    select e.first_name, e.salary, d.department_name into v_demo1
    from employees e, departments d
    where e.department_id = d.department_id
    and employee_id = 106;
    
    select e.first_name, e.salary, d.department_name into v_demo2
    from employees e, departments d
    where e.department_id = d.department_id
    and employee_id = 103;
    
dbms_output.put_line(v_demo.v_1||' '||v_demo.v_2||' '||v_demo.v_3);
dbms_output.put_line(v_demo1.v_1||' '||v_demo1.v_2||' '||v_demo1.v_3);
dbms_output.put_line(v_demo2.v_1||' '||v_demo2.v_2||' '||v_demo2.v_3);
end;
/

