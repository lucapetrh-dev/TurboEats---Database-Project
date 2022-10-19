create or replace procedure update_prezzo(nuovo_prezzo in integer, id_prodotto_aggiornato in prodotti.id_prodotto%type)
    is
        prezzo_attuale prodotti.costo%type;
begin
    select costo into prezzo_attuale from prodotti where id_prodotto=id_prodotto_aggiornato;
    dbms_output.put_line('Aggiorno il prezzo di ' || id_prodotto_aggiornato);
    update prodotti set costo=nuovo_prezzo where id_prodotto=id_prodotto_aggiornato;
end;    
/

create or replace procedure update_cifre
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
/

create or replace procedure report_prezzi_prodotti
  is
    MaxPrice prodotti.costo%type;
    MinPrice prodotti.costo%type;
    MedianPrice prodotti.costo%type;
    Products integer;
  begin
      select max(costo) into MaxPrice from prodotti;
      select min(costo) into MinPrice from prodotti;
      select avg(costo) into MedianPrice from prodotti;
      select count(id_prodotto) into Products from prodotti;
            dbms_output.put_line('Prezzo Massimo ' || MaxPrice ||
                    ' Prezzo Minimo ' || MinPrice ||
                    ' Prezzo Medio ' || MedianPrice ||
                    ' Numero Prodotti ' || Products);   
  end report_prezzi_prodotti;
    
  
create or replace procedure report_ordinazioni_indata(data_ins in ordinazioni.data%type)
  is
    cursor o_cursor is select * from ordinazioni o where o.data = data_ins;
    o_temp o_cursor%rowtype;
    conta number:=0;
 begin
    open o_cursor;
    loop
      conta:=conta+1;
      fetch o_cursor into o_temp;
      exit when o_cursor%notfound;
      dbms_output.put_line('Ordinazione n.' || conta ||
                    ' ID Cliente ' || o_temp.o_cliente ||
                    ' Nome Fornitore ' || o_temp.o_fornitore ||
                    ' Data Inserita ' || data_ins );
      end loop;
    close o_cursor;
   end report_ordinazioni_indata; 
  
create sequence seq_per_clienti MINVALUE 0 START WITH 0 NOCACHE; 


create or replace procedure popolamento_clienti(nome in varchar, city in varchar, via in varchar, civico in integer, cap in number, email in varchar, numero in varchar) 
    is
        cursor c_cursor is select * from clienti;
        c_temp c_cursor%rowtype;
    begin
        insert into clienti values (seq_per_clienti.nextval,nome,city,via,civico,cap,email,numero);
        open c_cursor;
        dbms_output.put_line('Tabella clienti');
        loop
            fetch c_cursor into c_temp;
            exit when c_cursor%notfound;
            dbms_output.put_line(
                    ' ID ' || c_temp.id_cliente ||
                    ' nome ' || c_temp.nome ||
                    ' città ' || c_temp.città ||
                    ' via ' || c_temp.via ||
                    ' civico ' || c_temp.civico ||
                    ' cap ' || c_temp.cap ||
                    ' email ' || c_temp.email ||
                    ' numero '|| c_temp.numero); 
        end loop;
        close c_cursor;
    end;
      
          
exec report_prezzi_prodotti;
exec report_ordinazioni_indata(to_date('10-05-20','dd-MM-yyyy'));
exec update_prezzi(10,111);
exec update_cifre;
exec popolamento_clienti('Luca','Napoli','Via Bernini','70','80129','lucapetrh@gmail.com','393461329825');