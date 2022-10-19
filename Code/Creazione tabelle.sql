create table clienti(
	id_cliente		integer     not null,
	nome			varchar(20) not null,
	città			varchar(20) not null,
	via				varchar(20) not null,
	civico			integer 	not null,
	cap				number(5) 	not null,
	email 	        varchar(20) not null,                                            
	numero	        varchar(20)	not null,
	constraint pk_clienti primary key (id_cliente));

create table carte( 		 
	numero   	 number(16)   	 not null,
	c_cliente 	 integer 	     not null, 
	CVV 	 	 number(3)       not null,
	data_s	 	 char(5) 		 not null,
	intestatario varchar(20) 	 not null,
	constraint pk_carte primary key (numero));                               


create table fornitori(
	nome_fornitore varchar(20) not null,
	città		   varchar(20) not null,
	email		   varchar(30) not null,
	esercizio	   char(10)    not null,
	constraint pk_fornitori primary key (nome_fornitore));

create table telefoni_fornitori(
	numero_tel	integer     not null,
	tel_fornitore 	varchar(20) not null,
	constraint pk_telefoni_fornitori primary key(numero_tel));

create table prodotti(
	id_prodotto integer 	not null,
	tipo		char(30) 	default null,
	costo	    integer 	not null,
	constraint limite_costo check(costo>0 and costo<100)
	constraint pk_prodotti primary key (id_prodotto));

create table tragitti(
	id_tragitto	     integer 	   not null,
	distanza	     integer      check (distanza<=10) not null,
	tempo_spedizione integer      check(tempo_spedizione>0 and tempo_spedizione<60)  not null,
	constraint pk_tragitti primary key (id_tragitto));

create table riders(
	id_rider	   integer 	   not null,
	tragitto 	   integer     not null,
	rd_fornitore   varchar(20) not null,
	nome_rider	   varchar(20) default null,              
	tipo_rider	   char(20)	   not null,
	numero_rider   integer 	   not null,
	mezzo_trasporto	char(10)   default null,
constraint pk_riders primary key (id_rider));

create table feedbacks(
	id_feedback	 integer   not null,
	fb_cliente      integer   not null,
	voto		 number(1) not null,
	constraint limite_voto check(voto>0 and voto<6),
	constraint pk_feedbacks primary key (id_feedback));
                        

create table ordinazioni(
	o_cliente 	 integer      not null,
	o_fornitore  varchar(20) not null,
	data		 date	 not null,
	constraint pk_ordinazioni primary key (o_cliente,o_fornitore));


create table menù(
	m_fornitore varchar(20) not null,
	m_prodotto    integer   not null,
	constraint pk_menù primary key(m_fornitore,m_prodotto));



create table ricevimento(
	ric_cliente 	integer 	default null,
	ric_rider       integer 	default null,
	ric_fornitore 	varchar(20) default null,
	constraint pk_ricevimento primary key (ric_cliente,ric_rider,ric_fornitore));