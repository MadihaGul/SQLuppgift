
#1.Hämta ålder för spelaren Johan Andersson.
select Ålder from GolfTävlig.spelare where Spelare_namn like 'Johan Andersson' ;

#2.Hämta datumför tävlingen Big Golf Cup Skövde.
select Datum from tävling where Tävlings_namn like 'Big Golf Cup Skövde';

#3.Hämta materialet för Johan Anderssons klubba.
select Material from klubba where spelare_Pnr in (select P_nr from spelare where Spelare_namn ='Johan Andersson');

#4.Hämta alla jackor som tillhör Johan Andersson.
select * from jacka where spelare_Pnr in (select P_nr from spelare where Spelare_namn ='Johan Andersson');

#5.Hämta alla spelare som deltog i Big Golf Cup Skövde.
select * from spelare where P_nr in (select P_nr from tävlings_deltagare where Tävlings_namn like 'Big Golf Cup Skövde');

#6.Hämta regnens vindstyrka för Big Golf Cup Skövde.
select Vindstyrka from regn where Typ in (select Regn_typ from har_regnat where Tävlings_namn like 'Big Golf Cup Skövde');

#7.Hämta alla spelare som är under 30 år.
select * from spelare where Ålder<30;
#8.Ta bort Johan Anderssons jackor.
delete from jacka where Spelare_Pnr in (select P_nr from spelare where Spelare_namn ='Johan Andersson');

#9.Ta bort Nicklas Jansson.
/*
select P_nr from spelare where Spelare_namn ='Nicklas Jansson'
*/

DELETE from jacka where Spelare_Pnr in (select P_nr from spelare where Spelare_namn ='Nicklas Jansson');
DELETE from Klubba where Spelare_Pnr in (select P_nr from spelare where Spelare_namn ='Nicklas Jansson');
DELETE from tävlings_deltagare where P_nr in (select P_nr from spelare where Spelare_namn ='Nicklas Jansson');
DELETE FROM GolfTävlig.spelare WHERE Spelare_namn like 'Nicklas Jansson';

#10.Hämta medelåldern för alla spelare.
 select AVG(Ålder) as medelåldern from spelare;