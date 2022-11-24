--USE DW_DIARIO_ACADEMICO

-- Scripts para povoar o DIMENSÃO TEMPO 
-- povoando por mês
GO

create or alter procedure sp_insert_SEMESTRE (@ANO_INICIO INT,@ANO_FIM INT)
as
BEGIN
    DECLARE @id_tempo BIGINT,
			@nivel varchar(10),
			@semestre INT,
			@nome_semestre VARCHAR(100),
			@periodo_letivo VARCHAR(6), -- concatenacao entre ano e semestre
			@ano INT

	SET @ANO = @ANO_INICIO
	SET @SEMESTRE = 1
			
	WHILE @ANO <= @ANO_FIM AND @SEMESTRE <= 4
	BEGIN

			SELECT @NOME_SEMESTRE = CASE
				WHEN @SEMESTRE = 1 THEN 'PRIMEIRO SEMESTRE'
				WHEN @SEMESTRE = 2 THEN 'SEGUNDO SEMESTRE' 
				WHEN @SEMESTRE = 3 THEN 'TERCEIRA SEMESTRE'
				WHEN @SEMESTRE = 4 THEN 'QUARTA SEMESTRE' 
				END
				 
			SET @PERIODO_LETIVO = (SELECT CONCAT(LTRIM (STR(@ANO)),'.',LTRIM (STR(@SEMESTRE))))
			--PRINT @PERIODO_LETIVO
			INSERT INTO DIM_TEMPO(NIVEL,SEMESTRE,NOME_SEMESTRE,ANO,PERIODO_LETIVO) 
			VALUES('SEMESTRE', @SEMESTRE, @NOME_SEMESTRE, @ANO,@PERIODO_LETIVO)
					
		IF @SEMESTRE < 4 
		BEGIN
			SET @semestre = @semestre + 1
		END
		ELSE
		BEGIN
			SET @semestre = 1
			SET @ano = @ano + 1
		END
	END
END
GO


-- povoando por ano
GO
create or alter procedure sp_insert_ANO (@ANO_INICIO INT,@ANO_FIM INT)
as
BEGIN
    DECLARE @ano INT

	SET @ANO = @ANO_INICIO
			
	WHILE @ANO <= @ANO_FIM 
	BEGIN
				 
		INSERT INTO DIM_TEMPO(NIVEL,ANO) 
		VALUES('ANO', @ANO)
					
		SET @ano = @ano + 1

	END
END
GO
