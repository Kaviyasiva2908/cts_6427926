
SET SERVEROUTPUT ON;

EXEC ProcessMonthlyInterest;

EXEC UpdateEmployeeBonus(1, 10);

EXEC TransferFunds(101, 102, 1000);
SELECT account_id, balance FROM accounts;
COMMIT;
EXEC TransferFunds(101, 102, 1000);
SELECT * FROM accounts WHERE account_id IN (101, 102);


