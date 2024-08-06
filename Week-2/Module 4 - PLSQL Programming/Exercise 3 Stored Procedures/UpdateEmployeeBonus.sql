-- UpdateEmployeeBonus.sql
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
  p_department_id IN NUMBER,
  p_bonus_percentage IN NUMBER
) IS
BEGIN
  UPDATE employees
  SET salary = salary + (salary * p_bonus_percentage / 100)
  WHERE department_id = p_department_id;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Employee bonuses updated for Department ID: ' || p_department_id);
EXCEPTION
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateEmployeeBonus;
/

