-- ApplyAnnualFee.sql
DECLARE
  CURSOR c_accounts IS
    SELECT AccountID, Balance
    FROM Accounts;

  v_account_id Accounts.AccountID%TYPE;
  v_balance Accounts.Balance%TYPE;
  v_annual_fee CONSTANT NUMBER := 50; -- Annual maintenance fee
BEGIN
  FOR rec IN c_accounts LOOP
    v_account_id := rec.AccountID;
    v_balance := rec.Balance;

    UPDATE Accounts
    SET Balance = Balance - v_annual_fee
    WHERE AccountID = v_account_id;

    DBMS_OUTPUT.PUT_LINE('Annual fee of $' || v_annual_fee || ' deducted from Account ID: ' || v_account_id);
  END LOOP;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Annual fees applied to all accounts.');
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/

