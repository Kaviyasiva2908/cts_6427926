SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE UpdateSalary (
  p_emp_id IN NUMBER,
  p_percent IN NUMBER
) IS
BEGIN
  UPDATE employees
  SET salary = salary + (salary * p_percent / 100)
  WHERE employee_id = p_emp_id;

  IF SQL%ROWCOUNT = 0 THEN
    DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || p_emp_id || ' not found.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Salary updated for employee ID ' || p_emp_id);
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('UpdateSalary failed: ' || SQLERRM);
END;
/
