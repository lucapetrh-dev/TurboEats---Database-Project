CREATE USER amministratore IDENTIFIED BY PasswordAdmin;
GRANT all privileges TO amministratore;

CREATE ROLE cliente;
GRANT connect to cliente;
GRANT update,insert,delete,select ON clienti TO cliente; 
GRANT update,insert,delete,select ON carte TO cliente; 
GRANT update,insert,delete,select ON feedbacks TO cliente; 

CREATE ROLE fornitore;
GRANT connect to fornitore;
GRANT update,insert,delete,select ON fornitori TO fornitore;
GRANT update,insert,delete,select ON prodotti TO fornitore;
GRANT update,insert,delete,select ON telefoni_fornitori TO fornitore;
GRANT update,insert,delete,select ON riders TO fornitore;

CREATE ROLE gestore_rider;
GRANT connect to gestore_rider;
GRANT update,insert,delete,select ON riders TO gestore_rider;
GRANT update,insert,delete,select ON tragitti TO gestore_rider;
GRANT update,insert,delete,select ON feedbacks TO gestore_rider;

CREATE USER Gianluca IDENTIFIED BY GianlucoideTheBest1;
CREATE USER Luca IDENTIFIED BY LukinhoIta1015;
CREATE USER Dario IDENTIFIED BY PintoPochoLoco1;
CREATE USER Riccardo IDENTIFIED BY Rickebeba101520;
GRANT cliente TO Gianluca;
GRANT cliente TO Luca;
GRANT cliente TO Dario;
GRANT cliente TO Riccardo;

CREATE USER Trianon IDENTIFIED BY TrianoPizzeria1;
CREATE USER Puok IDENTIFIED BY PvokEMedNapoli10;
CREATE USER Magia IDENTIFIED BY StiamoPerFallireAiuto1;
CREATE USER Tortora IDENTIFIED BY PaninoSupermario10;
GRANT fornitore TO Trianon;
GRANT fornitore TO Puok;
GRANT fornitore TO Magia;
GRANT fornitore TO Tortora;

CREATE USER AbusiveParker IDENTIFIED BY DueEuroAPiacereCapo10;
GRANT gestore_rider TO AbusiveParker;