SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE AddNewCustomer (
  p_customer_id IN NUMBER,
  p_name IN VARCHAR2,
  p_age IN NUMBER,
  p_balance IN NUMBER,
  p_isVIP IN VARCHAR2
) IS
BEGIN
  INSERT INTO customers (customer_id, name, age, balance, isVIP)
  VALUES (p_customer_id, p_name, p_age, p_balance, p_isVIP);

  DBMS_OUTPUT.PUT_LINE('Customer ' || p_name || ' added successfully.');

EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    DBMS_OUTPUT.PUT_LINE('Error: Customer ID ' || p_customer_id || ' already exists.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('AddNewCustomer failed: ' || SQLERRM);
END;
/
