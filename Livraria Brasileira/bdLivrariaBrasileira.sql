CREATE DATABASE bdLivrariaBrasileira;
GO

USE bdLivrariaBrasileira;
GO

CREATE TABLE tbAutor(
	codAutor INT PRIMARY KEY IDENTITY (1,1),
	nomeAutor VARCHAR (50)
);

CREATE TABLE tbGenero(
	codGenero INT PRIMARY KEY IDENTITY (1,1),
	nomeGenero VARCHAR (50)
);

CREATE TABLE tbEditora(
	codEditora INT PRIMARY KEY IDENTITY (1,1),
	nomeEditora VARCHAR (50)
);

CREATE TABLE tbLivro(
	codLivro INT PRIMARY KEY IDENTITY (1,1),
	nomeLivro VARCHAR (50),
	numPaginas INT,
	codGenero INT FOREIGN KEY REFERENCES tbGenero (codGenero),
	codAutor INT FOREIGN KEY REFERENCES tbAutor (codAutor),
	codEditora INT FOREIGN KEY REFERENCES tbEditora(codEditora)
);

SET IDENTITY_INSERT tbAutor ON;

INSERT INTO tbAutor (codAutor, nomeAutor) 
VALUES  (1, 'Machado de Assis'),
		(2, 'Cora Coralina'),
		(3, 'Clarice Lispector'),
		(4, 'Graciliano Ramos'),
		(5, 'Érico Veríssimo'),
		(6, 'Carlos Drummond de Andrade'),
		(7, 'Paulo Coelho');

SET IDENTITY_INSERT tbAutor OFF;

SET IDENTITY_INSERT tbGenero ON;

INSERT INTO tbGenero (codGenero, nomeGenero) 
VALUES  (1, 'Romance'),
		(2, 'Poesia'),
		(3, 'Drama'),
		(4, 'Fantasia'),
		(5, 'Conto');

SET IDENTITY_INSERT tbGenero OFF;

SET IDENTITY_INSERT tbEditora ON;

INSERT INTO tbEditora (codEditora, nomeEditora) 
VALUES  (1, 'Companhia Nacional'),
		(2, 'Saraiva'),
		(3, 'Ática'),
		(4, 'Cia das Letras');

SET IDENTITY_INSERT tbEditora OFF;

SET IDENTITY_INSERT tbLivro ON;

INSERT INTO tbLivro (codLivro, nomeLivro, numPaginas, codGenero, codEditora, codAutor)
VALUES  (1, 'Poemas da Infancia', 180, 2, 1, 2),
		(2, 'A Estrela Misteriosa', 320, 4, 2, 5),
		(3, 'Pequeno Conto Brasileiro', 150, 5, 3, 5),
		(4, 'Dom Casmurro', 256, 1, 4, 1),
		(5, 'Memorias Postumas', 300, 1, 4, 1),
		(6, 'Poema das Flores', 210, 2, 1, 2),
		(7, 'A Hora da Estrela', 98, 3, 4, 3),
		(8, 'Grande Sertao', 600, 1, 2, 4),
		(9, 'Poesia e Vida', 275, 2, 3, 6),
		(10, 'Alguma Poesia', 190, 2, 1, 6),
		(11, 'A Viagem Perdida', 420, 4, 2, 3),
		(12, 'Paisagem Brasileira', 340, 1, 4, 4);

SET IDENTITY_INSERT tbLivro OFF;