-- send_reminders.sql
DECLARE
  CURSOR cur_loans IS
    SELECT l.loan_id, l.customer_id, c.email
    FROM loans l
    JOIN customers c ON l.customer_id = c.customer_id
    WHERE l.due_date BETWEEN SYSDATE AND SYSDATE + 30;

BEGIN
  FOR rec IN cur_loans LOOP
    DBMS_OUTPUT.PUT_LINE('Reminder: Loan ID ' || rec.loan_id || 
                         ' for Customer ID ' || rec.customer_id ||
                         ' is due within the next 30 days. Email: ' || rec.email);
                         
    -- Additional logic for sending email can be added here
  END LOOP;
END;
/
