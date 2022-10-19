create view report_spedizioni as 
select * from riders r,fornitori f, tragitti t where (r.rd_fornitore=f.nome_fornitore) and (r.tragitto=t.id_tragitto) order by r.id_rider;

create view report_menù_prod_disp as
select * from menù m,fornitori f,prodotti p where (m.m_fornitore=f.nome_fornitore) and (m.m_prodotto=p.id_prodotto) order by p.id_prodotto;

create view report_voti as
select * from feedbacks f,clienti c where (f.fb_cliente=c.id_cliente) order by f.voto;

create view report_ric_avv as
select c.id_cliente as "identità cliente",c.nome as "nome del cliente",c.città as "città cliente",c.via as "Via",c.civico as "Civico",c.cap as "Cap",c.email as "mail cliente",c.numero as "numero cliente",r.id_rider as "identificativo rider",f.nome_fornitore as "nome del fornitore",f.città as "città fornitore",f.email as "mail fornitore",f.esercizio as "tipo fornitore" from clienti c,riders r,fornitori f,ricevimento r1 where (r1.ric_cliente=c.id_cliente) and (r1.ric_rider=r.id_rider) and (r1.ric_fornitore=f.nome_fornitore) order by c.id_cliente;

create view report_ordinazioni_fatte as
select c.id_cliente as "identificativo cliente",c.nome as "nome cliente",c.città as "città cliente",c.via as "Via",c.civico as "Civico",c.cap as "Cap",c.email as "mail cliente",c.numero as "numero cliente",f.nome_fornitore as "Nome fornitore",f.città as "città del fornitore",f.email as "mail fornitore",f.esercizio as "tipo fornitore" from clienti c,fornitori f,ordinazioni o where (o.o_cliente=c.id_cliente) and (o.o_fornitore=f.nome_fornitore) order by f.nome_fornitore;

select * from report_spedizioni;
select * from report_menù_prod_disp;
select * from report_voti;
select * from report_ric_avv;
select * from report_ordinazioni_fatte;