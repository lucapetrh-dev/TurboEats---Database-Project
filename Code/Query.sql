select * from clienti;
select * from carte;
select * from fornitori;
select * from telefoni_fornitori;
select * from prodotti;
select * from tragitti;
select * from riders;
select * from feedbacks;
select * from ordinazioni;
select * from menù;
select * from ricevimento;

--Conta i Ristoranti di sushi tra tutti i fornitori
select count(esercizio) as "Ristoranti di sushi" from fornitori where esercizio='sushi';

--Conta le pizzerie tra tutti i fornitori
select count(esercizio) as "Pizzerie" from fornitori where esercizio='pizzeria';

--Stampa a schermo il prodotto più caro
select max(costo) as "prodotto più caro" from prodotti;

--Stampa a schermo il prodotto più economico
select min(costo) as "prodotto più economico" from prodotti;

--Stampa a schermo la media dei prezzi dei prodotti
select avg(costo) as "media dei prezzi dei prodotti" from prodotti;

--Stampa a schermo nome e numero del cliente 011 con email indicata
select nome,numero from clienti where id_cliente=011 and email='petronio@tim.it';

--Stampa a schermo i riders disponibili ordinati in ordine decrescente
select r.nome_rider from riders r order by r.id_rider desc;

--Conta le ordinazioni eseguite da Gianluca Pepe
select count(o.o_cliente) as "ordine fatto da Gianluca Pepe" from ordinazioni o join clienti c on o.o_cliente=c.id_cliente where c.nome='Gianluca Pepe';

--Stampa il menu di Puok
select m.m_fornitore, p.tipo, f.esercizio from menù m, prodotti p, fornitori f where m.m_prodotto = p.id_prodotto and f.nome_fornitore = m.m_fornitore and m_fornitore = 'Puok';

--Stampa tutte le ordinazioni eseguite da paninerie
select o.o_cliente as Cliente,o.data,f.nome_fornitore,f.esercizio from fornitori f, ordinazioni o where (o.o_fornitore = f.nome_fornitore) and f.esercizio='panineria';

--Stampa tutti riders disponibili per consegne da pizzerie
select r.nome_rider as Nome,f.nome_fornitore as Fornitore,f.esercizio from fornitori f, riders r where (r.rd_fornitore = f.nome_fornitore) and f.esercizio='pizzeria';

--Stampa Id del cliente che ha eseguito un ordinazione da un fornitore con rispettivo recapito telefonico ordinati per id in ordine decrescente
select f.nome_fornitore as Fornitore,o.o_cliente as Cliente,t.numero_tel as Telefono_Fornitore from fornitori f, ordinazioni o, telefoni_fornitori t where (o.o_cliente <6) and (o.o_fornitore = f.nome_fornitore) and (t.tel_fornitore = f.nome_fornitore) order by o.o_cliente desc;

--Stampa a schermo i nomi dei clienti ordinati per nome in modo ascendente
select nome from clienti order by nome asc;

--Stampa a schermo i nomi dei clienti il cui cognome inizia con Pe
select nome from clienti where nome like '%Pe%';

--Stampa a schermo l'ordinazione di Luca Petracca, compreso di fornitore, prodotto ordinato e data di esecuzione
select o.data as Data ,c.nome as Nome,f.nome_fornitore as Esercizio,p.tipo as Prodotto, m.m_prodotto as Id from ordinazioni o, clienti c, fornitori f, prodotti p, menù m where c.id_cliente=o.o_cliente and f.nome_fornitore = o.o_fornitore and m.m_fornitore = f.nome_fornitore and p.id_prodotto = m.m_prodotto and c.nome = 'Luca Petracca';

--Stampa a schermo il prodotto disponibile sul menù di Valù
select m.m_fornitore as Fornitore, p.tipo as Prodotto from menù m,prodotti p where p.id_prodotto = m.m_prodotto and m.m_fornitore = 'Valù';   

--Conta i prodotti economici (meno di 5€) tra tutti i fornitori disponibili
select count(p.tipo) as ProdottiEconomici from prodotti p join menù m on m_prodotto = id_prodotto where p.costo < 5;

--Stampa a schermo tutte le ordinazioni eseguite dai clienti il cui cognome inizia con Pe 
select o.o_cliente,o.o_fornitore,o.data,c.nome from ordinazioni o,clienti c where c.nome like '%Pe%' and c.id_cliente = o.o_cliente;