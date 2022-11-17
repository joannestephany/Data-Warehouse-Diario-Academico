GO
CREATE OR ALTER PROCEDURE ETL_STAGING_TO_DW_DISCIPLINA
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ID_DISCIPLINA INT, @NUM_TURMAS INT

	DECLARE C_DISCIPLINA CURSOR
		FOR SELECT D.ID_DISCIPLINA,D.COD_DISCIPLINA, D.NOME_DISCIPLINA, D.NUM_TURMAS FROM AUX_DISCIPLINA D

	OPEN C_DISCIPLINA
	FETCH C_DISCIPLINA INTO @ID_DISCIPLINA, @COD_DISCIPLINA, @NOME_DISCIPLINA, @NUM_TURMAS
	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- VERIFICA SE O DISCIPLINA NAO EXISTE NO DW
		IF NOT EXISTS (SELECT * FROM DIM_DISCIPLINA D WHERE D.COD = @ID_TURMA )
		BEGIN
			INSERT INTO DIM_DISCIPLINA(COD, COD_DISCIPLINA, NOME_DISCIPLINA, NUM_TURMAS)
			VALUES( @ID_DISCIPLINA, @COD_DISCIPLINA, @NOME_DISCIPLINA, @NUM_TURMAS)
		END
		-- SE O DISCIPLINA JA EXISTE NO DW ELE ATUALIZA
		ELSE
		BEGIN
			UPDATE DIM_DISCIPLINA
			SET NUM_TURMAS = @NUM_TURMAS
			WHERE COD = @ID_DISCIPLINA
		END
		FETCH C_DISCIPLINA INTO @ID_DISCIPLINA, @NUM_TURMAS
	END
	CLOSE C_DISCIPLINA
	DEALLOCATE C_DISCIPLINA
END
GO