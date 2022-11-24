-- Scripts para povoar o AMBIENTE OPERACIONAL
--USE DW_DIARIO_ACADEMICO

INSERT INTO TB_DISCIPLINA (COD_DISCIPLINA,NOME_DISCIPLINA,NUM_TURMAS)
VALUES	('ADMI0001','INTRODUCAO A ADMINISTRACAO', 4),
		('MATI0017','CALCULO I', 5),
		('SINF0002','FUNDAMENTOS DA COMPUTACAO', 1),
		('SINF0014','LOGICA MATEMETICA', 1),
		('SINF0063','PROGRAMACAO I', 2),
		('ADMI0028','ORGANIZACAO, METODOS E SISTEMAS ADMINISTRATIVOS', 3),
		('MATI0054','PROBABILIDADE E ESTATISTICA', 3),
		('SINF0001','INTRODUCAO A DATA WAREHOUSE', 1)

INSERT INTO TB_TURNO (NOME_TURNO)
VALUES	('M'),
		('V'),
		('N')

INSERT INTO TB_PROFESSOR (MATRICULA_PROFESSOR, NOME_PROFESSOR)
VALUES	('200600009876','ANDRE VINICIUS RODRIGUES NASCIMENTO'),
		('191200001234','METHANIAS COLACO JUNIOR'),
		('199700000001','LEILA MACIEL DE ALMEIDA E SILVA'),
		('201800005678','RAPHAEL PEREIRA DE OLIVEIRA')

INSERT INTO TB_TURMA (NUM_ALUNOS, ANO, SEMESTRE, NOME_TURMA, ID_PROFESSOR, ID_TURNO, ID_DISCIPLINA)
VALUES	(0,2020,2,'TURMA20203',1,1,1),
		(2,2020,2,'TURMA20202',1,1,1),
		(4,2020,3,'TURMA20203',2,1,2),
		(2,2020,2,'TURMA20202',4,2,2),
		(2,2020,2,'TURMA20202',4,3,2),
		(4,2021,1,'TURMA20211',3,1,3),
		(4,2021,1,'TURMA20211',2,1,8),
		(3,2021,2,'TURMA20212',3,2,4),
		(2,2020,2,'TURMA20202',4,3,7)



INSERT INTO TB_ALUNO (MATRICULA_ALUNO,NOME_ALUNO)
VALUES	('198200001234','RALPH KIMBALL'),
		('194500001234','WILLIAM H. INMON'),
		('201900007781','ERICLES DOS SANTOS CUNHA'),
		('201900000281','JOANNE STEPHANY GOIS DA SILVA'),
		('201800006847','KEVENNY DE JESUS SANTOS'),
		('201900003497','MARIA MILENA DE OLIVEIRA SOUZA'),
		('201900000281','KENDY FERREIRA DE OLIVEIRA'),
		('201900004921','THIAGO SANTOS SANTANA'),
		-- ('201900000281','CARLOS DANIEL DE JESUS'),
		-- ('201900000281','CARLOS HENRIQUE LIMA DE JESUS'),
		-- ('201900000281','CHARLES DAYAN DA CONCEICAO COSTA'),
		-- ('201900000281','GABRIEL DOS SANTOS MENDONCA'),
		-- ('201900000281','JOSE VINICIUS DE CARVALHO OLIVEIRA'),
		-- ('201900000281','JORGE MATHEUS DOS SANTOS'),
		-- ('201900000281','LAURO SANTANA SILVA'),
		-- ('201900000281','LILIANE APARECIDA SANTANA'),
		-- ('201900000281','MATHEUS DA CRUZ SOUZA'),
		-- ('201900000281','MOISES JUNIO FAGUNDES DOS SANTOS'),
		-- ('201900000281','REINAN DE JESUS SANTOS'),
		-- ('201900000281','ROBERTO SANTANA DE JESUS'),
		-- ('201900000281','SAMUEL SILVA DOS ANJOS'),


		


INSERT INTO TB_ALUNO_TURMA (ID_TURMA,ID_ALUNO,STATUS)
VALUES	( 1,1,'APROVADO'),
		( 1,2,'APROVADO'),
		
		( 2,1,'APROVADO'),
		( 2,2,'APROVADO'),
		( 2,3,'TRANCADO'),
		( 2,4,'TRANCADO'),
		
		( 3,1,'APROVADO'),
		( 3,2,'APROVADO'),
		( 3,4,'APROVADO'),
		( 3,3,'APROVADO'),

		( 4,1,'REPROVADO'),
		( 4,2,'TRANCADO'),
		( 4,4,'APROVADO'),
		( 4,3,'APROVADO'),

		( 5,2,'REPROVADO'),
		( 5,4,'APROVADO'),
		( 5,3,'APROVADO')
		
		
-- CONFERINDO UNS PARANAUE AQUI
SELECT * FROM TB_ALUNO
SELECT * FROM TB_TURMA T JOIN TB_DISCIPLINA D ON (T.ID_DISCIPLINA = D.ID_DISCIPLINA)

SELECT * FROM TB_DISCIPLINA
SELECT * FROM TB_PROFESSOR

SELECT * FROM TB_TURNO
SELECT * FROM TB_ALUNO_TURMA