/*  Sub Programs  -- 2 Types
        
        1. Procedures
        2. Functions
        

1. Procedures  
      - Named PLSQL block 
      - Performs a specific task / set of instructions
      - Manipulates data in the database

PROCEDURE SPECIFICATION
 CREATE  - stores the data as schema object
 REPLACE - Overwrites the code in the stored object in the database
 Parameters - Optional
 
PROCEDURE BODY
 IS/AS   - Similar to DECLARE block in anonymous block
    declare block;
 BEGIN
    excecutable code;
  EXCEPTION
 END:
 /
 */
--------------------------------------------------------------------------------
create or replace procedure pr_demo    -- parameters is not given here since it is optional
as

Begin
dbms_output.put_line('Happy Learning');
end;
/
--------------------------------------------------------------------------------
begin
pr_demo;
end;
/
--------------------------------------------------------------------------------