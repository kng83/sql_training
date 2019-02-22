--==============
-- Create scalar-valued function template
--=========================================


IF OBJECT_ID (N'dbo.TakeFirstNonNull') IS NOT NULL
   DROP FUNCTION [dbo].[TakeFirstNonNull]
GO

CREATE FUNCTION TakeFirstNonNull(@Cell varchar(50), @LastNonNull varchar(50))
RETURNS varchar(50) as
Begin
    
	DECLARE @ret varchar(50); 
	DEClare @LastNonNul varchar(50); 
	 Set @ret = @Cell
     IF (@ret IS Not NULL)   
	 Begin
        SET @ret = @Cell
		SET @LastNonNull = @Cell
		RETURN @ret;  
	 End
	 ELSE
	 Begin
		SET @ret = @LastNonNull;
		RETURN @ret;  
	 End
    RETURN @ret;  
END


