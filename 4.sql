CREATE TABLE CalTbl(
[Date] DATE PRIMARY KEY,
DayOfYear INT,
Week INT,
DayOfWeek INT,
Month INT,
DayOfMonth INT
)

DECLARE @year INT = 2017
DECLARE @date DATE = CONCAT(@year, '/01/01')
DECLARE @ctr INT = 1

WHILE (YEAR(@date)=@year)
BEGIN
	INSERT INTO CalTbl VALUES (
		@date,
		DATEPART(DAYOFYEAR, @date),
		DATEPART(WEEK, @date),
		DATEPART(WEEKDAY, @date),
		DATEPART(MONTH, @date),
		DATEPART(DAY, @date)
	)
	SET @date = DATEADD(d, 1, @date)
END


SELECT
	FORMAT([Date], 'd/M/yyyy') AS[Date],
	CONCAT(DayOfYear, ' - ', (SELECT MAX(DayOfYear) FROM CalTbl)) AS DayOfYear,
	CONCAT(Week, ' - ', (SELECT MAX(Week)FROM CalTbl)) AS Week,
	CONCAT(DayOfWeek, ' - 7') AS DayOfWeek,
	CONCAT(Month, ' - 12') AS Month,
	CONCAT(DayOfMonth, ' - ', (SELECT MAX(DayOfMonth) FROM CalTbl GROUP BY Month HAVING Month=c.Month)) AS DayOfMonth

FROM CalTbl c