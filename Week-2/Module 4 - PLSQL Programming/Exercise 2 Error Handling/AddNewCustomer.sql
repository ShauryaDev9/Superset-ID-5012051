-- AddNewCustomer.sql
CREATE OR REPLACE PROCEDURE AddNewCustomer (
  p_customer_id   IN NUMBER,
  p_name          IN VARCHAR2,
  p_date_of_birth IN DATE
) IS
  DUP_VAL_ON_INDEX EXCEPTION;
  PRAGMA EXCEPTION_INIT(DUP_VAL_ON_INDEX, -1); -- Unique constraint violation error

BEGIN
  -- Insert the new customer
  INSERT INTO customers (customer_id, name, date_of_birth)
  VALUES (p_customer_id, p_name, p_date_of_birth);

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Customer added successfully with ID ' || p_customer_id);

EXCEPTION
  WHEN DUP_VAL_ON_INDEX THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: Customer ID ' || p_customer_id || ' already exists.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END AddNewCustomer;
/
