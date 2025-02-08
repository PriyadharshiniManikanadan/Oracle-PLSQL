/* Multiset Operators  -> between 2 Nested tables / 2 collections / 2 variables containing values or array of values

4 types */
-------------------------------------------------------------------------------

-- 1. Multiset UNION 

set serveroutput on;
declare
    type emp_data is table of number;           -- Nested table
    v_emp emp_data := emp_data(1,2,3,4,5,6);    -- Creating 2 variables containing array of values
    v_emp1 emp_data := emp_data(4,5,6,7,8,9);
    v_emp2 emp_data;

begin
    v_emp2 := v_emp multiset union v_emp1; 
    
    dbms_output.put_line('Multiset union: ');
    for i in v_emp2.first..v_emp2.last
    loop
    dbms_output.put_line(v_emp2(i));
    end loop;
end;
/

-------------------------------------------------------------------------------

-- 1. Multiset UNION distinct

declare
    type emp_data is table of number;           -- Nested table
    v_emp emp_data := emp_data(1,2,3,4,5,6);    -- Creating 2 variables containing array of values
    v_emp1 emp_data := emp_data(4,5,6,7,8,9);
    v_emp2 emp_data;

begin
    v_emp2 := v_emp multiset union distinct v_emp1; 
    
    dbms_output.put_line('Multiset union distinct: ');
    for i in v_emp2.first..v_emp2.last
    loop
    dbms_output.put_line(v_emp2(i));
    end loop;
end;
/

-------------------------------------------------------------------------------

-- 1. Multiset Intersect

declare
    type emp_data is table of number;           -- Nested table
    v_emp emp_data := emp_data(1,2,3,4,5,6);    -- Creating 2 variables containing array of values
    v_emp1 emp_data := emp_data(4,5,6,7,8,9);
    v_emp2 emp_data;

begin
    v_emp2 := v_emp multiset intersect v_emp1; 
    
    dbms_output.put_line('Multiset Intersect: ');
    for i in v_emp2.first..v_emp2.last
    loop
    dbms_output.put_line(v_emp2(i));
    end loop;
end;
/

-------------------------------------------------------------------------------

-- 1. Multiset Except

declare
    type emp_data is table of number;           -- Nested table
    v_emp emp_data := emp_data(1,2,3,4,5,6);    -- Creating 2 variables containing array of values
    v_emp1 emp_data := emp_data(4,5,6,7,8,9);
    v_emp2 emp_data;

begin
    v_emp2 := v_emp multiset except v_emp1;     -- (A - B)
    
    dbms_output.put_line('Multiset Except: A - B ');
    for i in v_emp2.first..v_emp2.last
    loop
    dbms_output.put_line(v_emp2(i));
    end loop;
end;
/
-------------------------------------------------------------------------------
-- 1. Multiset Except

declare
    type emp_data is table of number;           -- Nested table
    v_emp emp_data := emp_data(1,2,3,4,5,6);    -- Creating 2 variables containing array of values
    v_emp1 emp_data := emp_data(4,5,6,7,8,9);
    v_emp2 emp_data;

begin
    v_emp2 := v_emp1 multiset except v_emp;     -- (B - A)
    
    dbms_output.put_line('Multiset Except: B - A');
    for i in v_emp2.first..v_emp2.last
    loop
    dbms_output.put_line(v_emp2(i));
    end loop;
end;
/



