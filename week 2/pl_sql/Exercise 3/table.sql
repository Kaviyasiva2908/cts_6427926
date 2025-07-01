SET SERVEROUTPUT ON;

CREATE TABLE accounts (
  account_id NUMBER PRIMARY KEY,
  customer_id NUMBER,
  account_type VARCHAR2(20), 
  balance NUMBER
);


CREATE TABLE employees (
  employee_id NUMBER PRIMARY KEY,
  name VARCHAR2(50),
  department_id NUMBER,
  salary NUMBER
);

CREATE TABLE departments (
  department_id NUMBER PRIMARY KEY,
  name VARCHAR2(50)
);