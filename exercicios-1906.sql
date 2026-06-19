-- 1
SELECT * FROM tclientes;

-- 2
SELECT * FROM tpratos pr WHERE pr.bdpreco > 30;

-- 3
SELECT * FROM tpedidos p WHERE p.bdcodstatus = 1;

-- 4
SELECT
 p.bdcodstatus,
 count(p.bdcodpedido) as BDQTDPEDIDOS
FROM Tpedidos p
GROUP BY p.bdcodstatus;

-- 5
SELECT
 c.bdcodcli,
 c.bdnomecli,
 COUNT(p.bdcodpedido) AS BDTOTPEDIDOS
FROM tclientes c
JOIN tpedidos p ON (c.bdcodcli = p.bdcodcli)
GROUP BY c.bdcodcli, c.bdnomecli
ORDER BY c.bdcodcli;



