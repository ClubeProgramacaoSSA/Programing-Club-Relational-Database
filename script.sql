CREATE TABLE TB_MEMBROS( 
    id_membro int not null, 
    nome varchar(50) not null, 
    RA int not null, 
    genero char(1) not null, 
    oficio varchar(50) not null, 
    curso varchar(30) not null, 
    cargo varchar(20) not null, 
    dt_nascimento date not null, 
    faculdade varchar(30) not null, 
    dt_ingresso_clube date not null, 
    dt_ingresso_faculdade date not null 
);
ALTER TABLE TB_MEMBROS ADD CONSTRAINT pk_membros primary key (id_membro);
ALTER TABLE TB_MEMBROS ADD CONSTRAINT ck_genero_membro check (genero in ('M','F','O'));
CREATE SEQUENCE SQ_MEMBROS;


CREATE TABLE TB_EQUIPES( 
    id_equipe int not null primary key, 
    capitao varchar(30) not null, 
    nome varchar(30) not null, 
    colocacao int not null 
);
ALTER TABLE TB_EQUIPES ADD CONSTRAINT pk_equipe primary key (id_equipe);
CREATE SEQUENCE SQ_EQUIPES;


CREATE TABLE TB_MEMBROS_EQUIPES( 
    id_equipes_membros int not null, 
    id_membro int not null 
    id_equipe int not null, 
);
ALTER TABLE TB_MEMBROS_EQUIPES ADD CONSTRAINT pk_membros_equipes primary key (id_membros_equipes);
ALTER TABLE TB_MEMBROS_EQUIPES ADD CONSTRAINT fk_membroequipe_membro FOREIGN KEY (id_membro) REFERENCES TB_MEMBROS (id_membro);
CREATE SEQUENCE SQ_MEMBROS_EQUIPES;

CREATE TABLE TB_EQUIPES_TORNEIO( 
    id_equipes_torneios int not null, 
    id_equipes int not null, 
    id_torneios int not null,
    colocacao int not null
);
ALTER TABLE TB_EQUIPES_TORNEIO ADD CONSTRAINT pk_equipes_torneio primary key (id_equipes_torneios);
ALTER TABLE TB_EQUIPES_TORNEIO ADD CONSTRAINT fk_equipe_torneio FOREIGN KEY (id_equipes) REFERENCES TB_EQUIPES (id_equipes);
ALTER TABLE TB_EQUIPES_TORNEIO ADD CONSTRAINT fk_torneio_equipe FOREIGN KEY (id_torneios) REFERENCES TB_TORNEIO (id_torneio);


CREATE TABLE TB_PROJETOS( 
    id_projeto int not null, 
    lider int not null, 
    URLGITHUB varchar(100) not null, 
    descricao varchar(50) not null, 
    dt_inicio date not null, 
    dt_fim date not null, 
    nome varchar(30) not null 
);
ALTER TABLE TB_PROJETOS ADD CONSTRAINT pk_projetos primary key (id_projeto);
ALTER TABLE TB_PROJETOS ADD CONSTRAINT fk_projeto_lider FOREIGN KEY (lider) REFERENCES TB_MEMBROS (id_membro);
ALTER TABLE TB_PROJETOS MODIFY (lider varchar(30));
CREATE SEQUENCE SQ_PROJETOS;


CREATE TABLE TB_ENCONTROS( 
    id_encontro int not null, 
    id_organizador int not null, 
    id_projeto int not null, 
    dt_inicio date not null 
);
ALTER TABLE TB_ENCONTROS ADD CONSTRAINT pk_encontros primary key (id_encontro);
ALTER TABLE TB_ENCONTROS ADD CONSTRAINT fk_encontro_organizador FOREIGN KEY (id_organizador) REFERENCES TB_MEMBROS (id_membro);
ALTER TABLE TB_ENCONTROS ADD CONSTRAINT fk_encontro_projeto FOREIGN KEY (id_projeto) REFERENCES TB_PROJETOS (id_projeto);
CREATE SEQUENCE SQ_ENCONTROS;

