CREATE OR ALTER trigger titens_pedido_bi0 for titens_pedido
active before insert position 0
AS
 declare variable wcodprato INTEGER;
begin
  select P.bdpreco
  from tpratos P
  where p.bdcodprato = new.bdcodprato
  into :wcodprato;

  new.bdvalorunitario = :wcodprato;
end