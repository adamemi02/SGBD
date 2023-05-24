
--4
Create table Nationalitati(
Id_Nationalitate int ,
Nationalitate varchar(255),
Primary key(Id_Nationalitate)
);



Create table Sponsori(
Id_Sponsor int,
Nume varchar(255) Not Null,
Suma_oferita int,
primary key(Id_Sponsor)
);

create table Tari_organizatorice(
Id_Tara int ,
Nume varchar(255) Not Null,
Continent varchar(255) Not Null,
primary key(Id_Tara)
);

create table Sporturi(
Id_Sport int,
Nume varchar(255) Not Null,
An_aparitie int,
Juc_echipa int,
primary key(Id_Sport)
);

create table Cazari(
Id_Cazare int,
Nume varchar(255) Not Null,
Nr_locuri int  Not Null,
Adresa varchar(255),
primary key(Id_Cazare)
);



create table Camere(
Id_Camera int,
Id_Cazare int not null,
Sex varchar(255),
Etaj int ,
Nr_locuri int  Not Null,
primary key(Id_Camera),
foreign key(Id_Cazare) references Cazari(Id_Cazare)
);
create table Editii(
Id_Editie int,
Id_Tara int not null,
An int not null,
Data_incepere date,
primary key(Id_Editie),
foreign key(Id_Tara) references Tari_organizatorice(Id_Tara)
);

create table Indruma(
Id_Sportiv int not null,
Id_Antrenor int not null,
Id_Sport int not null,
Primary key(Id_Sportiv,Id_Antrenor,Id_Sport),
foreign key(Id_Sportiv) references Sportivi(Id_Sportiv),
foreign key(Id_Antrenor) references Antrenori(Id_Antrenor),
foreign key(Id_Sport) references Sporturi(Id_Sport)
);
select * from Antrenori;
create table Antrenori(
Id_Antrenor int,
Id_Nationalitate int  not null,
Nume varchar(255) not null,
Prenume varchar(255) not null,
Varsta int,
primary key(Id_Antrenor),
foreign key(Id_Nationalitate) references Nationalitati(Id_Nationalitate)
);

create table Probe(
Id_Proba int,
Id_Sport int not null,
Nume varchar(255),
Durata_min int,
primary key(Id_Proba),
foreign key(Id_Sport) references Sporturi(Id_Sport)
);

create table Premii(
Id_Premiu int,
Id_Proba int not null,
Castig int not null  ,
Pozitie int,
primary key(Id_Premiu),
foreign key(Id_Proba) references Probe(Id_Proba)
);

create table Categorii(
Id_Categorie int,
Id_Proba int not null,
Sex varchar(255),
Varsta int,
Kg int,
primary key(Id_Categorie),
foreign key(Id_Proba) references Probe(Id_Proba)
);
create table Participa_la(
Id_Sportiv int not null,
Id_Editie int not null,
Primary key(Id_Editie,Id_Sportiv),
foreign key(Id_Editie) references Editii(Id_Editie),
foreign key(Id_Sportiv) references Sportivi(Id_Sportiv)
);

Create table Sponsorizeaza(
Id_Sponsor int not null,
Id_Editie int not null,
Primary key(Id_Editie,Id_Sponsor),
foreign key(Id_Sponsor) references Sponsori(Id_Sponsor),
foreign key(Id_Editie) references Editii(Id_Editie)
);
CREATE TABLE Sportivi (
    Id_Sportiv int Not NULL,
    Id_Nationalitate int Not Null ,
    Id_Cazare int Not Null ,
    Nume varchar(200) Not Null,
    Prenume varchar(255) Not Null,
    Varsta int Not Null,
    Sex varchar(255),
    Primary Key(Id_Sportiv),
    foreign key(Id_Nationalitate) references Nationalitati(Id_Nationalitate),
    foreign key(Id_Cazare) references Cazari(Id_Cazare)
);

--5
insert into Sponsori(id_sponsor,nume,Suma_oferita)
values(1,'Adidas',100);                                       
insert into Sponsori(id_sponsor,nume,Suma_oferita)
values(2,'Nike',160);
insert into Sponsori(id_sponsor,nume,Suma_oferita)
values(3,'Heineken',320);
insert into Sponsori(id_sponsor,nume,Suma_oferita)
values(4,'Amazon',220);
insert into Sponsori(id_sponsor,nume,Suma_oferita)
values(5,'Rolex',205);

