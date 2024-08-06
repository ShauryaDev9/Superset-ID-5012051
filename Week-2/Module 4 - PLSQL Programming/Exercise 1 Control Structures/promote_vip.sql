-- promote_vip.sql
DECLARE
  CURSOR cur_customers IS
    SELECT customer_id, balance
    FROM customers;

BEGIN
  FOR rec IN cur_customers LOOP
    IF rec.balance > 10000 THEN
      UPDATE customers
      SET IsVIP = 'TRUE'
      WHERE customer_id = rec.customer_id;

      DBMS_OUTPUT.PUT_LINE('Customer ID ' || rec.customer_id || ' is now VIP.');
    END IF;
  END LOOP;
  
  COMMIT;
END;
/
