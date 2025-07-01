SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account IN NUMBER,
  p_to_account IN NUMBER,
  p_amount IN NUMBER
) IS
  insufficient_balance EXCEPTION;
  v_balance NUMBER;
BEGIN
  -- Check balance in source account
  SELECT balance INTO v_balance FROM accounts WHERE account_id = p_from_account;

  IF v_balance < p_amount THEN
    RAISE insufficient_balance;
  END IF;

  -- Deduct from source
  UPDATE accounts
  SET balance = balance - p_amount
  WHERE account_id = p_from_account;

  -- Add to destination
  UPDATE accounts
  SET balance = balance + p_amount
  WHERE account_id = p_to_account;

  DBMS_OUTPUT.PUT_LINE('Transfer of ' || p_amount || ' completed from account ' || p_from_account || ' to account ' || p_to_account);

EXCEPTION
  WHEN insufficient_balance THEN
    DBMS_OUTPUT.PUT_LINE('Error: Insufficient balance in source account.');
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error: One or both account IDs not found.');
END;
/
