-- GenerateMonthlyStatements.sql
DECLARE
  CURSOR c_transactions IS
    SELECT c.CustomerName, t.TransactionID, t.TransactionType, t.Amount, t.TransactionDate
    FROM Transactions t
    JOIN Accounts a ON t.AccountID = a.AccountID
    JOIN Customers c ON a.CustomerID = c.CustomerID
    WHERE t.TransactionDate BETWEEN TRUNC(SYSDATE, 'MM') AND LAST_DAY(SYSDATE);

  v_customer_name Customers.CustomerName%TYPE;
  v_transaction_id Transactions.TransactionID%TYPE;
  v_transaction_type Transactions.TransactionType%TYPE;
  v_amount Transactions.Amount%TYPE;
  v_transaction_date Transactions.TransactionDate%TYPE;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Monthly Statements:');
  DBMS_OUTPUT.PUT_LINE('-----------------');

  FOR rec IN c_transactions LOOP
    IF v_customer_name <> rec.CustomerName THEN
      IF v_customer_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('---------------------------');
      END IF;
      DBMS_OUTPUT.PUT_LINE('Customer: ' || rec.CustomerName);
      v_customer_name := rec.CustomerName;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Transaction ID: ' || rec.TransactionID);
    DBMS_OUTPUT.PUT_LINE('Transaction Type: ' || rec.TransactionType);
    DBMS_OUTPUT.PUT_LINE('Amount: ' || rec.Amount);
    DBMS_OUTPUT.PUT_LINE('Transaction Date: ' || TO_CHAR(rec.TransactionDate, 'DD-MON-YYYY'));
    DBMS_OUTPUT.PUT_LINE('---------------------------');
  END LOOP;
END;
/
