BEGIN
  UpdateSalary(1, 15);  
END;
/

UPDATE accounts SET balance = 100000 WHERE account_id = 101;
COMMIT;

BEGIN
  SafeTransferFunds(101, 102, 1000);
END;
/


SELECT * FROM employees WHERE employee_id = 1;
