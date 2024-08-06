-- TransferFunds.sql
CREATE OR REPLACE PROCEDURE TransferFunds (
  p_from_account_id IN NUMBER,
  p_to_account_id   IN NUMBER,
  p_amount          IN NUMBER
) IS
  INSUFFICIENT_FUNDS EXCEPTION;

  v_from_balance NUMBER;
  v_to_balance   NUMBER;

BEGIN
  -- Fetch the balances of both accounts
  SELECT balance INTO v_from_balance
  FROM accounts
  WHERE account_id = p_from_account_id
  FOR UPDATE;

  SELECT balance INTO v_to_balance
  FROM accounts
  WHERE account_id = p_to_account_id
  FOR UPDATE;

  -- Check if there are sufficient funds
  IF v_from_balance < p_amount THEN
    RAISE INSUFFICIENT_FUNDS;
  END IF;

  -- Perform the transfer
  UPDATE accounts
  SET balance = balance - p_amount
  WHERE account_id = p_from_account_id;

  UPDATE accounts
  SET balance = balance + p_amount
  WHERE account_id = p_to_account_id;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Transfer completed successfully.');

EXCEPTION
  WHEN INSUFFICIENT_FUNDS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END TransferFunds;
/
