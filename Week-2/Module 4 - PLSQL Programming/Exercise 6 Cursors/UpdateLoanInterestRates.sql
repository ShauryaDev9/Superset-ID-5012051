-- UpdateLoanInterestRates.sql
DECLARE
  CURSOR c_loans IS
    SELECT LoanID, InterestRate
    FROM Loans;

  v_loan_id Loans.LoanID%TYPE;
  v_interest_rate Loans.InterestRate%TYPE;
  v_new_interest_rate CONSTANT NUMBER := 7.5; -- New interest rate policy
BEGIN
  FOR rec IN c_loans LOOP
    v_loan_id := rec.LoanID;
    v_interest_rate := rec.InterestRate;

    UPDATE Loans
    SET InterestRate = v_new_interest_rate
    WHERE LoanID = v_loan_id;

    DBMS_OUTPUT.PUT_LINE('Loan ID: ' || v_loan 
