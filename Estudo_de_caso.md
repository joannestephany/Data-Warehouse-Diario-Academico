# PROJETO DE DATA WAREHOUSE
    UFS - Universidade Federal de Sergipe
    Joanne Stephany Gois da Silva 
    Departamento de Sistema de Informação de Itabaiana 
    Disciplina – Sistema de Apoio à Decisão
    Professor: Andre Vinicius Rodrigues Passos Nascimento

# Estudo de caso
Fazer relatórios que apresentem o resultado de aprovações, reprovações, e trancamento em disciplina, buscando identificar os fatores mais influentes para o resultado final.

# Indicadores 
- 	Qual a quantidade de disciplinas que um professor pega por período?
- 	Qual a taxa de reprovação por período?
- 	Qual a taxa de aprovação por período?
- 	Qual a taxa de trancamento por período?
- 	Qual a taxa de reprovação por professor?
- 	Qual a taxa de aprovação por professor?
- 	Qual a taxa de trancamento por professor?
- 	Qual a disciplina que mais reprova?
- 	Qual a disciplina que mais aprova?
- 	Qual a disciplina que tem maior taxa de trancamento?
- 	Em X disciplina, qual turno apresenta mais aprovações?

# Fatos: 
Fato diário de aprovação

# Granularidade: 
Uma linha na tabela de fato representa a taxa de reprovação, aprovação e trancamento de uma determinada turma de determindada disciplina em um determinado turno se um determinado periodo com um determinado professor, 

# Dimensões: 
- DIM_TEMPO
- DIM_PROFESSOR
- DIM_DISCIPLINA
- DIM_TURMA
- DIM_TURNO
- FATO_DIARIO_ACADEMICO

# Agregados
Consulta de aprovação, reprovação e trancamentos


