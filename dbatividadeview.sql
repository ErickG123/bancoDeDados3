/*
	Script da Atividade 2020-07 BD III 3DS - Views
    Grupo: Erick
*/

/*Crie uma View que retorne os resultados relacionados das tabelas tbAlunos, tbMatricula e tbCursos;*/
CREATE VIEW vwAlunoMatriculaCurso 
AS
SELECT M.IdAluno,
	   A.Aluno,
       A.RM,
       A.DataNascimento,
       M.IdCurso,
       C.Sigla,
       C.Curso,
       C.CargaHoraria
FROM tbMatricula M
		INNER JOIN tbAlunos A ON A.IdAluno = M.IdAluno
        INNER JOIN tbCursos C ON C.IdCurso = M.IdCurso;

/*Faça um select na sua view para trazer os dados dos alunos matriculados no curso 'Contabilidade - Contabilidade Avançada'*/
/*Dados dos Alunos*/
SELECT IdAluno,
	   Aluno,
       RM,
       DataNascimento
FROM vwAlunoMatriculaCurso 
WHERE IdCurso = 6;

/*Todos os dados*/
SELECT *
FROM vwAlunoMatriculaCurso 
WHERE IdCurso = 6;