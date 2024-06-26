DECLARE @D INT = 16
DECLARE @M INT = 1
DECLARE @Y INT = 2004


SELECT TRY_CAST(CONCAT(@M, '-', @D, '-', @Y) AS date) AS DateOfBirth,
TRY_CAST(GETDATE() AS date) AS Today,
DATEDIFF(YEAR, TRY_CAST(CONCAT(@M, '-', @D, '-', @Y) AS date), GETDATE()) AS Age
