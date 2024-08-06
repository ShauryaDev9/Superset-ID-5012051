-- ProcessMonthlyInterest.sql
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
  v_interest_rate CONSTANT NUMBER := 0.01; -- 1% interest rate
BEGIN
  FOR rec IN (SELECT account_id, balance FROM accounts WHERE account_type = 'savings') LOOP
    UPDATE accounts
    SET balance = balance + (balance * v_interest_rate)
    WHERE account_id = rec.account_id;

    DBMS_OUTPUT.PUT_LINE('Processed interest for Account ID: ' || rec.account_id);
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Monthly interest processed for all savings accounts.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END ProcessMonthlyInterest;
/
