USE Boost13Db;
GO

 

ALTER FUNCTION MaksimumUnsuzBolgeUzunlugu(@s NVARCHAR(MAX)) RETURNS INT
BEGIN
    SET @s = LOWER(@s);
    DECLARE @unluler NVARCHAR(8) = N'aeıioöuü';
    DECLARE @uz INT = 0;
    DECLARE @max INT = 0;
    DECLARE @i INT = 1;
    DECLARE @c NVARCHAR(1);

 

    WHILE @i <= LEN(@s)
    BEGIN
        SET @c = SUBSTRING(@s, @i, 1);

        IF CHARINDEX(@c, @unluler) = 0
        BEGIN
            SET @uz += 1;
            SET @max = IIF(@uz > @max, @uz, @max);
        END
        ELSE
        BEGIN
            SET @uz = 0;
        END

 

        SET @i += 1;
    END

 

    RETURN @max;
END

 

GO





USE Boost13Db;

GO

 

CREATE FUNCTION MaksimumUnsuzBolgeUzunlugu1(@s NVARCHAR(MAX)) RETURNS INT

BEGIN

    SET @s = LOWER(@s);

    DECLARE @unluler NVARCHAR(8) = N'aeıioöuü';

    DECLARE @uz INT = 0;

    DECLARE @max INT = 0;

    DECLARE @i INT = 0;

    DECLARE @c NVARCHAR(1);

 

    WHILE @i < LEN(@s)

    BEGIN

        SET @c = SUBSTRING(@s, @i, 1);


        IF CHARINDEX(@c, @unluler) = 0

        BEGIN

            SET @uz += 1;

            SET @max = IIF(@uz > @max, @uz, @max);

        END

        ELSE

        BEGIN

            SET @uz = 0;

        END

    END

 

    RETURN @max;

END

 

GO