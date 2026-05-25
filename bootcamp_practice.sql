-- STEP 1: CREATE TABLES
CREATE TABLE EmployeeDemographics (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(50)
);

CREATE TABLE EmployeeSalary (
    EmployeeID INT,
    JobTitle VARCHAR(50),
    Salary INT
);

-- STEP 2: INSERT DATA
INSERT INTO EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beesly', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male');

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000);

-- STEP 3: RUN THE ANALYSIS
SELECT 
    demo.EmployeeID,
    demo.FirstName,
    demo.LastName,
    sal.JobTitle,
    sal.Salary,
    CASE 
        WHEN sal.Salary > 50000 THEN 'High Earner'
        WHEN sal.Salary BETWEEN 40000 AND 50000 THEN 'Mid-Level'
        ELSE 'Entry Level'
    END AS SalaryTier
FROM EmployeeDemographics demo
INNER JOIN EmployeeSalary sal
    ON demo.EmployeeID = sal.EmployeeID
WHERE demo.Age >= 30
ORDER BY sal.Salary DESC;
