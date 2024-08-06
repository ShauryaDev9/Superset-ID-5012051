-- UpdateSalary.sql
CREATE OR REPLACE PROCEDURE UpdateSalary (
  p_employee_id IN NUMBER,
  p_percentage  IN NUMBER
) IS
  emp_not_found EXCEPTION;
  PRAGMA EXCEPTION_INIT(emp_not_found, -1403); -- No data found error

BEGIN
  -- Update the salary
  UPDATE employees
  SET salary = salary + (salary * p_percentage / 100)
  WHERE employee_id = p_employee_id;

  IF SQL%NOTFOUND THEN
    RAISE emp_not_found;
  END IF;

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Salary updated successfully for Employee ID ' || p_employee_id);

EXCEPTION
  WHEN emp_not_found THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: Employee ID ' || p_employee_id || ' does not exist.');
  WHEN OTHERS THEN
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateSalary;
/
