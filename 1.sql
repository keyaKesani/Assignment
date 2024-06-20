--1.1 = extracting into a new string
DECLARE @str VARCHAR(MAX) = 'he110 w0r1d78usdg';
DECLARE @i INT = 1;
DECLARE @res VARCHAR(MAX) = '';
DECLARE @temp VARCHAR(10);
WHILE (@i <= LEN(@str))
BEGIN
	SET @temp = SUBSTRING(@str, @i, 1)
	IF (ISNUMERIC(@temp)) = 1
		SET @res = @res + @temp
	SET @i = @i + 1;
END
print @res

--1.2 = removing the non numeric characters in the same string

DECLARE @str VARCHAR(MAX) = 'he110 w0r1d78usdg';
DECLARE @s INT;
DECLARE @F INT;
WHILE(PATINDEX('%[^0-9]%',@str)<> 0)
BEGIN
	SET @s = PATINDEX('%[^0-9]%', @str)
	SET @f = PATINDEX('%[0-9]%', SUBSTRING(@str, @s, LEN(@str)))
	IF @f=0
		SET @str = STUFF(@str, @s, LEN(@str)-@s+1, '')
	ELSE
		SET @str =STUFF(@str, @s, @f-1, '')
END
print @str
