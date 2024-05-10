use oscar_database;

# 1- Quantas vezes Natalie Portman foi indicada ao Oscar?
SELECT count(nome_do_indicado) FROM filmes WHERE nome_do_indicado = "Natalie Portman";

# 2- Quantos Oscars Natalie Portman ganhou?
SELECT count(vencedor) FROM filmes WHERE vencedor = "sim" and nome_do_indicado = "Natalie Portman";

# 3- Amy Adams já ganhou algum Oscar?
SELECT Count(vencedor) FROM filmes WHERE vencedor = "sim" and nome_do_indicado = "Amy Adams";

# 4- A série de filmes Toy Story ganhou um Oscar em quais anos?
SELECT ano_cerimonia, vencedor FROM filmes WHERE vencedor = "sim" and nome_filme LIKE "%Toy Story%";

# 5- A partir de que ano que a categoria "Actress" deixa de existir?
SELECT ano_cerimonia, categoria FROM filmes WHERE categoria = "Actress" ORDER BY ano_cerimonia DESC LIMIT 1;
    
# 6- O primeiro Oscar para melhor Atriz foi para quem? Em que ano?
SELECT categoria, nome_do_indicado, ano_cerimonia FROM filmes WHERE categoria = "Actress" ORDER BY ano_cerimonia ASC LIMIT 1;

# 7- Na coluna/campo "Vencedor", altere todos os valores com "Sim" para 1 e todos os valores "Não" para 0.
UPDATE filmes SET vencedor = CASE WHEN vencedor = 'Sim' THEN '1' WHEN vencedor = 'Não' THEN '0' ELSE vencedor END WHERE vencedor IN ('Sim', 'Não');

-- Teste
SELECT * FROM filmes;

# 8- Em qual edição do Oscar "Crash" concorreu ao Oscar?
SELECT edicao_cerimonia FROM filmes WHERE nome_filme = "Crash" LIMIT 1;

# 9- Bom... dê um Oscar para um filme que merece muito, mas não ganhou.
-- Deixando The Shawshank Redemption com 7 oscars :)
SELECT * FROM filmes WHERE nome_filme LIKE "%Harry Potter%";
    
UPDATE filmes SET vencedor = "Sim" where nome_filme LIKE "%Harry Potter%";

# 10- O filme Central do Brasil aparece no Oscar?
SELECT * FROM filmes WHERE nome_filme = "Central Station";
SELECT * FROM filmes WHERE nome_do_indicado = "Fernanda Montenegro";

# 11- Inclua no banco 3 filmes que nunca foram nem nomeados ao Oscar, mas que merecem ser. 
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES ('1982', '1983', '55', 'DIRECTING', 'Ridley Scott', 'Blade Runner', 'Não');
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES ('2004', '2005', '77', 'DIRECTING', 'Michel Gondry', 'Eternal Sunshine of the Spotless Mind', 'Sim');
INSERT INTO filmes (ano_filmagem, ano_cerimonia, edicao_cerimonia, categoria, nome_do_indicado, nome_filme, vencedor) VALUES ('1995', '1996', '68', 'DIRECTING', 'Frank Darabont', 'The Shawshank Redemption', 'Sim');

# 12- Pensando no ano em que você nasceu: Qual foi o Oscar de melhor filme, Melhor Atriz e Melhor Diretor?
SELECT nome_filme, nome_do_indicado, categoria
FROM filmes
WHERE ano_cerimonia = 2005 and vencedor = "sim"
AND (categoria = "Actress in a Leading Role" OR categoria = "Directing") LIMIT 2;
