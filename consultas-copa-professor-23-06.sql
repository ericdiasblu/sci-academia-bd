-- Quantidade De Seleções Por Continente

SELECT c.bdnome, count(*)
FROM TSELECOES S
JOIN tcontinentes c on (c.bdcodcontinente = s.bdcodcontinente)
GROUP BY c.bdnome;

-- Quantidade De Jogos Por Estádio

SELECT
j.bdcodestadio,
e.bdnome,
COUNT(*)
FROM tjogos j
JOIN testadios e on (e.bdcodestadio = j.bdcodestadio)
GROUP BY j.bdcodestadio,e.bdnome;

-- Quantidade De Jogos Por Cidade

SELECT
e.bdcidade,
COUNT(*)
FROM tjogos j
JOIN testadios e on (e.bdcodestadio = j.bdcodestadio)
GROUP BY e.bdcidade;

-- Quantidade De Jogos Por Fase

-- Total De Gols Por Fase

SELECT
f.bddescricao,
SUM(js.bdgols)
FROM tjogos j
JOIN tjogoselecoes js on (js.bdcodjogo = j.bdcodjogo)
JOIN tfases f on (f.bdcodfase = j.bdcodfase)
GROUP BY f.bddescricao;

-- Média De Gols Por Fase

SELECT
f.bddescricao,
AVG(js.bdgols)
FROM tjogos j
JOIN tjogoselecoes js on (js.bdcodjogo = j.bdcodjogo)
JOIN tfases f on (f.bdcodfase = j.bdcodfase)
GROUP BY f.bddescricao;

-- Quantidade De Jogos Apitados Por Árbitro
-- Quantidade De Árbitros Por País

-- Total De Gols Como Mandante Por Seleção

SELECT
js.bdcodjogoselecao,s.bdnome, sum(js.bdgols)
from tjogoselecoes js
join tselecoes s on (s.bdcodselecao = js.bdcodselecao)
WHERE js.bdcodtiposelecaojogo = 1
GROUP BY js.bdcodjogoselecao, s.bdnome;

-- Total De Gols Como Mandante Por Seleção
-- Quantidade De Jogos Por Seleção Como Mandante



-- Quantidade De Jogos Por Seleção Como Visitante
-- Total De Público Possível Por Cidade
-- Fases Com Mais De Um Jogo




-- Criar uma consulta que mostre o placar completo dos jogos no seguinte formato:
-- Brasil 2 x 0 México
-- Argentina 1 x 1 Japão
-- Franca 3 x 1 Marrocos

SELECT s.bdnome || ' ' || j2.bdgols_m || ' x ' || j2.bdgols_v || ' ' || s2.bdnome as Placares
FROM tjogoselecoes2 J2
JOIN tselecoes s on (s.bdcodselecao = j2.bdcodselecao_m)
JOIN tselecoes s2 on (s2.bdcodselecao = j2.bdcodselecao_v);

-- ou

SELECT S_M.bdnome || ' ' || J_MAND.BDGOLS || ' x ' || J_VISI.BDGOLS || ' ' || S_V.bdnome
FROM tjogos J
JOIN(
  SELECT
  BDCODJOGO,
  BDCODSELECAO,
  BDGOLS
  FROM tjogoselecoes
  WHERE BDCODTIPOSELECAOJOGO = 1
) J_MAND on (J_MAND.BDCODJOGO = J.bdcodjogo)

JOIN(
  SELECT
  BDCODJOGO,
  BDCODSELECAO,
  BDGOLS
  FROM tjogoselecoes
  WHERE BDCODTIPOSELECAOJOGO = 2
) J_VISI on (J_VISI.BDCODJOGO = J.bdcodjogo)

JOIN tselecoes S_M on (S_M.bdcodselecao = J_MAND.BDCODSELECAO)

JOIN tselecoes S_V on (S_V.bdcodselecao = J_VISI.BDCODSELECAO)

