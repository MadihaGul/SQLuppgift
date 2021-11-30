
drop database GolfTävlig;
create database GolfTävlig;
use GolfTävlig;

create table spelare(
P_nr char(13)NOT NULL DEFAULT '',
Spelare_namn varchar(50) NOT NULL DEFAULT '',
Ålder int NOT NULL DEFAULT 0,
primary key (P_nr)
) engine=innodb DEFAULT CHARSET=latin1;

create table tävling(
Tävlings_namn varchar(50) NOT NULL DEFAULT '',
Datum datetime ,
primary key (Tävlings_namn)
) engine=innodb DEFAULT CHARSET=latin1;

create table tävlings_deltagare(
Tävlings_namn varchar(50) NOT NULL DEFAULT '',
P_nr char(13)NOT NULL DEFAULT '',
primary key (Tävlings_namn,P_nr),
FOREIGN KEY (`Tävlings_namn`) REFERENCES `tävling` (`Tävlings_namn`),
FOREIGN KEY (`P_nr`) REFERENCES `spelare` (`P_nr`)
) engine=innodb DEFAULT CHARSET=latin1;

create table konstruktion(
Serial_nr int NOT NULL DEFAULT 0 ,
Hårdhet varchar(20) ,
primary key (Serial_nr)
) engine=innodb DEFAULT CHARSET=latin1;

create table jacka(
Initialer varchar(10)  ,
Spelare_Pnr char(13)NOT NULL DEFAULT '',
Storlek int NOT NULL DEFAULT 0,
Material varchar(20)  ,
primary key (Initialer,Spelare_Pnr),
FOREIGN KEY (`Spelare_Pnr`) REFERENCES `spelare` (`P_nr`)
) engine=innodb DEFAULT CHARSET=latin1;

create table klubba(
Nr int NOT NULL DEFAULT 0  ,
Spelare_Pnr char(13)NOT NULL DEFAULT '',
Material varchar(20)  ,
konstruktion_snr int NOT NULL DEFAULT 0,
primary key (Nr,Spelare_Pnr),
FOREIGN KEY (`Spelare_Pnr`) REFERENCES `spelare` (`P_nr`),
FOREIGN KEY (`konstruktion_snr`) REFERENCES `konstruktion` (`Serial_nr`)
) engine=innodb DEFAULT CHARSET=latin1;

create table regn(
Typ varchar(20) NOT NULL DEFAULT '',
Vindstyrka varchar(20) NOT NULL DEFAULT '',
primary key (Typ)
) engine=innodb DEFAULT CHARSET=latin1;

create table har_regnat(
Tävlings_namn varchar(50) NOT NULL DEFAULT '',
Regn_typ char(13)NOT NULL DEFAULT '',
tidpunkt datetime ,
primary key (Tävlings_namn,Regn_typ),
FOREIGN KEY (`Tävlings_namn`) REFERENCES `tävling` (`Tävlings_namn`),
FOREIGN KEY (`Regn_typ`) REFERENCES `regn` (`Typ`)
) engine=innodb DEFAULT CHARSET=latin1;

INSERT INTO `GolfTävlig`.`spelare` (`P_nr`, `Spelare_namn`, `Ålder`) VALUES ('19990909-9999', 'Johan Andersson', '25');
INSERT INTO `GolfTävlig`.`spelare` (`P_nr`, `Spelare_namn`, `Ålder`) VALUES ('19990909-1111', 'Nicklas Jansson', '35');
INSERT INTO `GolfTävlig`.`spelare` (`P_nr`, `Spelare_namn`, `Ålder`) VALUES ('19990909-2222', 'Annika Persson', '27');
INSERT INTO `GolfTävlig`.`spelare` (`P_nr`, `Spelare_namn`, `Ålder`) VALUES ('19990909-3333', 'Anna Peterson', '26');

INSERT INTO `GolfTävlig`.`tävling` (`Tävlings_namn`, `Datum`) VALUES ('Big Golf Cup Skövde', '2021-06-10');

INSERT INTO `GolfTävlig`.`tävlings_deltagare` (`Tävlings_namn`, `P_nr`) VALUES ('Big Golf Cup Skövde', '19990909-9999');
INSERT INTO `GolfTävlig`.`tävlings_deltagare` (`Tävlings_namn`, `P_nr`) VALUES ('Big Golf Cup Skövde', '19990909-1111');
INSERT INTO `GolfTävlig`.`tävlings_deltagare` (`Tävlings_namn`, `P_nr`) VALUES ('Big Golf Cup Skövde', '19990909-2222');

INSERT INTO `GolfTävlig`.`konstruktion` (`Serial_nr`, `Hårdhet`) VALUES ('1', '10');
INSERT INTO `GolfTävlig`.`konstruktion` (`Serial_nr`, `Hårdhet`) VALUES ('2', '5');


INSERT INTO `GolfTävlig`.`regn` (`Typ`, `Vindstyrka`) VALUES ('hagel', '10m/s');
INSERT INTO `GolfTävlig`.`regn` (`Typ`, `Vindstyrka`) VALUES ('regn', '11m/s');
INSERT INTO `GolfTävlig`.`regn` (`Typ`, `Vindstyrka`) VALUES ('snö', '08m/s');

INSERT INTO `GolfTävlig`.`har_regnat` (`Tävlings_namn`, `Regn_typ`, `tidpunkt`) VALUES ('Big Golf Cup Skövde', 'hagel', '2021-06-10 12:00:00');

INSERT INTO `GolfTävlig`.`jacka` (`Initialer`, `Spelare_Pnr`, `Storlek`, `Material`) VALUES ('JA1', '19990909-9999', '32', 'Fleece');
INSERT INTO `GolfTävlig`.`jacka` (`Initialer`, `Spelare_Pnr`, `Storlek`, `Material`) VALUES ('JA2', '19990909-9999', '32', 'Goretex');

INSERT INTO `GolfTävlig`.`klubba` (`Nr`, `Spelare_Pnr`,`Material`,  `konstruktion_snr`) VALUES ('11022','19990909-1111', 'trä',  '1');
INSERT INTO `GolfTävlig`.`klubba` (`Nr`, `Spelare_Pnr`,`Material`,  `konstruktion_snr`) VALUES ('11025','19990909-2222', 'trä',  '2');
INSERT INTO `GolfTävlig`.`klubba` (`Nr`, `Spelare_Pnr`,`Material`,  `konstruktion_snr`) VALUES ('11028','19990909-9999', 'trä',  '2');


