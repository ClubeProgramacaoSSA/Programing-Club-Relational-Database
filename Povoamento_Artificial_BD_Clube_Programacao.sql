-- Esse Script é responsável por fazer o povoamento artificial do Banco de Dados para poder realizar testes de consultas e checar se o banco está funcionando de maneira esperada

-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian WIDmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --João Pedro Moreira de AlmeIDa Santos | GitHub: https://github.com/joao7878
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires


--POVOAMENTO DA 1 CONSULTA

------------------------------------FORMATACAO DATA------------------------------------
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

------------------------------------ASSUNTO------------------------------------
INSERT INTO 
    TB_assunto
    (id_assunto, assunto)
VALUES
(SQ_assunto.nextVal,'teste');

INSERT INTO 
    TB_assunto
    (id_assunto, assunto)
VALUES
(SQ_assunto.nextVal,'teste2');

------------------------------------CATEGORIA_IMAGEM------------------------------------
INSERT INTO 
TB_categoria_imagem
(ID_categoria_imagem, nome)
VALUES
(SQ_categoria_imagem.nextVal, 'teste');

------------------------------------PAIS------------------------------------
INSERT INTO
TB_pais
(ID_pais, nome)
VALUES
(SQ_pais.nextVal, 'Brasil');

------------------------------------IMAGEM------------------------------------
INSERT INTO 
TB_imagem
(ID_imagem, id_categoria_imagem, imagem, descricao,dt_imagem)
VALUES
(SQ_imagem.nextVal, (select id_categoria_imagem from tb_categoria_imagem where nome = 'teste'),utl_raw.cast_to_raw('imagem'),'uma imagem','01/09/2022');

------------------------------------CURSO------------------------------------
INSERT INTO
TB_CURSO
(ID_CURSO,NOME)
VALUES
(SQ_curso.nextVal,'ENG. COMPUTACAO');

------------------------------------FUNCAO------------------------------------
INSERT INTO
TB_FUNCAO
(ID_FUNCAO, NOME_FUNCAO,DESCRICAO_FUNCAO)
VALUES
(SQ_funcao.nextVal,'Lider','lider');

------------------------------------ESTADO------------------------------------
INSERT INTO
TB_ESTADO
(ID_ESTADO, ID_PAIS, NOME)
VALUES
(SQ_estado.nextVal,(select id_pais from tb_pais where nome='Brasil'),'Bahia');

------------------------------------CIDADE------------------------------------
INSERT INTO 
TB_CIDADE
(ID_CIDADE, ID_ESTADO,NOME)
VALUES
(SQ_cidade.nextVal,(SELECT id_estado from tb_estado where nome='Bahia'),'Salvador');

------------------------------------LOGRADOURO------------------------------------
INSERT INTO 
TB_LOGRADOURO
(ID_LOGRADOURO, ID_CIDADE,NOME)
VALUES
(SQ_logradouro.nextVal,(select id_cidade from tb_cidade where nome='Salvador'),'Patamares');

------------------------------------INSTITUICAO_ENSINO------------------------------------
INSERT INTO 
TB_INSTITUICAO_ENSINO
(ID_instituicao_ensino,id_logradouro,nome)
VALUES
(SQ_instituicao_ensino.nextVal,(select id_logradouro from tb_logradouro where nome='Patamares'),'CIMATEC');

------------------------------------CURSO_INSITUICAO------------------------------------
INSERT INTO 
TB_curso_instituicao
(ID_CURSO_INSTITUICAO, ID_CURSO, ID_INSTITUICAO)
VALUES
(SQ_curso_instituicao.nextVal,(select id_curso from tb_curso where nome ='ENG. COMPUTACAO'),(select id_instituicao_ensino from tb_instituicao_ensino where nome='CIMATEC'));

------------------------------------MEMBROS------------------------------------
INSERT INTO
	TB_MEMBRO
VALUES
	(SQ_MEMBRO.NEXTVAL,(select id_imagem from tb_imagem where descricao ='uma imagem'),(select id_instituicao_ensino from tb_instituicao_ensino where id_instituicao_ensino = 1),(select id_curso_instituicao from tb_curso_instituicao where id_curso_instituicao = 1),(select id_funcao from tb_funcao where nome_funcao='Lider'),'FERNANDO','M','ADM','20A234','01/02/2001','01/01/2021','01/01/2022');
	
