---- AMBIENRE OPERACINAL PARA STAGING

GO
CREATE OR ALTER PROCEDURE ETL_OLTP_TO_STAGING_PROFESSOR(@DATA_CARGA DATETIME)
AS
BEGIN
	DELETE AUX_PROFESSOR WHERE DATACARGA = @DATA_CARGA

	INSERT INTO AUX_TURMA(DATACARGA,ID_PROFESSOR,MATRICULA_PROFESSOR,NOME_PROFESSOR)
	SELECT @DATA_CARGA, P.ID_PROFESSOR, P.MATRICULA_PROFESSOR, P.NOME_PROFESSOR FROM TB_PROFESSOR P 
END
GO
