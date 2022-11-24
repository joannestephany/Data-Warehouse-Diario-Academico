# PROJETO DE DATA WAREHOUSE
    UFS - Universidade Federal de Sergipe
    Joanne Stephany Gois da Silva 
    Departamento de Sistema de Informação de Itabaiana 
    Disciplina – Sistema de Apoio à Decisão
    Professor: Andre Vinicius Rodrigues Passos Nascimento

# Estudo de caso

Fazer relatórios que apresentem o resultado de aprovações, reprovações, e trancamento em disciplina, buscando identificar os fatores mais influentes para o resultado final.

# Indicadores 

-   Qual a quantidade de disciplinas que um professor pega por período?
-  	Qual a taxa de reprovação por período?
-  	Qual a taxa de aprovação por período?
-  	Qual a taxa de trancamento por período?
-  	Qual a taxa de reprovação por professor?
-  	Qual a taxa de aprovação por professor?
-  	Qual a taxa de trancamento por professor?
-  	Qual a escala descrecente de disciplina que mais reprova?
-  	Qual a escala descrecente de disciplina que mais aprova?
-  	Qual a escala descrecente de disciplina que é mais trancada?
-  	Qual a escala descrecente de disciplina que mais aprova por turno?

# Fatos 

- 	Fato diário de aprovação 
-   Fato de aprovação por professor por ano (agregado)

#  Granularidade: 
**Fato diário de aprovação :** Uma linha na tabela de fato representa a taxa de reprovação, aprovação e trancamento de uma determinada turma de determindada disciplina em um determinado turno se um determinado periodo com um determinado professor.

**Fato de aprovação por professor por ano (agregado):*** Uma linha na tabela de fato representa o total de aprovações por professor em um ano.

# Dimensões
    DIM_TEMPO, DIM_PROFESSOR, DIM_DISCIPLINA, DIM_TURMA, DIM_TURNO.

# Agregados

	TOTAL DE APROVAÇÕES POR PROFESSOR POR ANO.