INSERT INTO
	TB_MEMBRO
VALUES
	(SQ_MEMBRO.NEXTVAL,(select id_imagem from tb_imagem where descricao ='uma imagem'),(select id_instituicao_ensino from tb_instituicao_ensino where id_instituicao_ensino = 1),(select id_curso_instituicao from tb_curso_instituicao where id_curso_instituicao = 1),(select id_funcao from tb_funcao where nome_funcao='Lider'),'ADRIAN','M','ADM MARKETING','20A235','22/05/2001','01/01/2021','01/01/2022');

INSERT INTO
	TB_MEMBRO
VALUES
	(SQ_MEMBRO.NEXTVAL,(select id_imagem from tb_imagem where descricao ='uma imagem'),(select id_instituicao_ensino from tb_instituicao_ensino where id_instituicao_ensino = 1),(select id_curso_instituicao from tb_curso_instituicao where id_curso_instituicao = 1),(select id_funcao from tb_funcao where nome_funcao='Lider'),'HORACIO','M','ADM','20A236','24/11/2001','01/01/2021','01/01/2022');

INSERT INTO
	TB_MEMBRO
VALUES
	(SQ_MEMBRO.NEXTVAL,(select id_imagem from tb_imagem where descricao ='uma imagem'),(select id_instituicao_ensino from tb_instituicao_ensino where id_instituicao_ensino = 1),(select id_curso_instituicao from tb_curso_instituicao where id_curso_instituicao = 1),(select id_funcao from tb_funcao where nome_funcao='Lider'),'ORLANDO','M','ADM','20A237','03/09/2001','01/01/2021','01/01/2022');

INSERT INTO
	TB_MEMBRO
VALUES
	(SQ_MEMBRO.NEXTVAL,(select id_imagem from tb_imagem where descricao ='uma imagem'),(select id_instituicao_ensino from tb_instituicao_ensino where id_instituicao_ensino = 1),(select id_curso_instituicao from tb_curso_instituicao where id_curso_instituicao = 1),(select id_funcao from tb_funcao where nome_funcao='Lider'),'LUIZ GUILHERME','M','ASSISTENTE DE MARKETING','20A238','01/02/2001','05/12/2021','01/01/2022');

------------------------------------LIDERES------------------------------------
INSERT INTO
    TB_LIDER
VALUES
    (SQ_LIDER.NEXTVAL,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 1),'FERNANDO');

INSERT INTO
    TB_LIDER
VALUES
    (SQ_LIDER.NEXTVAL,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 2),'FERNANDO');

INSERT INTO
    TB_LIDER
VALUES
    (SQ_LIDER.NEXTVAL,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 3),'FERNANDO');

INSERT INTO
    TB_LIDER
VALUES
    (SQ_LIDER.NEXTVAL,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 4),'FERNANDO');

INSERT INTO
    TB_LIDER
VALUES
    (SQ_LIDER.NEXTVAL,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 5),'FERNANDO');
------------------------------------PLATAFORMA------------------------------------
INSERT INTO 
TB_plataforma
(ID_plataforma, URL_plataforma, nome_plataforma)
VALUES
(SQ_plataforma.nextVal, 'www.uri.com.br','uri');

------------------------------------ORGANIZADOR------------------------------------
INSERT INTO 
    TB_ORGANIZADOR
VALUES
    (SQ_ORGANIZADOR.NEXTVAL,'SOCIEDADE BRASILEIRA DE COMPUTACAO','MARATONA DE PROGRAMACAO');

------------------------------------TORNEIO------------------------------------
INSERT INTO
    TB_TORNEIO
VALUES
    (SQ_TORNEIO.NEXTVAL,(SELECT ID_ORGANIZADOR FROM TB_ORGANIZADOR WHERE ID_ORGANIZADOR = 1),'SBC','01/10/2022','01/10/2022');

------------------------------------EQUIPE------------------------------------
INSERT INTO
	TB_EQUIPE
VALUES
	(SQ_EQUIPE.NEXTVAL,'LARANJINHAS','FERNANDO','01/07/2022');
	
------------------------------------EQUIPE_TORNEIO------------------------------------
INSERT INTO
	TB_EQUIPE_TORNEIO
