-- EmployeeManagement.sql
CREATE OR REPLACE PACKAGE EmployeeManagement
IS
  PROCEDURE HireNewEmployee (
    p_name IN Employees.EmployeeName%TYPE,
    p_department IN Employees.Department%TYPE,
    p_salary IN Employees.Salary%TYPE
  );

  PROCEDURE UpdateEmployeeDetails (
    p_employee_id IN Employees.EmployeeID%TYPE,
    p_name IN Employees.EmployeeName%TYPE,
    p_department IN Employees.Department%TYPE,
    p_salary IN Employees.Salary%TYPE
  );

  FUNCTION CalculateAnnualSalary (
    p_employee_id IN Employees.EmployeeID%TYPE
  ) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement
IS
  PROCEDURE HireNewEmployee (
    p_name IN Employees.EmployeeName%TYPE,
    p_department IN Employees.Department%TYPE,
    p_salary IN Employees.Salary%TYPE
  )
  IS
  BEGIN
    INSERT INTO Employees (EmployeeName, Department, Salary)
    VALUES (p_name, p_department, p_salary);
  END HireNewEmployee;

  PROCEDURE UpdateEmployeeDetails (
    p_employee_id IN Employees.EmployeeID%TYPE,
    p_name IN Employees.EmployeeName%TYPE,
    p_department IN Employees.Department%TYPE,
    p_salary IN Employees.Salary%TYPE
  )
  IS
  BEGIN
    UPDATE Employees
    SET EmployeeName = p_name,
        Department = p_department,
        Salary = p_salary
    WHERE EmployeeID = 