insert into Tari_organizatorice(Id_Tara,nume,Continent)
values(11,'Anglia','Europa');
insert into Tari_organizatorice(Id_Tara,nume,Continent)
values(13,'Brazilia','America de Sud');
insert into Tari_organizatorice(Id_Tara,nume,Continent)
values(12,'China','Asia');
insert into Tari_organizatorice(Id_Tara,nume,Continent)
values(14,'Qatar','Asia');
insert into Tari_organizatorice(Id_Tara,nume,Continent)
values(15,'Egipt','Africa');


insert into Editii(Id_Editie,Id_Tara,An,Data_incepere)
values(101,13,2002,TO_DATE('17/06/2012', 'DD/MM/YYYY'));
insert into Editii(Id_Editie,Id_Tara,An,Data_incepere)
values(102,14,1998,TO_DATE('01/07/1998', 'DD/MM/YYYY'));
insert into Editii(Id_Editie,Id_Tara,An,Data_incepere)
values(103,11,2006,TO_DATE('04/06/2006', 'DD/MM/YYYY'));
insert into Editii(Id_Editie,Id_Tara,An,Data_incepere)
values(104,13,2014,TO_DATE('01/08/2014', 'DD/MM/YYYY'));
insert into Editii(Id_Editie,Id_Tara,An,Data_incepere)
values(106,15,2018,TO_DATE('05/07/2018', 'DD/MM/YYYY'));
insert into Editii(Id_Editie,Id_Tara,An,Data_incepere)
values(105,12,1994,TO_DATE('31/05/1994', 'DD/MM/YYYY'));



insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(1,101);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(1,103);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(1,104);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(2,103);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(2,105);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(3,101);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(3,102);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(3,104);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(4,101);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(4,104);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(5,103);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(5,105);
insert into Sponsorizeaza(id_Sponsor,id_Editie)
values(5,102);

insert into Cazari(id_Cazare,Nume,Nr_locuri,Adresa)
values(1001,'Bravlia',10,'Wohank_Street');
insert into Cazari(id_Cazare,Nume,Nr_locuri,Adresa)
values(1002,'Kahia',10,'Sun_Flowers');
insert into Cazari(id_Cazare,Nume,Nr_locuri,Adresa)
values(1003,'Donghi',8,'Bulandri_Street');
insert into Cazari(id_Cazare,Nume,Nr_locuri,Adresa)
values(1004,'Rin_Grand',6,'May_nr_9');
insert into Cazari(id_Cazare,Nume,Nr_locuri,Adresa)
values(1005,'Samfri',5,'Dembley_Street');
insert into Cazari(id_Cazare,Nume,Nr_locuri,Adresa)
values(1006,'DunKhao',7,'Al-Azhar');



Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10001,1001,1,3,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10002,1001,2,4,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10003,1001,4,3,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10004,1002,2,2,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10005,1002,5,3,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10006,1002,1,3,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10007,1003,2,5,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10008,1003,4,2,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10009,1003,6,1,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10010,1004,3,2,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10011,1004,2,4,'Masculin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10013,1005,1,3,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10012,1005,4,2,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10014,1006,1,4,'Feminin');
Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10015,1006,4,3,'Feminin');

insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1,'romanian');
insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1.nextval,'english');
insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1.nextval,'german');
insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1.nextval,'chinese');
insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1.nextval,'suedez');
insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1.nextval,'brazilian');
insert into Nationalitati(Id_Nationalitate,nationalitate)
values(id_seq_nat1.nextval,'argentine');


insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(201,21,1003,'Adam','Emanuel',22,'Masculin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(202,21,1002,'Spliciu','Dan',27,'Masculin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(203,22,1005,'White','Ben',19,'Masculin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(204,22,1004,'Stones','Emma',25,'Feminin');
delete from Sportivi
where Sportivi.prenume='Emma';
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(205,23,1005,'Reus','Marco',31,'Masculin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(206,23,1006,'Stokal','Ana',29,'Feminin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(207,24,1003,'Dima','Rahonld',25,'Masculin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(208,25,1001,'Parker','Andreea',35,'Feminin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(209,26,1001,'Deny','Shark',28,'Masculin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(210,27,1005,'Sara','Corina',17,'Feminin');
insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
values(211,27,1003,'Dora','Karl',32,'Masculin');


insert into Participa_la(Id_Sportiv,Id_Editie)    
values(201,101);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(201,103);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(202,102);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(202,104);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(203,103);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(203,106);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(204,104);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(204,106);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(205,101);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(205,106);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(206,102);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(206,103);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(207,104);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(207,105);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(208,102);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(209,103);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(209,106);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(210,101);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(211,104);
insert into Participa_la(Id_Sportiv,Id_Editie)
values(211,102);



insert into Antrenori(Id_Antrenor,Id_Nationalitate,Nume,Prenume,Varsta)
values(301,21,'Guardiola','Pep',45);
insert into Antrenori(Id_Antrenor,Id_Nationalitate,Nume,Prenume,Varsta)
values(302,23,'Pop','Karles',59);
insert into Antrenori(Id_Antrenor,Id_Nationalitate,Nume,Prenume,Varsta)
values(304,26,'Dangu','Ross',37);
insert into Antrenori(Id_Antrenor,Id_Nationalitate,Nume,Prenume,Varsta)
values(303,27,'Dica','Nicolae',43);
insert into Antrenori(Id_Antrenor,Id_Nationalitate,Nume,Prenume,Varsta)
values(305,22,'Salah','Korai',48);


insert into Sporturi(Id_Sport,Nume,An_aparitie,Juc_echipa)
values(2001,'Atletism',NULL,NULL);
insert into Sporturi(Id_Sport,Nume,An_aparitie,Juc_echipa)
values(2002,'Inot',730,NULL);
insert into Sporturi(Id_Sport,Nume,An_aparitie,Juc_echipa)
values(2003,'Baschet',NULL,Null);
insert into Sporturi(Id_Sport,Nume,An_aparitie,Juc_echipa)
values(2004,'Karate',1912,NULL);
insert into Sporturi(Id_Sport,Nume,An_aparitie,Juc_echipa)
values(2005,'Volei',NULL,6);

insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values (201,301,2001);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(202,301,2001);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(203,302,2002);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(204,302,2002);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(205,303,2003);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(206,303,2003);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(207,304,2004);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(208,304,2004);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(209,305,2005);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(210,305,2005);
insert into Indruma(Id_Sportiv,Id_Antrenor,Id_Sport)
values(211,302,2002);

insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values (3001,2001,'Alergare_100m',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3002,2001,'Saritura_lungime',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3003,2002,'Fluture',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3004,2002,'Spate',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3005,2003,'Streetball',10);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3006,2003,'Normal_baschetball',40);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3007,2004,'Kata',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3008,2004,'Kumite',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3009,2005,'Volei_normal',Null);
insert into Probe(Id_Proba,Id_Sport,Nume,Durata_min)
values(3010,2005,'Volei_pe_plaja',Null);

insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4002,3001,8021,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4001,3001,8562,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4003,3002,9800,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4004,3002,8900,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4005,3003,6920,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4006,3003,5802,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4008,3004,5600,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4007,3004,5210,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4009,3005,8300,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4010,3005,7998,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4012,3006,6254,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4011,3006,5660,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4013,3007,8100,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4014,3007,7000,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4015,3008,5700,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4016,3008,6200,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4017,3009,6000,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4018,3009,5600,2);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4019,3010,5500,1);
insert into Premii(Id_Premiu,Id_Proba,Castig,Pozitie)
values(4020,3010,4000,2);



insert into Categorii
values(5001,3001,'Masculin',Null,Null);
insert into Categorii
values (5002,3001,'Feminin',Null,Null);
insert into Categorii
values (5003,3002,'Masculin',Null,Null);
insert into Categorii
values (5004,3002,'Feminin',Null,Null);
insert into Categorii
values (5005,3003,'Feminin',Null,Null);
insert into Categorii
values (5006,3003,'Masculin',Null,Null);
insert into Categorii
values (5008,3004,'Feminin',Null,Null);
insert into Categorii
values (5007,3004,'Masculin',Null,Null);
insert into Categorii
values (5009,3005,'Masculin',Null,Null);
insert into Categorii
values (5010,3005,'Feminin',Null,Null);
insert into Categorii
values (5011,3006,'Feminin',Null,Null);
insert into Categorii
values (5012,3006,'Masculin',Null,Null);
insert into Categorii
values (5013,3007,'Feminin',Null,Null);
insert into Categorii
values (5014,3007,'Masculin',Null,Null);
insert into Categorii
values (5015,3008,'Masculin',Null,Null);
insert into Categorii
values (5016,3008,'Feminin',Null,Null);
insert into Categorii
values (5017,3009,'Feminin',Null,Null);
insert into Categorii
values (5018,3009,'Masculin',Null,Null);
insert into Categorii
values (5020,3001,'Masculin',Null,Null);
insert into Categorii
values (5019,3001,'Feminin',Null,Null);





select * from Sponsori;
Set serveroutput on;

Create or Replace Procedure Exercitiul6
    (an_editie editii.an%Type)
   IS
    Type tablou_imbricat is Table of Number;
    tablou_sponsori tablou_imbricat:=tablou_imbricat();
    Type tablou_indexat is Table of Number Index by PLS_INTEGER ;
    suma tablou_indexat;
    v_nume    sponsori.nume%type;
    v_id_sponsor sponsori.id_sponsor%type;
    v_suma_oferita sponsori.suma_oferita%type;
   
   BEGIN
    select sponsori.id_sponsor bulk collect into tablou_sponsori
    from sponsorizeaza,editii,sponsori
    where  sponsorizeaza.id_editie=editii.id_editie and sponsorizeaza.id_sponsor=sponsori.id_sponsor and editii.an<an_editie;
    
    for i in tablou_sponsori.first..tablou_sponsori.last loop
        select sponsori.id_sponsor,sponsori.suma_oferita
        into v_id_sponsor,v_suma_oferita
        from sponsori
        where id_sponsor=tablou_sponsori(i);
        if suma.exists(v_id_sponsor) then
           suma(v_id_sponsor):=suma(v_id_sponsor)+v_suma_oferita;
        else
            suma(v_id_sponsor):=v_suma_oferita;
        end if;
    end loop;
    
    for i in suma.first..suma.last loop
        if suma.exists(i) then
            select nume
            into v_nume
            from sponsori
            where sponsori.id_sponsor=i;
            DBMS_OUTPUT.PUT_LINE(v_nume||' '||suma(i));
        end if;
       end loop;
END Exercitiul6;

begin
Exercitiul6(2013);
end;


Create or Replace PROCEDURE Exercitiul7
    (nume_cazare cazari.nume%Type)
  IS  
    CURSOR cursor_sportivi(par cazari.id_cazare%type) IS
    select nume,prenume
    from sportivi
    where id_cazare=par;
    
    
    
    v_id_cazare cazari.id_cazare%Type;
    
   
  Begin
    
    select cazari.id_cazare into v_id_cazare
    from cazari
    where cazari.nume=nume_cazare;
    
    for i in cursor_sportivi(v_id_cazare) loop
      dbms_output.put_line('Nume Sportiv:'||i.nume||' '||i.prenume);
      dbms_output.put_line('Editii:');
      for j in (select editii.an
                from editii,participa_la,sportivi
                where editii.id_editie=participa_la.id_editie and participa_la.id_sportiv=sportivi.id_sportiv and i.nume=sportivi.nume)
      loop
        DBMS_Output.put_line(j.an||' ');
      end loop;
      DBMS_Output.put_line(' ');
    end loop;
  End Exercitiul7;  
  
Begin
  Exercitiul7('Bravlia');
End;
select * from cazari;

Create or Replace Function Exercitiul8(v_nume_sportiv In sportivi.nume%Type,
v_nume_antrenor in antrenori.nume%type)
    return sporturi.nume%type
    
    Is
        v_nume_sport sporturi.nume%type;
        count1 sportivi.varsta%type;
        
        Cursor cursor_dat is
        select nume
        from sportivi
        where nume=v_nume_sportiv;
        
        
    Begin
    
        
        for i in cursor_dat loop
        count1:=count1+1;
        end loop;
        DBMS_Output.put_line(count1);
        
        select sporturi.nume into v_nume_sport
        from Sporturi,Indruma,Antrenori,Sportivi
        where sportivi.nume=v_nume_sportiv and antrenori.nume=v_nume_antrenor and sportivi.id_sportiv=indruma.id_sportiv and
        indruma.id_antrenor=antrenori.id_antrenor and indruma.id_sport=sporturi.id_sport;
        
        return v_nume_sport;
        EXCEPTION 
        when no_data_found then 
            raise_application_error(-20000, 'Sportiv inexistent/Nu exista legatura intre sportiv-antrenor'); 
        when too_many_rows then 
            raise_application_error(-20001, 'Prea multe sporturi date ca rezultat'); 

        
        
     End Exercitiul8;
     
     Begin
     DBMS_Output.put_line(Exercitiul8('Adam','Guardiola'));
     End;
     select * from Sportivi;
     


Create or Replace Procedure Exercitiul9(v_nume_sportiv sportivi.nume%type)
    Is
        type big_variabila is record(sportiv_id sportivi.id_sportiv%type, nume_sportiv sportivi.nume%type,prenume_sportiv sportivi.prenume%type,
                            nume_sport sporturi.nume%type,categorie_id categorii.id_categorie%type);
                            
        variabila big_variabila;
        
    
   
   Begin
   select sportivi.id_sportiv,sportivi.nume,sportivi.prenume,sporturi.nume,categorii.id_categorie
    into variabila
   from sportivi,indruma,sporturi,probe,categorii
   where v_nume_sportiv=sportivi.nume and sportivi.id_sportiv=indruma.id_sportiv
   and indruma.id_sport=sporturi.id_sport and sporturi.id_sport=probe.id_sport and
   categorii.id_proba=probe.id_proba and categorii.sex=sportivi.sex and probe.id_proba in(select min(id_proba) from Probe
   group by Id_Sport);
   
   
   DBMS_OUTPUT.PUT_LINE('Sportivul cu  numele ' ||
                             variabila.nume_sportiv || ' ' || 
                             variabila.prenume_sportiv || ' a concurat la sportul ' || 
                             variabila.nume_sport|| ' la categoria cu id-ul ' ||variabila.categorie_id);
                             
       EXCEPTION 
        when no_data_found then 
            raise_application_error(-20000, 'Nu exista sportiv cu acel nume'); 
        when too_many_rows then 
            raise_application_error(-20001, 'Exista mai multi sportivi cu acel nume de familie'); 

            
   End Exercitiul9;
   
   Begin
   Exercitiul9('Deny');
   End;
   select * from Sportivi;
   
   --10
Create or Replace Trigger exercitiul10
    Before Insert on Sportivi
   Declare
        Type tablou_imbricat is Table of Integer;
        tablou tablou_imbricat:=tablou_imbricat();
        v_count sportivi.varsta%TYPE;
    
   Begin  
        select varsta bulk collect into tablou from Sportivi;
        for i in tablou.first..tablou.last loop
            if tablou(i)>=34 then
                v_count:=1;
             end if;   
         end loop;
         if v_count=1 then
            raise_application_error(-20001,'Limita de varsta a participantilor este depasita');
         end if;   
   End;      
   
Begin
 insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
    values(223,25,1007,'Bla','Blas',23,'Masculin');
    insert into Sportivi(Id_Sportiv,Id_Nationalitate,Id_Cazare,Nume,Prenume,Varsta,Sex)
    values(225,23,1002,'Bladsa','Blas',32,'Masculin');
End;
drop trigger exercitiul10;
   
   
--11
CREATE OR REPLACE TRIGGER Exercitiul11
    AFTER INSERT ON camere
    FOR EACH ROW
DECLARE
    capacitate_noua camere.nr_locuri%type:=0;
BEGIN
    select cazari.nr_locuri into capacitate_noua 
    from cazari 
    where cazari.id_cazare=:new.id_cazare;
    
    capacitate_noua:=:new.nr_locuri+capacitate_noua;
    
    update cazari
    set nr_locuri=capacitate_noua
    where id_cazare=:new.id_cazare;
    
    DBMS_OUTPUT.PUT_LINE('Nr de locuri a fost actualizat');

END;

Begin

Insert into Camere(Id_Camera,Id_Cazare,Etaj,Nr_locuri,Sex)
values(10019,1003,1,4,'Masculin');

End;
drop trigger exercitiul11;   


--12
CREATE OR REPLACE TRIGGER Exercitiul12
    BEFORE CREATE OR DROP OR ALTER ON SCHEMA
BEGIN
    IF USER != UPPER('emi02') THEN
        RAISE_APPLICATION_ERROR(-20000,'Doar adminul are voie sa modifice schema');
    END IF;
    
END;
drop trigger exercitiul12;
   
   
create or replace package exercitiul13 as
    procedure Exercitiul6(an_editie editii.an%Type);
    procedure Exercitiul7(nume_cazare cazari.nume%Type);
    function  Exercitiul8(v_nume_sportiv In sportivi.nume%Type,v_nume_antrenor in antrenori.nume%type)
    return sporturi.nume%type;
    procedure Exercitiul9(v_nume_sportiv sportivi.nume%type);
end exercitiul13;    

create or replace package body exercitiul13 as
--6
 Procedure Exercitiul6
    (an_editie editii.an%Type)
   AS
    Type tablou_imbricat is Table of Number;
    tablou_sponsori tablou_imbricat:=tablou_imbricat();
    Type tablou_indexat is Table of Number Index by PLS_INTEGER ;
    suma tablou_indexat;
    v_nume    sponsori.nume%type;
    v_id_sponsor sponsori.id_sponsor%type;
    v_suma_oferita sponsori.suma_oferita%type;
   
   BEGIN
    select sponsori.id_sponsor bulk collect into tablou_sponsori
    from sponsorizeaza,editii,sponsori
    where  sponsorizeaza.id_editie=editii.id_editie and sponsorizeaza.id_sponsor=sponsori.id_sponsor and editii.an<an_editie;
    
    for i in tablou_sponsori.first..tablou_sponsori.last loop
        select sponsori.id_sponsor,sponsori.suma_oferita
        into v_id_sponsor,v_suma_oferita
        from sponsori
        where id_sponsor=tablou_sponsori(i);
        if suma.exists(v_id_sponsor) then
           suma(v_id_sponsor):=suma(v_id_sponsor)+v_suma_oferita;
        else
            suma(v_id_sponsor):=v_suma_oferita;
        end if;
    end loop;
    
    for i in suma.first..suma.last loop
        if suma.exists(i) then
            select nume
            into v_nume
            from sponsori
            where sponsori.id_sponsor=i;
            DBMS_OUTPUT.PUT_LINE(v_nume||' '||suma(i));
        end if;
       end loop;
END Exercitiul6;

--7
 PROCEDURE Exercitiul7
    (nume_cazare cazari.nume%Type)
  AS  
    CURSOR cursor_sportivi(par cazari.id_cazare%type) IS
    select nume,prenume
    from sportivi
    where id_cazare=par;
    
    v_id_cazare cazari.id_cazare%Type;
    
   
  Begin
    
    select cazari.id_cazare into v_id_cazare
    from cazari
    where cazari.nume=nume_cazare;
    
    for i in cursor_sportivi(v_id_cazare) loop
      dbms_output.put_line('Nume Sportiv:'||i.nume||' '||i.prenume);
      dbms_output.put_line('Editii:');
      for j in (select editii.an
                from editii,participa_la,sportivi
                where editii.id_editie=participa_la.id_editie and participa_la.id_sportiv=sportivi.id_sportiv and i.nume=sportivi.nume)
      loop
        DBMS_Output.put_line(j.an||' ');
      end loop;
      DBMS_Output.put_line(' ');
    end loop;
  End Exercitiul7;  
  
 
    
--8
 Function Exercitiul8(v_nume_sportiv In sportivi.nume%Type,
v_nume_antrenor in antrenori.nume%type)
    return sporturi.nume%type
    Is
        v_nume_sport sporturi.nume%type;
        
    Begin
     select sporturi.nume into v_nume_sport
        from Sporturi,Indruma,Antrenori,Sportivi
        where sportivi.nume=v_nume_sportiv and antrenori.nume=v_nume_antrenor and sportivi.id_sportiv=indruma.id_sportiv and
        indruma.id_antrenor=antrenori.id_antrenor and indruma.id_sport=sporturi.id_sport;
        
        return v_nume_sport;
        EXCEPTION 
        when no_data_found then 
            raise_application_error(-20000, 'Sportiv inexistent/Nu exista legatura intre sportiv-antrenor'); 
        when too_many_rows then 
            raise_application_error(-20001, 'Mai multi sportivi sau mai multi antrenori cu acel nume'); 
         

     End Exercitiul8;
--9
 Procedure Exercitiul9(v_nume_sportiv sportivi.nume%type)
    Is
        type big_variabila is record(sportiv_id sportivi.id_sportiv%type, nume_sportiv sportivi.nume%type,prenume_sportiv sportivi.prenume%type,
                            nume_sport sporturi.nume%type,categorie_id categorii.id_categorie%type);
                            
        variabila big_variabila;
        
    
   
   Begin
   select sportivi.id_sportiv,sportivi.nume,sportivi.prenume,sporturi.nume,categorii.id_categorie
    into variabila
   from sportivi,indruma,sporturi,probe,categorii
   where v_nume_sportiv=sportivi.nume and sportivi.id_sportiv=indruma.id_sportiv
   and indruma.id_sport=sporturi.id_sport and sporturi.id_sport=probe.id_sport and
   categorii.id_proba=probe.id_proba and categorii.sex=sportivi.sex and probe.id_proba in(select min(id_proba) from Probe
   group by Id_Sport);
   
   
   DBMS_OUTPUT.PUT_LINE('Sportivul cu  numele ' ||
                             variabila.nume_sportiv || ' ' || 
                             variabila.prenume_sportiv || ' a concurat la sportul ' || 
                             variabila.nume_sport|| ' la categoria cu id-ul ' ||variabila.categorie_id);
                             
       EXCEPTION 
        when no_data_found then 
            raise_application_error(-20000, 'Nu sportiv cu acel nume'); 
        when too_many_rows then 
            raise_application_error(-20001, 'Exista mai multi sportivi cu acel nume de familie'); 

            
   End Exercitiul9; 
End exercitiul13;  

drop trigger Exercitiul12;
--6
execute exercitiul13.Exercitiul6(2014);
--7
execute exercitiul13.Exercitiul7('Bravlia');
--8
Begin
DBMS_Output.put_line(exercitiul13.Exercitiul8('Spliciu','Guardiola'));
End;
--9
execute exercitiul13.Exercitiul9('Dora');



Create or Replace Function functie(v_varsta In sportivi.varsta%Type)
    return sportivi.varsta%type
    Is
        v_count sportivi.varsta%type;
        
    Begin
    
        select count(*) into v_count
        from sportivi
        where sportivi.varsta=v_varsta;
        return v_count;
        
     End functie;    




create or replace package exercitiul14 as
    procedure Exercitiul6_(an_editie editii.an%Type);
    function  Exercitiul8_(v_nume_sportiv In sportivi.nume%Type,v_nume_antrenor in antrenori.nume%type)
    return sporturi.nume%type;
    procedure Exercitiul9_(v_nume_sportiv sportivi.nume%type);
    function functie(v_varsta in sportivi.varsta%type)
    return sportivi.varsta%type;
    
    type t_detalii is record(sportiv_id sportivi.id_sportiv%type, nume_sportiv sportivi.nume%type,prenume_sportiv sportivi.prenume%type,
                            nume_sport sporturi.nume%type,categorie_id categorii.id_categorie%type);
    type detalii_sportiv is record(sportiv_nume sportivi.nume%type,sportiv_prenume sportivi.prenume%type,varsta_sportiv sportivi.varsta%type);                        
end exercitiul14; 


create or replace package body exercitiul14 as
  Function functie(v_varsta In sportivi.varsta%Type)
    return sportivi.varsta%type
    Is
        v_count sportivi.varsta%type;
        
    Begin
    
        select count(*) into v_count
        from sportivi
        where sportivi.varsta=v_varsta;
        return v_count;
        
     End functie;
     
  Procedure Exercitiul6_
    (an_editie editii.an%Type)
   AS
    Type tablou_imbricat is Table of Number;
    tablou_sponsori tablou_imbricat:=tablou_imbricat();
    Type tablou_indexat is Table of Number Index by PLS_INTEGER ;
    suma tablou_indexat;
    v_nume    sponsori.nume%type;
    v_id_sponsor sponsori.id_sponsor%type;
    v_suma_oferita sponsori.suma_oferita%type;
   
   BEGIN
    select sponsori.id_sponsor bulk collect into tablou_sponsori
    from sponsorizeaza,editii,sponsori
    where  sponsorizeaza.id_editie=editii.id_editie and sponsorizeaza.id_sponsor=sponsori.id_sponsor and editii.an<an_editie;
    
    for i in tablou_sponsori.first..tablou_sponsori.last loop
        select sponsori.id_sponsor,sponsori.suma_oferita
        into v_id_sponsor,v_suma_oferita
        from sponsori
        where id_sponsor=tablou_sponsori(i);
        if suma.exists(v_id_sponsor) then
           suma(v_id_sponsor):=suma(v_id_sponsor)+v_suma_oferita;
        else
            suma(v_id_sponsor):=v_suma_oferita;
        end if;
    end loop;
    
    for i in suma.first..suma.last loop
        if suma.exists(i) then
            select nume
            into v_nume
            from sponsori
            where sponsori.id_sponsor=i;
            DBMS_OUTPUT.PUT_LINE(v_nume||' '||suma(i));
        end if;
       end loop;
 END Exercitiul6_;


 Function Exercitiul8_(v_nume_sportiv In sportivi.nume%Type,
v_nume_antrenor in antrenori.nume%type)
    return sporturi.nume%type
    Is
        v_nume_sport sporturi.nume%type;
        
    Begin
    
         select sporturi.nume into v_nume_sport
        from Sporturi,Indruma,Antrenori,Sportivi
        where sportivi.nume=v_nume_sportiv and antrenori.nume=v_nume_antrenor and sportivi.id_sportiv=indruma.id_sportiv and
        indruma.id_antrenor=antrenori.id_antrenor and indruma.id_sport=sporturi.id_sport;
        
        return v_nume_sport;
        EXCEPTION 
        when no_data_found then 
            raise_application_error(-20000, 'Sportiv inexistent/Nu exista legatura intre sportiv-antrenor'); 
        when too_many_rows then 
            raise_application_error(-20001, 'Mai multi sportivi sau mai multi antrenori cu acel nume'); 

        
        
     End Exercitiul8_;
     
  Procedure Exercitiul9_(v_nume_sportiv sportivi.nume%type)
    Is
        type big_variabila is record(sportiv_id sportivi.id_sportiv%type, nume_sportiv sportivi.nume%type,prenume_sportiv sportivi.prenume%type,
                            nume_sport sporturi.nume%type,categorie_id categorii.id_categorie%type);
                            
        variabila big_variabila;
        
    
   
   Begin
   select sportivi.id_sportiv,sportivi.nume,sportivi.prenume,sporturi.nume,categorii.id_categorie
    into variabila
   from sportivi,indruma,sporturi,probe,categorii
   where v_nume_sportiv=sportivi.nume and sportivi.id_sportiv=indruma.id_sportiv
   and indruma.id_sport=sporturi.id_sport and sporturi.id_sport=probe.id_sport and
   categorii.id_proba=probe.id_proba and categorii.sex=sportivi.sex and probe.id_proba in(select min(id_proba) from Probe
   group by Id_Sport);
   
   
   DBMS_OUTPUT.PUT_LINE('Sportivul cu  numele ' ||
                             variabila.nume_sportiv || ' ' || 
                             variabila.prenume_sportiv || ' a concurat la sportul ' || 
                             variabila.nume_sport|| ' la categoria cu id-ul ' ||variabila.categorie_id);
                             
       EXCEPTION 
        when no_data_found then 
            raise_application_error(-20000, 'Nu sportiv cu acel nume'); 
        when too_many_rows then 
            raise_application_error(-20001, 'Exista mai multi sportivi cu acel nume de familie'); 

            
   End Exercitiul9_; 
 End exercitiul14;  
   

 




    
    
    
