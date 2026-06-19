-- LEFT JOIN
SELECT
  c.bdcodcli,
  c.bdnomecli,
  p.bddatapedido,
  p.bdvalortotal
FROM tclientes c
LEFT JOIN tpedidos p ON (p.bdcodcli = c.bdcodcli)
ORDER BY p.bdvalortotal;

-- JOINS

SELECT IP.*, P.BDCODSTATUS, SP.BDDESCRICAO
FROM titens_pedido IP
JOIN tpedidos P ON (P.bdcodpedido = IP.bdcodpedido)
JOIN tstatus_pedido SP ON (SP.bdcodstatus = P.bdcodstatus)
WHERE P.bdcodstatus = 3

-- SUBSELECT

SELECT IP.*, P.BDCODSTATUS, SP.BDDESCRICAO
FROM titens_pedido IP
JOIN (
    SELECT P2.BDCODSTATUS, P2.bdcodpedido
    FROM tpedidos P2
    WHERE P2.bdcodstatus = 3
)
P ON (P.bdcodpedido = IP.bdcodpedido)
JOIN tstatus_pedido SP ON (SP.bdcodstatus = P.bdcodstatus)

-- CAMPO DE SELECT

SELECT IP.*, P.BDCODSTATUS, SP.BDDESCRICAO,
  (SELECT PR.BDNOME FROM TPRATOS PR WHERE PR.bdcodprato = IP.bdcodprato) as PRATO
FROM titens_pedido IP
JOIN tpedidos P ON (P.bdcodpedido = IP.bdcodpedido)
JOIN tstatus_pedido SP ON (SP.bdcodstatus = P.bdcodstatus)
WHERE P.bdcodstatus = 3

--

SELECT * FROM titens_pedido;

INSERT INTO tpedidos (BDCODPEDIDO, BDCODCLI, BDCODSTATUS, BDDATAPEDIDO) VALUES (17, 12, 1, '2026-06-19');

INSERT INTO titens_pedido (BDCODITEM, BDCODPEDIDO, BDCODPRATO, BDQUANTIDADE)
values (35,17,2, 3);

UPDATE titens_pedido set BDVALORUNITARIO = 22
WHERE BDCODITEM = 33;

SELECT
  IP.bdcodpedido,
  IP.bdquantidade,
  IP.bdvalorunitario,
  ip.bdquantidade * ip.bdvalorunitario as BDTOT
FROM titens_pedido IP
WHERE ip.bdcodpedido = 16

-- SUM E GROUP BY

SELECT
  IP.bdcodpedido,
  sum(ip.bdvalorunitario) as BDTOT
FROM titens_pedido IP
group BY IP.bdcodpedido;

-- COUNT

SELECT
  IP.bdcodpedido,
  count(ip.bdvalorunitario) as BDTOT
FROM titens_pedido IP
group BY IP.bdcodpedido;

--

SELECT
  IP.bdcodpedido,
  sum(ip.bdvalorunitario) as BDTOT,
  count(*) as BDQTD,
  avg(ip.bdvalorunitario) as BDMEDIA
FROM titens_pedido IP
group BY IP.bdcodpedido;

--

SELECT
  IP.bdcodpedido,
  ip.bdquantidade,
  ip.bdvalorunitario,
  ip.bdquantidade * ip.bdvalorunitario as BDTOTALITENS
FROM
  titens_pedido IP

--

UPDATE titens_pedido set bdcoditem = bdcoditem where bdcodpedido = 16;

--

UPDATE tpedidos set bdvalortotal = 0 where bdcodpedido = 16;

--

DELETE FROM titens_pedido WHERE BDCODPEDIDO = 16 AND BDCODITEM = 37;

--

SELECT * FROM vw_pedidos;

--

SELECT V.*, IP.BDCODPRATO
FROM vw_pedidos v
join titens_pedido ip on (ip.bdcodpedido = v.codigo_pedido);



