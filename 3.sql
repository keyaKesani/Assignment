CREATE TABLE err(
ID INT PRIMARY KEY,
col1 INT,
col2 INT,
errCol AS 1/0
)
INSERT INTO err (ID, col1, col2) VALUES (1, 2, 3)
SELECT * FROM err
SELECT col1 FROM err