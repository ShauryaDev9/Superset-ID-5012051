-- HasSufficientBalance.sql
CREATE OR REPLACE FUNCTION HasSufficientBalance (
  p_account_id IN NUMBER,
  p_amount     IN NUMBER
) RETURN BOOLEAN IS
  v_balance NUMBER;
BEGIN
  SELECT balance INTO v_balance
  FROM accounts
  WHERE account_id = p_account_id;
  
  RETURN v_balance >= p_amount;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN FALSE;  -- Return FALSE if account ID does not exist
  WHEN OTHERS THEN
    RETURN FALSE;  -- Return FALSE if there is any other error
END HasSufficientBalance;
/