VALUES
	(SQ_EQUIPE_TORNEIO.NEXTVAL,(SELECT ID_EQUIPE FROM TB_EQUIPE WHERE ID_EQUIPE = 1),(SELECT ID_TORNEIO FROM TB_TORNEIO WHERE ID_TORNEIO = 1),1);

------------------------------------MEMBRO_EQUIPE------------------------------------
INSERT INTO
	TB_MEMBRO_EQUIPE
VALUES
	(SQ_MEMBRO_EQUIPE.NEXTVAL,(select id_membro from tb_membro where id_membro = 1),(select id_equipe from tb_equipe where id_equipe = 1));

INSERT INTO
	TB_MEMBRO_EQUIPE
VALUES
	(SQ_MEMBRO_EQUIPE.NEXTVAL,(select id_membro from tb_membro where id_membro = 2),(select id_equipe from tb_equipe where id_equipe = 1));

INSERT INTO
	TB_MEMBRO_EQUIPE
VALUES
	(SQ_MEMBRO_EQUIPE.NEXTVAL,(select id_membro from tb_membro where id_membro = 3),(select id_equipe from tb_equipe where id_equipe = 1));

INSERT INTO
	TB_MEMBRO_EQUIPE
VALUES
	(SQ_MEMBRO_EQUIPE.NEXTVAL,(select id_membro from tb_membro where id_membro = 4),(select id_equipe from tb_equipe where id_equipe = 1));

INSERT INTO
	TB_MEMBRO_EQUIPE
VALUES
	(SQ_MEMBRO_EQUIPE.NEXTVAL,(select id_membro from tb_membro where id_membro = 5),(select id_equipe from tb_equipe where id_equipe = 1));

------------------------------------PROJETO------------------------------------

INSERT INTO
    TB_projeto (ID_PROJETO, ID_LIDER,nome, URL_github, descricao, data_inicio, DT_fim_previsto)
VALUES
    (SQ_projeto.nextVal,(SELECT TB_LIDER FROM TB_LIDER WHERE ID_LIDER = 1),'Banco','www','É um banco','01/07/2022','01/10/2022');

INSERT INTO
    TB_PROJETO
VALUES
    (SQ_PROJETO.NEXTVAL, (select id_lider from tb_lider where id_lider = 5), 'Introducao a programacao','https://github.com/ClubeProgramacaoSSA/Programacao','Ensino basico de programacao em linguagem c','01/01/2022','01/06/2022');

INSERT INTO
    TB_PROJETO
VALUES
    (SQ_PROJETO.NEXTVAL, (select id_lider from tb_lider where id_lider = 4),'Introducao a AED','https://github.com/ClubeProgramacaoSSA/AED','Ensino de estruturas de dados em linguagem c','01/01/2022','01/06/2022');
    	
INSERT INTO
    TB_PROJETO
VALUES
    (SQ_PROJETO.NEXTVAL,(select id_lider from tb_lider where id_lider = 3), 'Introducao a linguagem Java','https://github.com/ClubeProgramacaoSSA/Java','Introducao a orientacao a objetos na linguagem java','01/02/2022','01/04/2022');


INSERT INTO
    TB_PROJETO
VALUES
    (SQ_PROJETO.NEXTVAL, (select id_lider from tb_lider where id_lider = 2),'Projeto SBC','https://github.com/ClubeProgramacaoSSA/SBC','Projeto preparatorio para a maratona de programacao SBC','01/07/2022','01/10/2022');

INSERT INTO
    TB_PROJETO
VALUES
    (SQ_PROJETO.NEXTVAL, (select id_lider from tb_lider where id_lider = 1),'Projeto Batalha da Patonia','https://github.com/ClubeProgramacaoSSA/Patonia','Projeto para a criacao de um game','01/03/2022','28/04/2022');
    

--POVOAMENTO DA 2 CONSULTA

------------------------------------LOCAL------------------------------------
INSERT INTO
    TB_local
VALUES
    (SQ_local.NEXTVAL, (SELECT ID_logradouro FROM TB_logradouro WHERE ID_logradouro = 1), 'Rua do lado do mercado','Rua dos bobos');
    
------------------------------------ENCONTRO------------------------------------
INSERT INTO 
    TB_encontro (ID_ENCONTRO, ID_membro, ID_projeto, DT_inicio, DT_fim, ID_local)
