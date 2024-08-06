-- CheckTransactionRules.sql
CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
  v_balance NUMBER;
BEGIN
  -- Check if the withdrawal amount does not exceed the account balance
  SELECT balance INTO v_balance
  FROM accounts
  WHERE account_id = :NEW.AccountID
  FOR UPDATE;

  IF :NEW.TransactionType = 'Withdrawal' AND :NEW.Amount > v_balance THEN
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient funds for withdrawal.');
  END IF;

  -- Check if the deposit amount is positive
  IF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Deposit amount must be positive.');
  END IF;
END;
/

