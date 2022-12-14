-- AMBIENRE STAGING PARA DW
-- PARA DISCIPLINA
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
-- PARA PROFESSOR
GO
CREATE OR ALTER PROCEDURE ETL_STAGING_TO_DW_PROFESSOR
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ID_TURNO INT, 
			@MATRICULA_PROFESSOR VARCHAR(12),
			@NOME_PROFESSOR VARCHAR(50)

	DECLARE C_PROFESSOR CURSOR
		FOR SELECT P.ID_PROFESSOR, P.MATRICULA_PROFESSOR, P.NOME_PROFESSOR FROM AUX_PROFESSOR P

	OPEN C_PROFESSOR
	FETCH C_PROFESSOR INTO @ID_PROFESSOR, @MATRICULA_PROFESSOR, @NOME_PROFESSOR

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- VERIFICA SE O PROFESSOR NAO EXISTE NO DW
		IF NOT EXISTS (SELECT * FROM DIM_PROFESSOR P WHERE P.COD = @ID_PROFESSOR )
		BEGIN
			INSERT INTO DIM_PROFESSOR(COD, MATRICULA_PROFESSOR,NOME_PROFESSOR)
			VALUES(@ID_PROFESSOR, @MATRICULA_PROFESSOR, @NOME_PROFESSOR)
		END
		
		FETCH C_PROFESSOR INTO @ID_PROFESSOR, @MATRICULA_PROFESSOR, @NOME_PROFESSOR
	END
	CLOSE C_PROFESSOR
	DEALLOCATE C_PROFESSOR
END
GO
-- PARA TURMA
GO
CREATE OR ALTER PROCEDURE ETL_STAGING_TO_DW_TURMA
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ID_TURMA INT, @NUM_ALUNOS INT, @NOME_TURMA VARCHAR(10)

	DECLARE C_TURMA CURSOR
		FOR SELECT TM.ID_TURMA, TM.NUM_ALUNOS FROM AUX_TURMA TM

	OPEN C_TURMA
	FETCH C_TURMA INTO @ID_TURMA, @NUM_ALUNOS, @NOME_TURMA

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- VERIFICA SE O TURMA NAO EXISTE NO DW
		IF NOT EXISTS (SELECT * FROM DIM_TURMA TM WHERE TM.COD = @ID_TURMA )
		BEGIN
			INSERT INTO DIM_TURMA(COD, NUM_ALUNOS, NOME_TURMA)
			VALUES(@ID_TURMA, @NUM_ALUNOS,@NOME_TURMA)
		END
		-- SE O TURMA JA EXISTE NO DW ELE ATUALIZA
		ELSE
		BEGIN
			UPDATE DIM_TURMA
			SET NUM_ALUNOS = @NUM_ALUNOS
			WHERE COD = @ID_TURMA 
		END
		FETCH C_TURMA INTO @ID_TURMA, @NUM_ALUNOS, @NOME_TURMA
	END
	CLOSE C_TURMA
	DEALLOCATE C_TURMA
END
GO
-- PARA TURNO
GO
CREATE OR ALTER PROCEDURE ETL_STAGING_TO_DW_TURNO
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ID_TURNO INT, @NOME_TURNO VARCHAR(50)

	DECLARE C_TURNO CURSOR
		FOR SELECT T.ID_TURNO, T.NOME_TURNO FROM AUX_TURNO T

	OPEN C_TURNO
	FETCH C_TURNO INTO @ID_TURNO, @NOME_TURNO

	WHILE @@FETCH_STATUS = 0
	BEGIN
		-- VERIFICA SE O TURNO NAO EXISTE NO DW
		IF NOT EXISTS (SELECT * FROM DIM_TURNO T WHERE T.COD = @ID_TURNO )
		BEGIN
			INSERT INTO DIM_TURNO(COD, NOME_TURNO)
			VALUES(@ID_TURNO, @NOME_TURNO)
		END
		-- SE O TURNO JA EXISTE NO DW ELE ATUALIZA
		ELSE
		BEGIN
			UPDATE DIM_TURNO
			SET NOME_TURNO = @NOME_TURNO
			WHERE COD = @ID_TURNO 
		END
		FETCH C_TURNO INTO @ID_TURNO, @NOME_TURNO
	END
	CLOSE C_TURNO
	DEALLOCATE C_TURNO
END
GO
-- PARA FATO
GO
CREATE OR ALTER PROCEDURE ETL_STAGING_TO_DW_FATO
AS
BEGIN
    DECLARE @ID_TEMPO INT, -- ID QUE DAQUI DA DW
            @ID_DISCIPLINA INT, 
            @ID_PROFESSOR INT,
            @ID_TURMA INT,
            @ID_TURNO INT,
            @COD_TEMPO INT, -- ID QUE VEM DA STAGING
            @COD_DISCIPLINA INT, 
            @COD_PROFESSOR INT,
            @COD_TURMA INT,
            @COD_TURNO INT,
            @NUM_APROVADOS INT,
            @NUM_REPROVADOS INT,
            @NUM_TRANCADOS INT,
            @ANO INT,
            @SEMESTRE INT

    DECLARE CURSOR_FATO CURSOR FOR
    SELECT COD_TEMPO, COD_DISCIPLINA, COD_PROFESSOR, COD_TURMA, COD_TURNO, NUM_APROVADOS, NUM_REPROVADOS, NUM_TRANCADOS
    FROM AUX_FATO F

	OPEN CURSOR_FATO
	FETCH CURSOR_FATO INTO @COD_TEMPO, @COD_DISCIPLINA, @COD_PROFESSOR, @COD_TURMA, @COD_TURNO, @NUM_APROVADOS, @NUM_REPROVADOS, @NUM_TRANCADOS
	
    WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @ID_DISCIPLINA = (SELECT ID_DISCIPLINA FROM DIM_DISCIPLINA D WHERE D.ID_DISCIPLINA = @COD_DISCIPLINA)
		SET @ID_PROFESSOR = (SELECT ID_PROFESSOR FROM DIM_PROFESSOR P WHERE P.ID_PROFESSOR = @COD_PROFESSOR)
		SET @ID_TURMA = (SELECT ID_TURMA FROM DIM_TURMA TM WHERE TM.ID_TURMA = @COD_TURMA)
		SET @ID_TURNO = (SELECT ID_TURNO FROM DIM_TURNO TN WHERE TN.ID_TURNO = @COD_TURNO)
        SET @ID_TEMPO = (SELECT ANO, SEMESTRE FROM DIM_TEMPO T WHERE T.ANO = @ANO AND T.SEMESTRE = @SEMESTRE)
		
		INSERT INTO FATO_DIARIO_ACADEMICO(ID_TEMPO, ID_DISCIPLINA, ID_PROFESSOR, ID_TURMA, ID_TURNO, NUM_APROVADOS, NUM_REPROVADOS, NUM_TRANCADOS)
		VALUES(@ID_TEMPO, @ID_DISCIPLINA, @ID_PROFESSOR, @ID_TURMA, @ID_TURNO, @NUM_APROVADOS, @NUM_REPROVADOS, @NUM_TRANCADOS)

		FETCH CURSOR_FATO INTO @COD_TEMPO, @COD_DISCIPLINA, @COD_PROFESSOR, @COD_TURMA, @COD_TURNO, @NUM_APROVADOS, @NUM_REPROVADOS, @NUM_TRANCADOS, @ANO, @SEMESTRE
	END
	CLOSE CURSOR_FATO
	DEALLOCATE CURSOR_FATO
END

GO