CREATE TABLE TB_PRESENCA(
    id_presenca int not null,
    id_membros int not null,
    id_encontros int not null
);
ALTER TABLE TB_PRESENCA ADD CONSTRAINT pk_presenca primary key (id_presenca);
ALTER TABLE TB_PRESENCA ADD CONSTRAINT fk_membros FOREIGN KEY (id_membro) REFERENCES TB_MEMBROS (id_membro);
ALTER TABLE TB_PRESENCA ADD CONSTRAINT fk_encontros FOREIGN KEY (id_encontros) REFERENCES TB_ENCONTROS (id_encontros);


CREATE TABLE TB_FASE(
    id_fase int not null,
    id_torneio int not null,
    numero int not null,
    data_Hora_Termino date not null,
    data_Hora_Inicio date not null
);
ALTER TABLE TB_FASE ADD CONSTRAINT pk_fase primary key (id_fase);
ALTER TABLE TB_FASE ADD CONSTRAINT fk_torneio FOREIGN KEY (id_torneio) REFERENCES TB_TORNEIO (id_membro);


--INSERT INTO TB_MEMBROS (id_membro,nome,RA,genero,oficio,curso,cargo,dt_nascimento,faculdade,dt_ingresso_clube,dt_ingresso_faculdade) VALUES (SQ_MEMBROS.nextVal,'Fernando Schettini',1234567890,'M','Estudante','Eng. Computação','CEO','14 april 2002','Senai Cimatec','1 january 2021','1 january 2021');

--INSERT INTO TB_EQUIPES (id_equipe,capitao,nome,colocacao) VALUES (1,'TESTE','TESTE',1);

--SELECT * FROM TB_EQUIPES;

--DELETE FROM TB_EQUIPES;

--SELECT * FROM TB_EQUIPES;

--SELECT * FROM TB_MEMBROS;

--INSERT INTO TB_EQUIPES (id_equipe, capitao, nome, colocacao) VALUES (SQ_EQUIPES.nextVal, 'Fernando Schettini','Equipe Laranja',1);

--SELECT * FROM TB_EQUIPES;

--INSERT INTO TB_MEMBROS_EQUIPES (id_equipes_membros,id_membro,id_equipe) VALUES (SQ_MEMBROS_EQUIPE.nextVal, (select id_membro from tb_membros where id_membro = 1), (select id_equipe from tb_equipes where id_equipe = 1));

--INSERT INTO TB_MEMBROS_EQUIPES (id_equipes_membros,id_membro,id_equipe) VALUES (SQ_MEMBROS_EQUIPES.nextVal, (select id_membro from tb_membros where id_membro = 1), (select id_equipe from tb_equipes where id_equipe = 1));

--SELECT * FROM TB_MEMBROS;

--SELECT * FROM TB_EQUIPES;

--SELECT * FROM TB_MEMBROS_EQUIPES;

--INSERT INTO TB_ENCONTROS (id_encontro, id_organizador, id_projeto, dt_inicio) VALUES (SQ_ENCONTROS.nextVal, (select id_membro from tb_membros where id_membro = 1), (select id_projeto from tb_projetos where id_projeto = 2), '22 may 2022');

--INSERT INTO TB_ENCONTROS (id_encontro, id_organizador, id_projeto, dt_inicio) VALUES (SQ_ENCONTROS.nextVal, (select id_membro from tb_membros where id_membro = 1), (select id_projeto from tb_projetos where id_projeto = 1), '22 may 2022' );

--INSERT INTO TB_PROJETOS (id_projeto, lider, URLGITHUB, descricao, dt_inicio, dt_fim, nome) VALUES (SQ_PROJETOS.nextVal, (select id_membro from tb_membros where id_membro=1), 'www.teste.com', 'descrição teste', '1 may 2022', '31 may 2022', 'Projeto laranjinha');
    