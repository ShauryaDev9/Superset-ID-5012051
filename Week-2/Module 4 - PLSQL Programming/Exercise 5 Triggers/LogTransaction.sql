-- LogTransaction.sql
CREATE TABLE AuditLog (
  LogID     NUMBER GENERATED ALWAYS AS IDENTITY,
  TransactionID NUMBER,
  TransactionType VARCHAR2(20),
  Amount NUMBER,
  LogTimestamp TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  INSERT INTO AuditLog (TransactionID, TransactionType, Amount)
  VALUES (:NEW.TransactionID, :NEW.TransactionType, :NEW.Amount);
END;
/

