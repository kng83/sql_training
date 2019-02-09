
--Robimy blad i wychodzi nam dzielenie przez 0

Begin try
Select 1/0
Print 'No errors'
End try
BEGIN CATCH
Select 
	Error_Number() as ErrorNumber,
	Error_Message() as ErrorMessage,
	Error_Line() as ErrorLine,
	ERROR_PROCEDURE() as ErrorProcedure,
	ERROR_STATE() as ErrorState,
	ERROR_SEVERITY()as ErrorSeverity
END Catch;
