--Trigger che updatano i nomi di clienti, fornitori, prodotti e riders in maiuscolo
create trigger uppercast_clienti
before insert on clienti
for each row
begin
:new.Nome := upper(:new.Nome);
end;
/

create trigger uppercast_fornitori
before insert on fornitori
for each row
begin
:new.nome_fornitore := upper(:new.nome_fornitore);
end;
/

create trigger uppercast_prodotti
before insert on prodotti
for each row
begin
:new.tipo := upper(:new.tipo);
end;
/

create trigger uppercast_riders
before insert on riders
for each row
begin
:new.nome_rider := upper(:new.nome_rider);
end;
/

--Trigger che controlla il numero di prodotti su menù
create or replace trigger controllo_prodotti_permenù
before insert on menù
for each row
declare 
	prodotti_max constant number:= 25;
	contatore_prod number:=0;
	overflow_prodotti exception;
begin
	select count(m.m_prodotto) into contatore_prod from menù m where m.m_fornitore = :new.m_fornitore;
	if (contatore_prod >= prodotti_max) then raise overflow_prodotti;
	end if;
  	dbms_output.put_line('Inserimento corretto');
exception
	when overflow_prodotti then raise_application_error(-20001,'Troppi prodotti per questo fornitore!');
end;
/

  --Trigger che controlla che i clienti che lasciano un feedback abbiano effettuato un ordinazione
create or replace trigger controllo_feedback
  before insert on ricevimento
  for each row
  declare
  id_counter integer;
  cliente_non_valido exception;
begin
  select count(*) into id_counter from ordinazioni o where o.o_cliente = :new.ric_cliente and o.o_fornitore = :new.ric_fornitore;
  if id_counter = 0 then
    raise cliente_non_valido;
  end if;
exception
  when cliente_non_valido then raise_application_error(-20002, 'Il cliente che sta provando a lasciare un feedback non ha ordinato niente');
end;    
  
--Trigger che controlla che i riders guidino motorini
create or replace trigger controllo_mezzi
after insert on riders
for each row
declare
	errore exception;
	mezzo constant riders.mezzo_trasporto%type := 'Motorino';
begin
	if :new.mezzo_trasporto <> mezzo
	then raise errore;
	end if;
	exception
	when errore then raise_application_error (-20003, 'mezzo non valido');
end;
/
