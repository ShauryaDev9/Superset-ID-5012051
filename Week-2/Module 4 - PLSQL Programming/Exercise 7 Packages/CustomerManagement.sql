-- CustomerManagement.sql
CREATE OR REPLACE PACKAGE CustomerManagement
IS
  PROCEDURE AddNewCustomer (
    p_name IN Customers.CustomerName%TYPE,
    p_address IN Customers.Address%TYPE,
    p_phone IN Customers.Phone%TYPE
  );

  PROCEDURE UpdateCustomerDetails (
    p_customer_id IN Customers.CustomerID%TYPE,
    p_name IN Customers.CustomerName%TYPE,
    p_address IN Customers.Address%TYPE,
    p_phone IN Customers.Phone%TYPE
  );

  FUNCTION GetCustomerBalance (
    p_customer_id IN Customers.CustomerID%TYPE
  ) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement
IS
  PROCEDURE AddNewCustomer (
    p_name IN Customers.CustomerName%TYPE,
    p_address IN Customers.Address%TYPE,
    p_phone IN Customers.Phone%TYPE
  )
  IS
  BEGIN
    INSERT INTO Customers (CustomerName, Address, Phone)
    VALUES (p_name, p_address, p_phone);
  END AddNewCustomer;

  PROCEDURE UpdateCustomerDetails (
    p_customer_id IN Customers.CustomerID%TYPE,
    p_name IN Customers.CustomerName%TYPE,
    p_address IN Customers.Address%TYPE,
    p_phone IN Customers.Phone%TYPE
  )
  IS
  BEGIN
    UPDATE Customers
    SET CustomerName = p_name,
        Address = p_address,
        Phone = p_phone
    WHERE CustomerID = p_customer_id;
  END UpdateCustomerDetails;

  FUNCTION GetCustomerBalance (
    p_customer_id IN Customers.CustomerID%TYPE
  ) RETURN NUMBER
  IS
    v_total_balance NUMBER;
  BEGIN
    SELECT SUM(a.Balance) INTO v_total_balance
    FROM Accounts a
    WHERE a.CustomerID = p_customer_id;
    RETURN v_total_balance;
  END GetCustomerBalance;
END CustomerManagement;
/
