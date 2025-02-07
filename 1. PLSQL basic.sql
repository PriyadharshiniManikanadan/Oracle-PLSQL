-- Basics of PLSQL
set serveroutput on;
declare
v_name varchar2(20):= 'Priya';
v_name1 varchar2(20) default 'Manikandan';
-- constant & mode are optional
v_sal number not null := 1000;
v_salary constant number := 4500;

begin
dbms_output.put_line(v_name||' '||v_name1||' '||v_sal||' '||v_salary);
end;
/

-- INTO clause

--set serveroutput on;
declare
v_first_name varchar2(20);
v_salary number;

begin
select first_name, salary into v_first_name,v_salary
from employees 
where employee_id = 103;

dbms_output.put_line(v_first_name||' '||v_salary);
end;
/



