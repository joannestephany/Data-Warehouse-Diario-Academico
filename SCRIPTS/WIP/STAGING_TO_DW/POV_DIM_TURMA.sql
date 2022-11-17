GO
CREATE OR ALTER PROCEDURE ETL_STAGING_TO_DW_TURMA
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ID_TURMA INT, @NUM_ALUNOS INT

	DECLARE C_TURMA CURSOR
		FOR SELECT TM.ID_TURMA, TM.NUM_ALUNOS FROM AUX_TURMA TM

	OPEN C_TURMA
	FETCH C_TURMA INTO @ID_TURMA, @NUM_ALUNOS

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- VERIFICA SE O TURMA NAO EXISTE NO DW
		IF NOT EXISTS (SELECT * FROM DIM_TURMA TM WHERE TM.COD = @ID_TURMA )
		BEGIN
			INSERT INTO DIM_TURMA(COD, NUM_ALUNOS)
			VALUES(@ID_TURMA, @NUM_ALUNOS)
		END
		-- SE O TURMA JA EXISTE NO DW ELE ATUALIZA
		ELSE
		BEGIN
			UPDATE DIM_TURMA
			SET NUM_ALUNOS = @NUM_ALUNOS
			WHERE COD = @ID_TURMA 
		END
		FETCH C_TURMA INTO @ID_TURMA, @NUM_ALUNOS
	END
	CLOSE C_TURMA
	DEALLOCATE C_TURMA
END
GO