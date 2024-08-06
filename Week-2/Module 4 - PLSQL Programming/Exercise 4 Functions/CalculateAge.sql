-- CalculateAge.sql
CREATE OR REPLACE FUNCTION CalculateAge (
  p_date_of_birth DATE
) RETURN NUMBER IS
  v_age NUMBER;
BEGIN
  v_age := FLOOR(MONTHS_BETWEEN(SYSDATE, p_date_of_birth) / 12);
  RETURN v_age;
EXCEPTION
  WHEN OTHERS THEN
    RETURN NULL;  -- Return NULL if there is an error
END CalculateAge;
/

