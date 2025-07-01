SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE SafeTransferFunds (
  p_from_account IN NUMBER,
  p_to_account IN NUMBER,
  p_amount IN NUMBER
) IS
  v_balance NUMBER;
BEGIN
  -- Start transaction explicitly
  SAVEPOINT before_transfer;

  -- Get balance
  SELECT balance INTO v_balance
  FROM accounts
  WHERE account_id = p_from_account;

  IF v_balance < p_amount THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds in account ' || p_from_account);
  END IF;

  -- Deduct and Add
  UPDATE accounts SET balance = balance - p_amount WHERE account_id = p_from_account;
  UPDATE accounts SET balance = balance + p_amount WHERE account_id = p_to_account;

  COMMIT;

  DBMS_OUTPUT.PUT_LINE('Transfer of ' || p_amount || ' completed from account ' || p_from_account || ' to account ' || p_to_account);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    ROLLBACK TO before_transfer;
    DBMS_OUTPUT.PUT_LINE('Error: One or both account IDs not found.');
  WHEN OTHERS THEN
    ROLLBACK TO before_transfer;
    DBMS_OUTPUT.PUT_LINE('Transfer failed: ' || SQLERRM);
END;
/
