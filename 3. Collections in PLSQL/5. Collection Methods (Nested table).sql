/* Collection Methods - Nested Table

1.  Count
2.  first
3.  last
4.  limit   (not applicable)
5.  exixts(n)
6.  prior(n)
7.  next(n)
8.  extend
9.  extend(n)
10. trim
11. trim(n)
12. delete
13. delete(n)*/
-------------------------------------------------------------------------------

-- count 

set serveroutput on;

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';

dbms_output.put_line(v_emp.count);
end;
/

-------------------------------------------------------------------------------

-- first

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';

dbms_output.put_line(v_emp.first);
end;
/

-------------------------------------------------------------------------------

-- last

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';

dbms_output.put_line(v_emp.last);
end;
/

-------------------------------------------------------------------------------

-- limit

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';

dbms_output.put_line(v_emp.limit);
end;
/

-------------------------------------------------------------------------------

-- exists(n)

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';
    
    if v_emp.exists(3)= true then
    dbms_output.put_line('Index exixts');
    else 
    dbms_output.put_line('Index not exixts');
    end if;
end;
/

-------------------------------------------------------------------------------

-- prior(n)

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';    
    
dbms_output.put_line(v_emp.prior(2));
end;
/

-------------------------------------------------------------------------------

-- next(n)

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';    
    
dbms_output.put_line(v_emp.next(1));
end;
/

-------------------------------------------------------------------------------

-- trim

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';    
    
dbms_output.put_line(v_emp.count);
dbms_output.put_line('Used trim method');
v_emp.trim;
dbms_output.put_line(v_emp.count);
end;
/

-------------------------------------------------------------------------------

-- trim(n)

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';    
    
dbms_output.put_line(v_emp.count);
dbms_output.put_line('Used trim(2) method');
v_emp.trim(2);
dbms_output.put_line(v_emp.count);
end;
/

-------------------------------------------------------------------------------

-- delete

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(2);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp.extend;
    v_emp(3) := 'Utsav';    
    
dbms_output.put_line('Before delete');
dbms_output.put_line(v_emp.count);
dbms_output.put_line('Aftere delete');
v_emp.delete;
dbms_output.put_line(v_emp.count);
end;
/

-------------------------------------------------------------------------------

-- delete(n)

declare
    type emp_data is table of varchar2(20);
    v_emp emp_data := emp_data();

begin
    v_emp.extend(6);
    v_emp(1) := 'Priya';
    v_emp(2) := 'Mani';
    v_emp(4) := 'Utsav'; 
    v_emp(6) := 'Inbav';
    
dbms_output.put_line('Before delete');
dbms_output.put_line(v_emp.count);
dbms_output.put_line('Aftere delete');
v_emp.delete(3);
dbms_output.put_line(v_emp.count);
end;
/