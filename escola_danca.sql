DROP DATABASE IF EXISTS Escola_Danca;
CREATE DATABASE Escola_Danca charset=UTF8 COLLATE utf8_general_ci;
USE Escola_Danca;

CREATE TABLE Professores(
   id_Prof INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nome_Prof VARCHAR (50) NOT NULL,
   formacao VARCHAR (50) NOT NULL
);

INSERT INTO Professores VALUES (default,"Ana Caúdia de Souza","Balé");
INSERT INTO Professores VALUES (default,"Augusto Felisbino","Hip Hop");
INSERT INTO Professores VALUES (default,"Larissa Silva","Tango");
INSERT INTO Professores VALUES (default,"José Ferreira","Valsa" );
INSERT INTO Professores VALUES (default,"Gerson Silva","Funk");
INSERT INTO Professores VALUES (default,"Clara Fagundes","Jazz");


CREATE TABLE Telefones(
   id_Tel INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   telefone VARCHAR (15) NOT NULL,
   id_Prof INTEGER NOT NULL,
   CONSTRAINT fk_id_Telefones FOREIGN KEY (id_Prof) REFERENCES Professores(id_Prof)
);

INSERT INTO Telefones VALUES (default,"988563142",1);
INSERT INTO Telefones VALUES (default,"988565846",1);
INSERT INTO Telefones VALUES (default,"954763142",2);
INSERT INTO Telefones VALUES (default,"925673143",2);
INSERT INTO Telefones VALUES (default,"979586314",3);
INSERT INTO Telefones VALUES (default,"925893752",4);
INSERT INTO Telefones VALUES (default,"988254451",5);
INSERT INTO Telefones VALUES (default,"985484262",6);



CREATE TABLE Horarios(
   id_Hor INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   inicio TIME NOT NULL,
   fim TIME NOT NULL
);


INSERT INTO Horarios VALUES (default,"09:00:00", "10:00:00");
INSERT INTO Horarios VALUES (default,"08:00:00", "11:00:00");
INSERT INTO Horarios VALUES (default,"10:00:00", "12:00:00");
INSERT INTO Horarios VALUES (default,"08:00:00", "10:30:00");
INSERT INTO Horarios VALUES (default,"15:00:00", "16:00:00");
INSERT INTO Horarios VALUES (default,"17:00:00", "18:00:00");
INSERT INTO Horarios VALUES (default,"20:00:00", ":21:00:00");



CREATE TABLE Disciplinas(
   id_Disc INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nomeDisc VARCHAR (40) NOT NULL,
   horario INTEGER NOT NULL,
   CONSTRAINT fk_id_Hor FOREIGN KEY (horario) REFERENCES Horarios(id_Hor)

);

INSERT INTO Disciplinas VALUES (default,"Balé",1);
INSERT INTO Disciplinas VALUES (default,"Hip Hop",2);
INSERT INTO Disciplinas VALUES (default,"Tango",3);
INSERT INTO Disciplinas VALUES (default,"Valsa",4);
INSERT INTO Disciplinas VALUES (default,"Valsa",5);
INSERT INTO Disciplinas VALUES (default,"Funk",6);
INSERT INTO Disciplinas VALUES (default,"Jazz",7);


CREATE TABLE Alunos(
   ra INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR (50) NOT NULL,
   sexo VARCHAR (20) NOT NULL,
   dnascimento DATE NOT NULL

);

INSERT INTO Alunos VALUES (default,"Pedro", "Masculino","2003-12-08");
INSERT INTO Alunos VALUES (default,"Luis", "Masculino","2003-12-08");
INSERT INTO Alunos VALUES (default,"João", "Masculino","2009-12-08");
INSERT INTO Alunos VALUES (default,"Carlos", "Masculino","2003-12-08");
INSERT INTO Alunos VALUES (default,"Gabriela", "Feminino","2004-12-06");
INSERT INTO Alunos VALUES (default,"Luana", "Feminino","2003-12-15");
INSERT INTO Alunos VALUES (default,"Ana", "Feminino","2006-12-08");
INSERT INTO Alunos VALUES (default,"Alice", "Feminino","2008-12-02");
INSERT INTO Alunos VALUES (default,"Taila", "Feminino","2003-07-08");



CREATE TABLE Turmas(
   Cod_Turma INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
   horario VARCHAR (10) NOT NULL,
   tipo VARCHAR (20) NOT NULL,
   id_Disc INTEGER NOT NULL,
   ra_aluno INTEGER NOT NULL,
   CONSTRAINT fk_id_Disc FOREIGN KEY (id_Disc) REFERENCES Disciplinas(id_Disc),
   CONSTRAINT fk_id_alunos FOREIGN KEY (ra_aluno) REFERENCES Alunos(ra)
);


INSERT INTO Turmas VALUES (default,"Manhã", "Infaltil",1,9);
INSERT INTO Turmas VALUES (default,"Manhã", "Infaltil",2,8);
INSERT INTO Turmas VALUES (default,"Manhã", "Infaltil",2,7);
INSERT INTO Turmas VALUES (default,"Tarde", "Juvenil",3,6);
INSERT INTO Turmas VALUES (default,"Tarde", "Juvenil",3,5);
INSERT INTO Turmas VALUES (default,"Tarde", "Juvenil",4,4);
INSERT INTO Turmas VALUES (default,"Noite", "Senior",5,3);
INSERT INTO Turmas VALUES (default,"Noite", "Senior",6,2);
INSERT INTO Turmas VALUES (default,"Noite", "Senior",6,1);


create view vw_Professores as
select p.id_Prof, p.nome_prof, p.formacao, t.telefone as Telefones from Professores p
inner join Telefones t
on p.id_Prof = t.id_Prof;

create view vw_Turmas_Disc as
select t.tipo, d.nomeDisc as Disciplinas from Turmas t
inner join Disciplinas d
on t.id_Disc = d.id_Disc;



create view vw_Turmas_Alunos as
select t.tipo, a.ra, a.nome, a.sexo, a.dnascimento as Alunos from Turmas t
inner join Alunos a
on a.ra = t.ra_aluno;
