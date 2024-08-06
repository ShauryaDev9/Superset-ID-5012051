-- CalculateMonthlyInstallment.sql
CREATE OR REPLACE FUNCTION CalculateMonthlyInstallment (
  p_loan_amount   IN NUMBER,
  p_interest_rate IN NUMBER,
  p_duration_years IN NUMBER
) RETURN NUMBER IS
  v_monthly_rate NUMBER;
  v_installment  NUMBER;
  v_num_payments NUMBER;
BEGIN
  v_monthly_rate := p_interest_rate / 12 / 100;
  v_num_payments := p_duration_years * 12;
  
  IF v_monthly_rate = 0 THEN
    v_installment := p_loan_amount / v_num_payments;
  ELSE
    v_installment := p_loan_amount * v_monthly_rate / (1 - POWER((1 + v_monthly_rate), -v_num_payments));
  END IF;
  
  RETURN v_installment;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;  -- Return NULL if there is an error
END CalculateMonthlyInstallment;
/

