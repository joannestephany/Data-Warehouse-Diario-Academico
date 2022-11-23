--USE DW_DIARIO_ACADEMICO

--	Qual a taxa de reprovação por período?



--	Qual a taxa de aprovação por período?



--	Qual a taxa de trancamento por período?



--	Qual a taxa de reprovação por professor?
SELECT SUM(F.NUM_REPROVADOS) AS REPROVACAO FROM FATO_DIARIO_ACADEMICO F
	JOIN DIM_PROFESSOR P ON(F.ID_PROFESSOR = P.ID_PROFESSOR)



--	Qual a taxa de aprovação pelo professor METHANIAS COLACO JUNIOR ?
SELECT SUM(F.NUM_APROVADOS) AS APROVACAO FROM FATO_DIARIO_ACADEMICO F
	JOIN DIM_PROFESSOR P ON(F.ID_PROFESSOR = P.ID_PROFESSOR)
    WHERE P.NOME_PROFESSOR = 'METHANIAS COLACO JUNIOR'


--	Qual a taxa de trancamento por turma e qual a disciplina?
SELECT TM.NOME_TURMA, TM.NUM_ALUNOS ,SUM(F.NUM_TRANCADOS) AS TRANCAMENTO FROM FATO_DIARIO_ACADEMICO F
	JOIN DIM_TURMA TM ON(F.ID_TURMA = TM.ID_TURMA)
    JOIN DIM_DISCIPLINA D ON(F.ID_DISCIPLINA = D.ID_DISCIPLINA)


--	Qual a disciplina que mais reprova?



--	Qual a disciplina que mais aprova?



--	Qual a disciplina que tem maior taxa de trancamento?



--	Em X disciplina, qual turno apresenta mais aprovações?
