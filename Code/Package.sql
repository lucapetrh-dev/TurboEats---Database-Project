create or replace package pk_update
is

procedure update_cifre;
procedure update_prezzo;
end pk_update;
/

create or replace package body pk_update
is

procedure update_prezzo(nuovo_prezzo in integer, id_prodotto_aggiornato in prodotti.id_prodotto%type)
    is
        prezzo_attuale prodotti.costo%type;
begin
    select costo into prezzo_attuale from prodotti where id_prodotto=id_prodotto_aggiornato;
    dbms_output.put_line('Aggiorno il prezzo di ' || id_prodotto_aggiornato);
    update prodotti set costo=nuovo_prezzo where id_prodotto=id_prodotto_aggiornato;    
end update_prezzo;

procedure update_cifre
    is
        cursor t_cursor is select numero from clienti where (substr(numero,1,2) <> '39');
        t_temp t_cursor%rowtype;
begin
    begin
        open t_cursor;
        loop
        update clienti set numero = '39'+substr(numero,3,12);
        fetch t_cursor into t_temp;
        exit when t_cursor%notfound;
        end loop;
        close t_cursor;
    end;
end update_cifre;
end pk_update;
  
  
exec pk_update.update_prezzo;
exec pk_update.update_cifre;