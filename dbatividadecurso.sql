USE dbcursos;

/*Cadastro Aluno*/
DELIMITER $$  
CREATE PROCEDURE  spCadastraAluno(
	IN AlunoId INT,
    IN NomAluno VARCHAR(80),
    IN RmAluno VARCHAR(10),
    IN Nascimento TIMESTAMP
)
BEGIN 
	INSERT INTO tbalunos (IdAluno, Aluno, RM, DataNascimento)
    VALUES (AlunoId, NomAluno, RmAluno, Nascimento);
END $$
DELIMITER ;

CALL spCadastraAluno(12, 'Erick Gabriel dos Santos Alves', '12012', '2003-02-21');
CALL spCadastraAluno(13, 'Diego Augusto Frolline Picello', '12013', '2003-02-22');
CALL spCadastraAluno(14, 'José Carlos Abrussi Fosceca', '12014', '2003-02-23');
CALL spCadastraAluno(15, 'Lucas Furtado de Souza', '12015', '2003-02-24');
CALL spCadastraAluno(16, 'Matheus de Almeida', '12016', '2003-02-25');

/*Cadastro Matricula*/
DELIMITER $$  
CREATE PROCEDURE  spMatriculaAluno(
	IN AlunoId INT,
    IN CursoId INT,
    IN Matricula TIMESTAMP
)
BEGIN 
	INSERT INTO tbmatricula (IdAluno, IdCurso, DataMatricula)
    VALUES (AlunoId, CursoId, Matricula);
END $$
DELIMITER ;

CALL spMatriculaAluno(12, 1, '2020-06-02');
CALL spMatriculaAluno(13, 2, '2020-06-02');
CALL spMatriculaAluno(14, 3, '2020-06-02');

/*Atualiza Aluno*/
DELIMITER $$  
CREATE PROCEDURE  spAtualizaAluno(
	IN AlunoId INT,
    IN NomAluno VARCHAR(80),
    IN RmAluno VARCHAR(10),
    IN Nascimento TIMESTAMP
)
BEGIN 
	UPDATE tbalunos
    SET	Aluno = NomAluno,
		RM = RmAluno,
        DataNascimento = Nascimento
	WHERE IdAluno = AlunoId;
END $$
DELIMITER ;

CALL spAtualizaAluno(15, 'Lucas Furtado de Souza', '12015', '2003-05-24');
CALL spAtualizaAluno(16, 'Matheus de Almeida', '12016', '2001-02-25');

/*Retorna Qtd Alunos*/
DELIMITER $$  
CREATE PROCEDURE  spMatriculaAlunoQtd(
    IN AlunoId INT,
    IN CursoId INT,
    IN Matricula TIMESTAMP,
    OUT Qtd INT
)
BEGIN 
    INSERT INTO tbmatricula (IdAluno, IdCurso, DataMatricula)
    VALUES (AlunoId, CursoId, Matricula);
    
    SET Qtd = (
		SELECT count(IdAluno)
        FROM tbmatricula
        WHERE IdCurso = CursoId
    );
END $$
DELIMITER ;

SET @Qtd = 0;
CALL spMatriculaAlunoQtd(15, 1, '2020-06-02', @Qtd);
SELECT @Qtd;

/*Altera Matricula*/
DELIMITER $$  
CREATE PROCEDURE  spAlteraCurso(
	IN AlunoId INT,
    IN CursoId INT
)
BEGIN 
	UPDATE tbmatricula
    SET IdCurso = CursoId
	WHERE IdAluno = AlunoId;
END $$
DELIMITER ;

CALL spAlteraCurso(12, 2);
CALL spAlteraCurso(13, 1);
CALL spAlteraCurso(14, 3);

/*Cadastra/Matricula Aluno*/
DELIMITER $$  
CREATE PROCEDURE  spAlunoMatricula(
	IN AlunoIdTbA INT,
    IN NomAluno VARCHAR(80),
    IN RmAluno VARCHAR(10),
    IN Nascimento TIMESTAMP,
    IN AlunoIdTbC INT,
    IN CursoId INT,
    IN Matricula TIMESTAMP
)
BEGIN 
	INSERT INTO tbalunos (IdAluno, Aluno, RM, DataNascimento)
    VALUES (AlunoIdTbA, NomAluno, RmAluno, Nascimento);
    INSERT INTO tbmatricula (IdAluno, IdCurso, DataMatricula)
    VALUES (AlunoIdTbC, CursoId, Matricula);
END $$
DELIMITER ;

CALL spAlunoMatricula(17, 'Mateus Lopes Olivato', '12017', '2003-06-27', 17, 2, '2020-06-02');

select * from tbalunos;
select * from tbmatricula;

/*Apagando aluno*/
DELIMITER $$  
CREATE PROCEDURE spApagaAluno(
	IN AlunoId INT
)
BEGIN 
	DELETE FROM tbmatricula WHERE IdAluno = AlunoId;
	DELETE FROM tbalunos WHERE IdAluno = AlunoId;
END $$
DELIMITER ;

CALL spApagaAluno(11);

select * from tbcursos;

/*Função qtd. alunos em um curso*/
DELIMITER $$
CREATE FUNCTION udfQtdAlunosCurso(
	CursoId INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(IdAluno)
    INTO auxQtd
    FROM tbmatricula
    WHERE IdCurso = CursoId;
    
    RETURN auxQtd;
END $$
DELIMITER ;

select udfQtdAlunosCurso(1);

/*Função qtd. cursos de um aluno*/
DELIMITER $$
CREATE FUNCTION udfQtdCursosAluno(
	AlunoId INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(IdCurso)
    INTO auxQtd
    FROM tbmatricula
    WHERE IdAluno = AlunoId;
    
    RETURN auxQtd;
END $$
DELIMITER ;

select udfQtdCursosAluno(7);

/*Pesquisa na função udfQtdAlunosCurso*/
DELIMITER $$
CREATE FUNCTION udfQtdMatriculas(
	CursoId INT
)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(IdAluno)
    INTO auxQtd
    FROM tbmatricula 
    WHERE IdCurso = CursoId;
    
    RETURN auxQtd;
END $$
DELIMITER ;

SELECT IdCurso, Curso, udfQtdMatriculas(IdCurso) AS 'Qtd. Matriculas'
FROM tbcursos;

select * from tbmatricula;

/*Pesquisa na função udfQtdCursosAluno*/
DELIMITER $$
CREATE FUNCTION udfQtdCursos(
	AlunoId INT
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE auxQtd INT DEFAULT 0;
    
    SELECT count(IdCurso)
    INTO auxQtd
    FROM tbmatricula
    WHERE IdAluno = AlunoId;
    
    RETURN auxQtd;
END $$
DELIMITER ;

SELECT RM, Aluno, udfQtdCursos(IdAluno) AS 'Qtd. Matriculas'
FROM tbalunos;

select * from tbmatricula;

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

select * from vwAlunoMatriculaCurso;

/*Faça um select na sua view para trazer os dados dos alunos matriculados no curso 'Contabilidade - Contabilidade Avançada'*/
SELECT *
FROM vwAlunoMatriculaCurso 
WHERE IdCurso = 6;