VALUES
    (SQ_encontro.nextVal,(SELECT ID_ORGANIZADOR FROM TB_ORGANIZADOR WHERE ID_ORGANIZADOR = 1),(SELECT ID_PROJETO FROM TB_PROJETO WHERE ID_PROJETO = 1),'01/10/2022','01/10/2022', (SELECT ID_LOCAL FROM TB_LOCAL WHERE ID_LOCAL = 1));

INSERT INTO
    TB_encontro(ID_ENCONTRO, ID_membro, ID_projeto, DT_inicio, DT_fim, ID_local)
VALUES
    (SQ_encontro.nextVal,(SELECT ID_ORGANIZADOR FROM TB_ORGANIZADOR WHERE ID_ORGANIZADOR = 1),(SELECT ID_PROJETO FROM TB_PROJETO WHERE ID_PROJETO = 2),'01/10/2022','01/10/2022', (SELECT ID_LOCAL FROM TB_LOCAL WHERE ID_LOCAL = 1));

------------------------------------PRESENCA_ENCONTRO------------------------------------
INSERT INTO 
    TB_presenca_encontro (ID_PRESENCA_ENCONTRO, ID_membro, ID_encontro)
VALUES
    (SQ_presenca_encontro.nextVal,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 1),(SELECT ID_ENCONTRO FROM TB_ENCONTRO WHERE ID_ENCONTRO = 1));

INSERT INTO 
    TB_presenca_encontro (ID_PRESENCA_ENCONTRO, ID_membro, ID_encontro)
VALUES
    (SQ_presenca_encontro.nextVal,(SELECT ID_MEMBRO FROM TB_MEMBRO WHERE ID_MEMBRO = 2),(SELECT ID_ENCONTRO FROM TB_ENCONTRO WHERE ID_ENCONTRO = 1));

--POVOAMENTO DA 3 CONSULTA

----------------------MEMBRO_PROJETO------------------------------------

INSERT INTO
    TB_membro_projeto (ID_membro_projeto, ID_projeto, ID_membro, ID_funcao)
VALUES
    (SQ_membro_projeto.NEXTVAL,(SELECT ID_membro FROM TB_membro WHERE ID_membro = 1),
    (SELECT ID_lider FROM TB_projeto WHERE ID_projeto = 1),
    (SELECT ID_lider FROM TB_lider WHERE ID_lider = 1));

INSERT INTO
    TB_membro_projeto (ID_membro_projeto, ID_projeto, ID_membro, ID_funcao)
VALUES
    (SQ_membro_projeto.NEXTVAL,(SELECT ID_membro FROM TB_membro WHERE ID_membro = 2),
    (SELECT ID_PROJETO FROM TB_PROJETO WHERE ID_PROJETO = 1),
    (SELECT ID_LIDER FROM TB_LIDER WHERE ID_LIDER = 1));

INSERT INTO
    TB_membro_projeto (ID_membro_projeto, ID_projeto, ID_membro, ID_funcao)
VALUES
    (SQ_membro_projeto.NEXTVAL,(SELECT ID_membro FROM TB_membro WHERE ID_membro = 3),
    (SELECT ID_PROJETO FROM TB_PROJETO WHERE ID_PROJETO = 1),
    (SELECT ID_LIDER FROM TB_LIDER WHERE ID_LIDER = 1));

INSERT INTO
    TB_membro_projeto (ID_membro_projeto, ID_projeto, ID_membro, ID_funcao)
VALUES
    (SQ_membro_projeto.NEXTVAL,(SELECT ID_membro FROM TB_membro WHERE ID_membro = 4),
    (SELECT ID_PROJETO FROM TB_PROJETO WHERE ID_PROJETO = 1),
    (SELECT ID_LIDER FROM TB_LIDER WHERE ID_LIDER = 1));

INSERT INTO
    TB_membro_projeto (ID_membro_projeto, ID_projeto, ID_membro, ID_funcao)
VALUES
    (SQ_membro_projeto.NEXTVAL,(SELECT ID_membro FROM TB_membro WHERE ID_membro = 5),
    (SELECT ID_PROJETO FROM TB_PROJETO WHERE ID_PROJETO = 1),
    (SELECT ID_LIDER FROM TB_LIDER WHERE ID_LIDER = 1));


