CREATE TABLE empH (
EmpID INT PRIMARY KEY,
empName VARCHAR(40),
managerID INT
)

INSERT INTO empH VALUES
(1, 'A', NULL),
(2, 'B', 1),
(3, 'C', 1),
(4, 'D', 2),
(5, 'E', 3),
(6, 'F', 3),
(7, 'G', 4)

WITH employee_hierarchy AS (
  SELECT EmpID , empName, managerID, 1 as level
  FROM empH
  WHERE  managerID IS NULL
  UNION ALL
  SELECT e.EmpID, e.empName, e.managerID, eh.level + 1
  FROM empH e
  JOIN employee_hierarchy eh ON e.managerID = eh.EmpID   
)
SELECT EmpID, empName, 
(SELECT empName FROM empH WHERE EmpID=(
SELECT managerID FROM empH WHERE m.EmpID=EmpID)) AS managerName,
level
FROM employee_hierarchy m;
