SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
  UPDATE accounts
  SET balance = balance + (balance * 0.01)
  WHERE LOWER(account_type) = 'savings';

  DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');
END;
/
