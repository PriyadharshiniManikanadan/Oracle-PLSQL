/* Collection Methods - Index by table / Associative Array

1.  Count
2.  first
3.  last
4.  limit      (not applicable)
5.  exixts(n)
6.  prior(n)
7.  next(n)
8.  extend     (not applicable)
9.  extend(n)  (not applicable)
10. trim       (not applicable)
11. trim(n)    (not applicable)
12. delete
13. delete(n)*/
------------------------------------------------------------------------------- 

-- count

set serveroutput on;

declare
type emp_data is table of varchar2(20)
index by simple_integer;

v_emp emp_data;

begin
v_emp(1) := 'Priya';
v_emp(4) := 'Mani';

dbms_output.put_line(v_emp.count);
end;
/

-------------------------------------------------------------------------------
-- first

declare
type emp_data is table of varchar2(20)
index by simple_integer;

v_emp emp_data;

begin
--v_emp(1) := 'Priya';
v_emp(4) := 'Mani';

dbms_output.put_line(v_emp.first);
end;
/

-------------------------------------------------------------------------------
-- last

declare
type emp_data is table of varchar2(20)
index by simple_integer;

v_emp emp_data;

begin
v_emp(1) := 'Priya';
v_emp(4) := 'Mani';

dbms_output.put_line(v_emp.last);
end;
/

-------------------------------------------------------------------------------
-- limit

declare
type emp_data is table of varchar2(20)
index by simple_integer;

v_emp emp_data;

begin
v_emp(1) := 'Priya';
v_emp(4) := 'Mani';

dbms_output.put_line(v_emp.limit);
end;
/

-------------------------------------------------------------------------------
-- exists(n)

declare
    type emp_data is table of varchar2(20)
    index by simple_integer;
    
    v_emp emp_data;

begin
    v_emp(1) := 'Priya';
    v_emp(3) := 'Mani';
    v_emp(5) := 'Utsav';
    v_emp(6) := 'Inbav';
    if v_emp.exists(6) = true then
    dbms_output.put_line('Index exixts');
    else
    dbms_output.put_line('Index not exixts');
    end if;
end;
/

-------------------------------------------------------------------------------
-- prior(n)

declare
    type emp_data is table of varchar2(20)
    index by simple_integer;
    
    v_emp emp_data;

begin
    v_emp(1) := 'Priya';
    v_emp(3) := 'Mani';
    v_emp(6) := 'Inbav';
    v_emp(5) := 'Utsav';
    
dbms_output.put_line(v_emp.prior(5));
end;
/

-------------------------------------------------------------------------------
-- next(n)

declare
    type emp_data is table of varchar2(20)
    index by simple_integer;
    
    v_emp emp_data;

begin
    v_emp(1) := 'Priya';
    v_emp(3) := 'Mani';
    v_emp(6) := 'Inbav';
    v_emp(5) := 'Utsav';
    
dbms_output.put_line(v_emp.next(5));
end;
/

-------------------------------------------------------------------------------
