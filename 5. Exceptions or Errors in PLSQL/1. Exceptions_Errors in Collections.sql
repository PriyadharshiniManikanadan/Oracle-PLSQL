-- Exceptions / Errors in collections

-- 5 Types of Error messages

-------------------------------------------------------------------------------
-- Reference to uninitialized collection

set serveroutput on;
declare
type emp_data is table of varchar2(5);

v_emp emp_data;  --:= emp_data('Priya','Mani');

begin
v_emp(1) := 'Utsav';
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

-------------------------------------------------------------------------------
-- value or conversion error: character string buffer too small

declare
type emp_data is table of varchar2(5);

v_emp emp_data := emp_data('Priya','Mani');

begin
v_emp(1) := 'UtsavInbav';
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

-------------------------------------------------------------------------------
-- value or conversion error: character string buffer too small

declare
type emp_data is table of varchar2(5);

v_emp emp_data := emp_data('Priya','Mani');

begin
v_emp('A') := 'Utsav';
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

-------------------------------------------------------------------------------
-- subscript outside of limit

declare
type emp_data is table of varchar2(5);

v_emp emp_data := emp_data('Priya','Mani');

begin
v_emp(0) := 'Utsav';                   -- 0 Index
dbms_output.put_line(v_emp(1));
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

-------------------------------------------------------------------------------
-- subscript outside of limit

declare
type emp_data is table of varchar2(5);

v_emp emp_data := emp_data('Priya','Mani');

begin
v_emp(-1) := 'Utsav';             -- Negative index
dbms_output.put_line(v_emp(1));
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

-------------------------------------------------------------------------------
-- Subscript beyond count

declare
type emp_data is table of varchar2(5);

v_emp emp_data := emp_data('Priya','Mani');

begin
v_emp(1) := 'Utsav';             
dbms_output.put_line(v_emp(3));
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

-------------------------------------------------------------------------------
-- no data found

declare
type emp_data is table of varchar2(5);

v_emp emp_data := emp_data('Priya','Mani');

begin
v_emp.delete(1);         
dbms_output.put_line(v_emp(1));
    exception
        when others then
        dbms_output.put_line(SQLERRM);
end;
/

