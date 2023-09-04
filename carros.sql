CREATE TABLE Fabricante (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(25),
  país VARCHAR(25)
);

CREATE TABLE Categoria (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(25)
);

CREATE TABLE Automovel (
  id SERIAL PRIMARY KEY,
  modelo VARCHAR(25),
  ano INT,
  fabricante_id INT,
  categoria_id INT,
  FOREIGN KEY (fabricante_id) REFERENCES Fabricante(id),
  FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);
INSERT INTO Fabricante (nome, país) VALUES
  ('Toyota', 'Japão'),
  ('Ford', 'Estados Unidos'),
  ('Volkswagen', 'Alemanha'),
  ('Chevrolet', 'Estados Unidos'),
  ('BMW', 'Alemanha');
INSERT INTO Categoria (nome) VALUES
  ('Sedan'),
  ('Esportivo'),
  ('Hatchback'),
  ('SUV'),
  ('Cupê');
INSERT INTO Automovel (modelo, ano, fabricante_id, categoria_id) VALUES
  ('Corolla', 2022, 1, 1),
  ('Camry', 2022, 1, 1),
  ('Mustang', 2021, 2, 2),
  ('F-150', 2022, 2, 4),
  ('Golf', 2023, 3, 3),
  ('Polo', 2023, 3, 3),
  ('Focus', 2022, 2, 3),
  ('Passat', 2022, 3, 1),
  ('Cruze', 2022, 4, 1),
  ('X5', 2023, 5, 4);
SELECT * FROM Fabricante;
SELECT a.*, c.nome AS categoria FROM Automovel a
JOIN Categoria c ON a.categoria_id = c.id
WHERE c.nome = 'Sedan';
SELECT * FROM Automovel WHERE fabricante_id = 1;
SELECT a.*, f.nome AS fabricante FROM Automovel a
JOIN Fabricante f ON a.fabricante_id = f.id
WHERE a.id = 3;
SELECT a.*, f.nome AS fabricante, c.nome AS categoria FROM Automovel a
JOIN Fabricante f ON a.fabricante_id = f.id
JOIN Categoria c ON a.categoria_id = c.id;

UPDATE Automovel SET ano = 2023 WHERE id = 2;

UPDATE Automovel SET fabricante_id = 5 WHERE id = 4;

UPDATE Automovel SET categoria_id = 2 WHERE id = 5;

DELETE FROM Automovel WHERE id = 6;

DELETE FROM Categoria WHERE id = 5;

ALTER TABLE Automovel ADD COLUMN preco int;

ALTER TABLE Fabricante ADD COLUMN teste varchar(20);

ALTER TABLE Fabricante DROP COLUMN teste;

SELECT a.*, f.nome AS fabricante
FROM Automovel a
INNER JOIN Fabricante f ON a.fabricante_id = f.id;

SELECT a.*, f.nome AS fabricante
FROM Automovel a
LEFT JOIN Fabricante f ON a.fabricante_id = f.id;

SELECT a.*, f.nome AS fabricante
FROM Automovel a
RIGHT JOIN Fabricante f ON a.fabricante_id = f.id;

SELECT a.*, f.nome AS fabricante
FROM Automovel a
FULL OUTER JOIN Fabricante f ON a.fabricante_id = f.id;

SELECT COUNT(*) AS total_automoveis
FROM Automovel;

SELECT SUM(preco) AS soma_precos
FROM Automovel;

SELECT AVG(ano) AS media_anos
FROM Automovel;

SELECT MIN(ano) AS ano_minimo
FROM Automovel;

SELECT MAX(ano) AS ano_maximo
FROM Automovel;

SELECT c.nome AS categoria, SUM(a.preco) AS soma_precos
FROM Automovel a
JOIN Categoria c ON a.categoria_id = c.id
GROUP BY c.nome;
