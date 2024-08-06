-- apply_discount.sql
DECLARE
  CURSOR cur_customers IS
    SELECT customer_id, loan_interest_rate
    FROM customers
    WHERE FLOOR(MONTHS_BETWEEN(SYSDATE, date_of_birth) / 12) > 60 
      AND loan_interest_rate IS NOT NULL;

  v_discounted_rate NUMBER;
BEGIN
  FOR rec IN cur_customers LOOP
    v_discounted_rate := rec.loan_interest_rate - 1;

    UPDATE customers
    SET loan_interest_rate = v_discounted_rate
    WHERE customer_id = rec.customer_id;

    DBMS_OUTPUT.PUT_LINE('Customer ID ' || rec.customer_id || 
                         ' new interest rate: ' || v_discounted_rate);
  END LOOP;
  
  COMMIT;
END;
/
