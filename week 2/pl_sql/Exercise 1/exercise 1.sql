SET SERVEROUTPUT ON;
-- Scenario 1: Apply 1% discount for customers above 60
BEGIN
  FOR cust IN (SELECT customer_id FROM customers WHERE age > 60) LOOP
    UPDATE loans
    SET interest_rate = interest_rate - 1
    WHERE customer_id = cust.customer_id;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Interest discount applied for customers above 60.');
END;
/

-- Scenario 2: Promote customers with balance > 10000 to VIP
BEGIN
  FOR cust IN (SELECT customer_id FROM customers WHERE balance > 10000) LOOP
    UPDATE customers
    SET isVIP = 'TRUE'
    WHERE customer_id = cust.customer_id;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('VIP status updated for high balance customers.');
END;
/

-- Scenario 3: Remind customers with loans due in next 30 days
DECLARE
  CURSOR due_loans IS
    SELECT l.loan_id, l.customer_id, c.name, l.due_date
    FROM loans l
    JOIN customers c ON l.customer_id = c.customer_id
    WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30;
BEGIN
  FOR loan_rec IN due_loans LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || loan_rec.loan_id ||
                         ' for customer ' || loan_rec.name ||
                         ' is due on ' || TO_CHAR(loan_rec.due_date, 'DD-MON-YYYY'));
  END LOOP;
END;
/
SELECT name, isVIP FROM customers;
-- Check updated interest rates
SELECT c.name, l.interest_rate
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id;

-- Check due dates
SELECT c.name, l.due_date
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id;
