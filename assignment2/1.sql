use Assign
-- create the tables

CREATE TABLE employees(
employee_id INT IDENTITY(1, 1) PRIMARY KEY,
employee_name VARCHAR(50) NOT NULL,
department_id INT FOREIGN KEY REFERENCES departments(department_id),
hire_date date NOT NULL
)
CREATE TABLE departments (
  department_id INT IDENTITY(100, 1)PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL
);

CREATE TABLE salaries (
  employee_id INT NOT NULL,
  salary_amount DECIMAL(10,2) NOT NULL,
  salary_date DATE NOT NULL,
  PRIMARY KEY (employee_id, salary_date),  
  FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


-- populate the tables

INSERT INTO departments (department_name)VALUES 
('Marketing'), 
('Sales'), 
('Finance'),
('HR'),
('IT');

INSERT INTO employees (employee_name, department_id, hire_date)
VALUES ('Esme Wilson', 100, '2023-01-01'),
       ('Jane Smith', 102, '2022-06-15'),
       ('Daniel Acosta', 103, '2024-04-12'),
	   ('Anahi Delacruz', 103, '2022-12-02'),
	   ('Mae West', 103, '2021-04-12'),
	   ('Sarah Estrada', 103, '2022-10-22'),
	   ('Chanel Newman', 103, '2023-09-15'),
	   ('Darwin Knapp', 103, '2021-04-18'),
	   ('Diego Phelps', 103, '2020-02-22');


INSERT INTO salaries (employee_id, salary_amount, salary_date)
VALUES (1, 75000.00, '2024-06-25'),
       (2, 82000.50, '2024-06-25'),
       (3, 68500.25, '2024-06-25'),
       (1, 80000.75, '2024-05-15'),
       (2, 84000.10, '2024-04-01'),
       (3, 72000.00, '2024-11-12'),
       (4, 65000.50, '2024-06-25'),
       (4, 70000.25, '2024-02-29'),
       (5, 88000.90, '2024-06-25'),
       (5, 92000.00, '2024-01-01'),
       (6, 78000.75, '2024-06-25'),
       (6, 81000.50, '2023-12-31'),
       (7, 90000.25, '2024-06-25'),
       (7, 95000.00, '2023-11-20'),
       (8, 85000.75, '2024-06-25'),
       (8, 89000.50, '2023-10-15'),
       (9, 75000.25, '2024-06-25'),
       (9, 79000.00, '2023-09-01');

-- solution Query

SELECT e.employee_name, d.department_name, s.salary_amount
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
INNER JOIN salaries AS s ON e.employee_id = s.employee_id
WHERE s.salary_date = ( 
  SELECT MAX(salary_date)
  FROM salaries AS inner_salaries
  WHERE inner_salaries.employee_id = s.employee_id
);