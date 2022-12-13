-- Esse Script é responsável por fazer o povoamento artificial do Banco de Dados para poder realizar testes de consultas e checar se o banco está funcionando de maneira esperada

-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian WIDmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires

------------------------------------SCRIPT PARA DELETAR TODOS OS DADOS DE TODAS AS TABELAS------------------------------------

-- do
-- $$
-- declare
--   l_stmt text;
-- begin
--   select 'truncate ' || string_agg(format('%I.%I', schemaname, tablename), ',')
--     into l_stmt
--   from pg_tables
--   where schemaname in ('public');

--   execute l_stmt;
-- end;
-- $$


--POVOAMENTO DA 1 CONSULTA

------------------------------------FORMATACAO DATA------------------------------------

--ALTER DATABASE "NOMEDOBANCO" SET datestyle TO "ISO, DMY";
------------------------------------ASSUNTO------------------------------------
INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Teoria dos Grafos');

INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Pilha');

INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Fila');

INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Árvore');

INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Lógica de Programação');

INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('WebDev');

INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Inteligência Artificial');
    
INSERT INTO 
    TB_assunto
    (assunto)
VALUES
    ('Banco de Dados');

------------------------------------CATEGORIA_IMAGEM------------------------------------
INSERT INTO 
    TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('Foto de Membro');

INSERT INTO 
    TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('Foto');

INSERT INTO 
    TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('Capa de Projeto');

INSERT INTO 
    TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('Documentação');

INSERT INTO 
    TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('FluxoGrama');

INSERT INTO 
    TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('Gráfico');

INSERT INTO 
TB_categoria_imagem
    (nome_categoria_imagem)
VALUES
    ('Logo');
------------------------------------PAIS------------------------------------
INSERT INTO
    TB_pais
    (nome_pais)
VALUES
    ('Brasil');

INSERT INTO
    TB_pais
    (nome_pais)
VALUES
    ('Alemanha');

INSERT INTO
    TB_pais
    (nome_pais)
VALUES
    ('França');

INSERT INTO
    TB_pais
    (nome_pais)
VALUES
    ('Noruega');

INSERT INTO
    TB_pais
    (nome_pais)
VALUES
    ('Japão');
    
------------------------------------IMAGEM------------------------------------

INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, imagem, nome_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Esquema de tabelas que compôem o o Banco de Dados do Clube de Programação','01-09-2022', bytea('../Documentation/modelo_relacional_clube_programacao.jpg'), 'Modelo Relacional do Banco de Dados do Clube');



INSERT INTO 
    TB_imagem
    (ID_categoria_imagem, descricao_imagem, DT_imagem, imagem, nome_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Esquema concentual de construção do Banco de Dados do Clube', '01-09-2022', bytea('../Documentation/modelo_conceitual_clube_programacao.jpg'), 'Modelo Conceitual do Banco de Dados do Clube');

-- 1
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Antônio Horácio','01-09-2022', 'FT_membro_Antonio_Horacio', 'https://drive.google.com/uc?export=view&id=17mscIXTo5WaapnTOQPGZI2r1P7k9Kr51');
    

-- 2
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Felipe Leão','01-09-2022', 'FT_membro_Felipe_Leao', 'https://drive.google.com/uc?export=view&id=1jwsfW1s-4YSTOCoqj_sHA8SEGpQnFt-T');

-- 3
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Fernando Schettini','01-09-2022', 'FT_membro_Fernando_Schettini', 'https://drive.google.com/uc?export=view&id=14VD8zwwk5TdNHy-uU7GObFDGgqXu5QZF');

-- 4
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Luiz Guilherme','01-09-2022', 'FT_membro_Luiz_Guilherme', 'https://drive.google.com/uc?export=view&id=1P75mL_1uNMcQquvhlmYktQR1cjDCKqaQ');

-- 5
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Marcio Soussa','01-09-2022', 'FT_membro_Marcio_Soussa', 'https://drive.google.com/uc?export=view&id=1nI3KrQVdiYtQPMnxq1kRhv3EjM-MYjOZ');

-- 6
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Maria Eduarda Brito','01-09-2022', 'FT_membro_Maria_Eduarda', 'https://drive.google.com/uc?export=view&id=1y2FCDNOobPoue7mFlPQPvqoBLZe1ELZ3');

-- 7
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro') ), 'Foto do membro Orlando Mota','01-09-2022', 'FT_membro_Orlando_Mota', 'https://drive.google.com/uc?export=view&id=12gZYpt51vfCuOEbnuP0c-ZpYBmki86X5');

-- 8
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro')), 'Foto do membro Pedro Barros','01-09-2022', 'FT_membro_Pedro_Barros', 'https://drive.google.com/uc?export=view&id=1cypEMmBP7Ea5vwvEE6HEG1yICeTWQqEy');

-- 9
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto de Membro')), 'Foto do membro Pedro Felipe Facundes','01-09-2022', 'FT_membro_Pedro_Facundes', 'https://drive.google.com/uc?export=view&id=1R6GWLISMvtSV0SZxFDB4ROOg_a0ExIMv');

-- 10
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto') ), 'Foto da administração do Clube de Programação com professor e orientador Márcio Soussa','01-09-2022', 'FT_adm_clube_2', 'https://drive.google.com/uc?export=view&id=18UcyunlRHKRBYGcUPudYl3RQbC3meact');

-- 11
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Foto') ), 'Foto da administração do Clube de Programação','01-09-2022', 'FT_adm_clube', 'https://drive.google.com/uc?export=view&id=1nR5T1Giq06gaaw0rDVkf7aY5-i-0Sau7');

-- 12
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Capa de Projeto') ), 'Capa do projeto de Algoritmos e estruturas de dados','01-09-2022', 'CAPA_projeto_aed', 'https://drive.google.com/uc?export=view&id=1rGCJaW4F0V8U9YTE4YKTK7lEDQ_EB9el');

-- 13
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Capa de Projeto') ), 'Capa do projeto de Introdução a algoritmos','01-09-2022', 'CAPA_projeto_aula_algoritmos', 'https://drive.google.com/uc?export=view&id=1oIvueM34_8H4SOfnFYeyfrbz5n4PZ1zP');

-- 14
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Capa de Projeto') ), 'Capa do projeto do Banco de dados do Clube de Programação','01-09-2022', 'CAPA_projeto_banco_de_dados', 'https://drive.google.com/uc?export=view&id=17wyEMAfjtHHUknfrT3duPKPIYS_CcuoU');

-- 15
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Capa de Projeto') ), 'Capa do projeto da primeira Semana de computação', '01-09-2022', 'CAPA_projeto_semana_computacao', 'https://drive.google.com/uc?export=view&id=1mdrryMslOaWjet5cqaPijEuLXiTVUBWn');

-- 16
INSERT INTO 
    TB_imagem
	(ID_categoria_imagem, descricao_imagem, DT_imagem, nome_imagem, URL_imagem)
VALUES
    ((select id_categoria_imagem from tb_categoria_imagem where UPPER(nome_categoria_imagem) = UPPER('Capa de Projeto') ), 'Capa do projeto do Site do Clube de Programação','01-09-2022', 'CAPA_projeto_site_clube', 'https://drive.google.com/uc?export=view&id=102jzrhlC7gMw9vqGk6hKNzuC01e9B5YU');


------------------------------------CURSO------------------------------------
INSERT INTO
    TB_CURSO
    (nome_curso)
VALUES
    ('Engenharia de Computação');

INSERT INTO
    TB_CURSO
    (nome_curso)
VALUES
    ('Engenharia Mecânica');

INSERT INTO
    TB_CURSO
    (nome_curso)
VALUES
    ('Análise e Desenvolvimento de Sistemas');

INSERT INTO
    TB_CURSO
    (nome_curso)
VALUES
    ('Sistemas da Informação');

INSERT INTO
    TB_CURSO
    (nome_curso)
VALUES
    ('Ciência da Computação');

------------------------------------FUNCAO------------------------------------
INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Presidente','Cabeça do Clube', 100);

INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Vice-Presidente','Cabeça do Clube quando o cabeça falta', 60);

INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Gerente de Marketing','Gerencia o Marketing do Clube de Programação', 50);

INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Projetista','Realiza Projetos dentro do clube', 200);

INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Organizador de Atração','Organiza Atrações naquele evento', 100);

INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Palestrante','Palestra naquele evento', 80);

INSERT INTO
    TB_FUNCAO
    (NOME_FUNCAO, DESCRICAO_FUNCAO, ponto_jpq_maximo)
VALUES
    ('Marketing do Projeto','Realiza Marketing do projeto', 90);

------------------------------------ESTADO------------------------------------
INSERT INTO
    TB_ESTADO
    (ID_PAIS, nome_estado)
VALUES
    ((select id_pais from tb_pais where nome_pais = 'Brasil'),'Bahia');

------------------------------------CIDADE------------------------------------
INSERT INTO 
    TB_CIDADE
    (ID_ESTADO,nome_cidade)
VALUES
    ((SELECT id_estado from tb_estado where nome_estado = 'Bahia'),'Salvador');

------------------------------------LOGRADOURO------------------------------------
INSERT INTO 
    TB_LOGRADOURO
    (ID_CIDADE, CEP, nome_bairro, nome_rua, numero)
VALUES
    ((select id_cidade from tb_cidade where nome_cidade = 'Salvador'), '41650-010', 'Piata', 'Orlando Gomes', '1845');

------------------------------------LOCAL------------------------------------
INSERT INTO
    TB_local
    (ID_logradouro, descricao_local, nome_local)
VALUES
    ((SELECT ID_logradouro FROM TB_logradouro WHERE CEP = '41650-010' AND nome_bairro = 'Piata' AND nome_rua = 'Orlando Gomes' AND numero = '1845'), 'Centro de convenções de Salvador usado para realizar eventos', 'Centro de Convenções');
  
------------------------------------INSTITUICAO_ENSINO------------------------------------
INSERT INTO 
    TB_INSTITUICAO_ENSINO
    (id_local, nome_instituicao_ensino)
VALUES
    ((select id_local from tb_local where nome_local = 'Centro de Convenções'),'CIMATEC');

------------------------------------CURSO_INSITUICAO------------------------------------
INSERT INTO 
    TB_curso_instituicao
    (ID_CURSO, ID_INSTITUICAO)
VALUES
    ((select id_curso from tb_curso where nome_curso ='Engenharia de Computação'),(select id_instituicao_ensino from tb_instituicao_ensino where nome_instituicao_ensino='CIMATEC'));

----------------------OFICIO------------------------------------
INSERT INTO
    TB_oficio
    (nome_oficio)
VALUES
    ('Professor');

INSERT INTO
    TB_oficio
    (nome_oficio)
VALUES
    ('Estudante');
INSERT INTO
    TB_oficio
    (nome_oficio)
VALUES
    ('Estagiário Senior');
	
------------------------------------MEMBROS------------------------------------
INSERT INTO
	TB_MEMBRO
    (ID_curso_instituicao, ID_foto_membro, DT_nascimento, DT_ingresso_clube, DT_ingresso_faculdade, genero, nome_membro, ID_oficio)
VALUES
	((select ID_curso_instituicao from TB_curso_instituicao A, TB_curso B, TB_instituicao_ensino C WHERE A.ID_curso = B.ID_curso AND A.ID_instituicao = C.ID_instituicao_ensino AND B.nome_curso = 'Engenharia de Computação' AND C.nome_instituicao_ensino = 'CIMATEC'), 
     (select id_imagem from tb_imagem where nome_imagem = 'Modelo Relacional do Banco de Dados do Clube'),
     '14-08-2003','27-10-2021', '27-10-2021', 'M','Fernando Schettini',
     (select id_oficio from tb_oficio where nome_oficio = 'Estudante')
    );

INSERT INTO
	TB_MEMBRO
    (ID_curso_instituicao, ID_foto_membro, DT_nascimento, DT_ingresso_clube, DT_ingresso_faculdade, genero, nome_membro, ID_oficio)
VALUES
	((select ID_curso_instituicao from TB_curso_instituicao A, TB_curso B, TB_instituicao_ensino C WHERE A.ID_curso = B.ID_curso AND A.ID_instituicao = C.ID_instituicao_ensino AND B.nome_curso = 'Engenharia de Computação' AND C.nome_instituicao_ensino = 'CIMATEC'), 
     (select id_imagem from tb_imagem where nome_imagem = 'Modelo Relacional do Banco de Dados do Clube'),
     '24-12-2002','27-10-2021', '27-10-2021', 'M','Orlando Mota',
     (select id_oficio from tb_oficio where nome_oficio = 'Estudante')
    );

INSERT INTO
	TB_MEMBRO
    (ID_curso_instituicao, ID_foto_membro, DT_nascimento, DT_ingresso_clube, DT_ingresso_faculdade, genero, nome_membro, ID_oficio)
VALUES
	((select ID_curso_instituicao from TB_curso_instituicao A, 
 TB_curso B, TB_instituicao_ensino C WHERE A.ID_curso = B.ID_curso AND 
 A.ID_instituicao = C.ID_instituicao_ensino AND B.nome_curso = 'Engenharia de Computação' AND C.nome_instituicao_ensino = 'CIMATEC'), 
     (select id_imagem from tb_imagem where nome_imagem = 'Modelo Relacional do Banco de Dados do Clube'),
     '24-11-2001','27-10-2021', '27-10-2021', 'M','Antônio Horácio',
     (select id_oficio from tb_oficio where nome_oficio = 'Estudante')
    );

INSERT INTO
	TB_MEMBRO
    (ID_curso_instituicao, ID_foto_membro, DT_nascimento, DT_ingresso_clube, DT_ingresso_faculdade, genero, nome_membro, ID_oficio)
VALUES
	((select ID_curso_instituicao from TB_curso_instituicao A, TB_curso B, TB_instituicao_ensino C WHERE A.ID_curso = B.ID_curso AND 
 A.ID_instituicao = C.ID_instituicao_ensino AND B.nome_curso = 'Engenharia de Computação' AND C.nome_instituicao_ensino = 'CIMATEC'), 
     (select id_imagem from tb_imagem where nome_imagem = 'Modelo Relacional do Banco de Dados do Clube'),
     '04-12-1500','27-10-2021', '27-10-2021', 'M','Pedro Facundes',
     (select id_oficio from tb_oficio where nome_oficio = 'Estagiário Senior')
    );
     
------------------------------------LIDERES------------------------------------
INSERT INTO
    TB_LIDER
    (ID_membro, nome_lider)
VALUES
    ((SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Fernando Schettini'),'Fernando Schettini');

INSERT INTO
    TB_LIDER
	(ID_membro, nome_lider)
VALUES
    ((SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Orlando Mota'), 'Orlando Mota');

INSERT INTO
    TB_LIDER
	(ID_membro, nome_lider)
VALUES
    ((SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Antônio Horácio'), 'Antônio Horácio');

INSERT INTO
    TB_LIDER
	(ID_membro, nome_lider)
VALUES
    ((SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Pedro Facundes'), 'Pedro Facundes');

------------------------------------PLATAFORMA------------------------------------
INSERT INTO 
TB_plataforma
    (URL_plataforma, nome_plataforma)
VALUES
    ('www.beecrowd.com.br','beecrowd');

------------------------------------organizador------------------------------------
INSERT INTO 
    TB_organizador
    (nome_organizador, descricao_organizador)
VALUES
    ('SBC','SOCIEDADE BRASILEIRA DE COMPUTACAO, reponsável pelos computadores do Brasil');

------------------------------------TORNEIO------------------------------------
INSERT INTO
    TB_TORNEIO
    (ID_organizador, nome_torneio, DT_inicio, DT_termino )
VALUES
    ((SELECT ID_organizador FROM TB_organizador WHERE nome_organizador = 'SBC'), 'ICPC', '01-10-2022','01-10-2022');

------------------------------------Capitao------------------------------------
INSERT INTO
	TB_capitao
    (ID_membro, nome_capitao)
VALUES
	((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Fernando Schettini'),'Fernando Schettini');

------------------------------------EQUIPE------------------------------------
INSERT INTO
	TB_EQUIPE
    (ID_capitao, DT_criacao, nome_equipe)
VALUES
	((SELECT ID_capitao FROM TB_capitao WHERE nome_capitao = 'Fernando Schettini'),'05-11-2022','N-Laranjinhas');
	
------------------------------------EQUIPE_TORNEIO------------------------------------
INSERT INTO
	TB_EQUIPE_TORNEIO
    (ID_equipe, ID_torneio, colocacao)
VALUES
	((SELECT ID_EQUIPE FROM TB_EQUIPE WHERE nome_equipe = 'N-Laranjinhas'),(SELECT ID_TORNEIO FROM TB_TORNEIO WHERE nome_torneio = 'ICPC'), 2);

------------------------------------MEMBRO_EQUIPE------------------------------------
INSERT INTO
	TB_MEMBRO_EQUIPE
    (ID_equipe, ID_membro)
VALUES
    ((select ID_equipe from TB_equipe where nome_equipe = 'N-Laranjinhas'), (select ID_membro from TB_membro where nome_membro = 'Fernando Schettini'));

INSERT INTO
	TB_MEMBRO_EQUIPE
    (ID_equipe, ID_membro)
VALUES
    ((select ID_equipe from TB_equipe where nome_equipe = 'N-Laranjinhas'), (select ID_membro from TB_membro where nome_membro = 'Orlando Mota'));

INSERT INTO
	TB_MEMBRO_EQUIPE
    (ID_equipe, ID_membro)
VALUES
    ((select ID_equipe from TB_equipe where nome_equipe = 'N-Laranjinhas'), (select ID_membro from TB_membro where nome_membro = 'Antônio Horácio'));

INSERT INTO
	TB_MEMBRO_EQUIPE
    (ID_equipe, ID_membro)
VALUES
    ((select ID_equipe from TB_equipe where nome_equipe = 'N-Laranjinhas'), (select ID_membro from TB_membro where nome_membro = 'Pedro Facundes'));


------------------------------------TIPO_PROJETO------------------------------------
INSERT INTO
    TB_tipo_projeto
    (tipo)
VALUES
    ('WorkShop');

INSERT INTO
    TB_tipo_projeto
    (tipo)
VALUES
    ('Aula');

INSERT INTO
    TB_tipo_projeto
    (tipo)
VALUES
    ('Maratona');

INSERT INTO
    TB_tipo_projeto
    (tipo)
VALUES
    ('Evento');

INSERT INTO
    TB_tipo_projeto
    (tipo)
VALUES
    ('Desenvolvimento de Produto');

------------------------------------PROJETO------------------------------------
INSERT INTO
    TB_projeto 
    (ID_tipo_projeto, ID_lider, ID_imagem_capa, descricao_projeto, DT_inicio, DT_termino_previsto, DT_termino, nome_projeto, ponto_jpq_maximo, URL_github)
VALUES
    ((SELECT ID_tipo_projeto FROM TB_tipo_projeto WHERE UPPER(tipo) = UPPER('Desenvolvimento de Produto') ), 
     (SELECT ID_lider FROM TB_lider WHERE nome_lider = 'Fernando Schettini'),
     (SELECT ID_imagem FROM TB_imagem WHERE UPPER(nome_imagem) = UPPER('CAPA_projeto_banco_de_dados') ),
     'Desenvolvimento de um Banco de Dados para controle e gestão do clube de Programação', '02-02-2022', '02-02-2050', '02-02-2055','Banco de Dados Relacional', 100, 'https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database');


INSERT INTO
    TB_projeto
	(ID_tipo_projeto, ID_lider, ID_imagem_capa, descricao_projeto, DT_inicio, DT_termino_previsto, DT_termino, nome_projeto, ponto_jpq_maximo, URL_github)
VALUES
	((SELECT ID_tipo_projeto FROM TB_tipo_projeto WHERE UPPER(tipo) = UPPER('Evento') ),
     (SELECT ID_lider FROM TB_lider WHERE nome_lider = 'Fernando Schettini'),
     (SELECT ID_imagem FROM TB_imagem WHERE UPPER(nome_imagem) = UPPER('CAPA_projeto_semana_computacao') ),
     'Realização da Semana de Computação, para o curso de Engenharia de Computação', '14-08-2022', '22-11-2022', '22-11-2025','Primeira Semana de Computação', 150, 'https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database');


INSERT INTO
    TB_projeto 
    (ID_tipo_projeto, ID_lider, ID_imagem_capa, descricao_projeto, DT_inicio, DT_termino_previsto, DT_termino, nome_projeto, ponto_jpq_maximo, URL_github)
VALUES
    ((SELECT ID_tipo_projeto FROM TB_tipo_projeto WHERE UPPER(tipo) = UPPER('workshop') ), 
     (SELECT ID_lider FROM TB_lider WHERE nome_lider = 'Orlando Mota'),
     (SELECT ID_imagem FROM TB_imagem WHERE UPPER(nome_imagem) = UPPER('CAPA_projeto_aula_algoritmos') ),
     'Desenvolvimento de aulas para os calouros para suprir uma necessidade deles de ter mais aulas de programação', 
     '02-05-2022', '21-11-2022', '21-11-2028', 'Introducao a algoritmos', 100, 'https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database');


INSERT INTO
    TB_projeto 
    (ID_tipo_projeto, ID_lider, ID_imagem_capa, descricao_projeto, DT_inicio, DT_termino_previsto, DT_termino, nome_projeto, ponto_jpq_maximo, URL_github)
VALUES
    ((SELECT ID_tipo_projeto FROM TB_tipo_projeto WHERE UPPER(tipo) = UPPER('Desenvolvimento de Produto') ), 
     (SELECT ID_lider FROM TB_lider WHERE nome_lider = 'Pedro Facundes'),
     (SELECT ID_imagem FROM TB_imagem WHERE UPPER(nome_imagem) = UPPER('CAPA_projeto_site_clube') ),
     'Desenvolvimento de um site para divulgação e gestão do Clube de Programação, integrando o Banco de Dados', 
     '15-06-2022', '30-11-2022', '30-11-2024', 'Site do Clube de Programação', 100, 'https://github.com/ClubeProgramacaoSSA/Back-End-Site-Clube-de-Programacao');


INSERT INTO
    TB_projeto 
    (ID_tipo_projeto, ID_lider, ID_imagem_capa, descricao_projeto, DT_inicio, DT_termino_previsto, DT_termino, nome_projeto, ponto_jpq_maximo, URL_github)
VALUES
    ((SELECT ID_tipo_projeto FROM TB_tipo_projeto WHERE UPPER(tipo) = UPPER('workshop') ), 
     (SELECT ID_lider FROM TB_lider WHERE nome_lider = 'Fernando Schettini'),
     (SELECT ID_imagem FROM TB_imagem WHERE UPPER(nome_imagem) = UPPER('CAPA_projeto_aed') ),
     'Desenvolvimento de aulas de reforço para os alunos de AED (Algoritmos e estruturas de dados)', 
     '15-06-2022', '30-11-2022', '30-11-2024', 'Projeto AED', 100, 'https://github.com/ClubeProgramacaoSSA/Back-End-Site-Clube-de-Programacao');
  
------------------------------------ENCONTRO------------------------------------
INSERT INTO 
    TB_encontro
    (ID_organizador, ID_projeto, DT_inicio, DT_termino)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Fernando Schettini'),(SELECT ID_PROJETO FROM TB_PROJETO WHERE nome_projeto = 'Site do Clube de Programação'), '05-11-2022','05-11-2022');

INSERT INTO
    TB_encontro
    (ID_organizador, ID_projeto, DT_inicio, DT_termino)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Orlando Mota'),(SELECT ID_PROJETO FROM TB_PROJETO WHERE nome_projeto = 'Primeira Semana de Computação'),'25-10-2022','25-10-2022');

------------------------------------PRESENCA_ENCONTRO------------------------------------
INSERT INTO 
    TB_presenca_encontro 
    (ID_encontro, ID_membro)
VALUES
    ((SELECT ID_encontro FROM TB_encontro A, TB_projeto B WHERE A.ID_PROJETO = B.ID_projeto AND A.DT_inicio = '2022-11-05' AND B.nome_projeto = 'Site do Clube de Programação'),
     (SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Fernando Schettini'));
     
INSERT INTO 
    TB_presenca_encontro 
    (ID_encontro, ID_membro)
VALUES
    ((SELECT ID_encontro FROM TB_encontro A, TB_projeto B WHERE A.ID_PROJETO = B.ID_projeto AND A.DT_inicio = '2022-11-05' AND B.nome_projeto = 'Site do Clube de Programação'),
     (SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Orlando Mota'));

INSERT INTO 
    TB_presenca_encontro 
    (ID_encontro, ID_membro)
VALUES
    ((SELECT ID_encontro FROM TB_encontro A, TB_projeto B WHERE A.ID_PROJETO = B.ID_projeto AND A.DT_inicio = '2022-11-05' AND B.nome_projeto = 'Site do Clube de Programação'),
     (SELECT ID_MEMBRO FROM TB_MEMBRO WHERE nome_membro = 'Pedro Facundes'));

----------------------MEMBRO_PROJETO------------------------------------

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Fernando Schettini'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Primeira Semana de Computação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Orlando Mota'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Primeira Semana de Computação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Antônio Horácio'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Primeira Semana de Computação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Pedro Facundes'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Primeira Semana de Computação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

    
INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Fernando Schettini'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Site do Clube de Programação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Orlando Mota'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Site do Clube de Programação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Antônio Horácio'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Site do Clube de Programação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_membro_projeto
    (ID_membro, ID_projeto, ID_funcao, DT_entrada_projeto, DT_saida_projeto)
VALUES
    ((SELECT ID_membro FROM TB_membro WHERE nome_membro = 'Pedro Facundes'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Site do Clube de Programação'),
    (SELECT ID_funcao FROM TB_funcao WHERE nome_funcao = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

----------------------IMAGEM_PROJETO------------------------------------
INSERT INTO
    TB_imagem_projeto
    (ID_imagem, ID_projeto)
VALUES
    ((SELECT ID_imagem FROM TB_imagem WHERE nome_imagem = 'Modelo Conceitual do Banco de Dados do Clube'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Site do Clube de Programação'));

INSERT INTO
    TB_imagem_projeto
    (ID_imagem, ID_projeto)
VALUES
    ((SELECT ID_imagem FROM TB_imagem WHERE nome_imagem = 'Modelo Conceitual do Banco de Dados do Clube'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Primeira Semana de Computação'));

INSERT INTO
    TB_imagem_projeto
    (ID_imagem, ID_projeto)
VALUES
    ((SELECT ID_imagem FROM TB_imagem WHERE nome_imagem = 'Modelo Conceitual do Banco de Dados do Clube'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Banco de Dados Relacional'));

----------------------ASSUNTO_PROJETO------------------------------------

INSERT INTO
    TB_assunto_projeto
    (ID_assunto, ID_projeto)
VALUES
    ((SELECT ID_assunto FROM TB_assunto WHERE assunto = 'Teoria dos Grafos'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Banco de Dados Relacional'));

INSERT INTO
    TB_assunto_projeto
    (ID_assunto, ID_projeto)
VALUES
    ((SELECT ID_assunto FROM TB_assunto WHERE assunto = 'Pilha'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Site do Clube de Programação'));

INSERT INTO
    TB_assunto_projeto
    (ID_assunto, ID_projeto)
VALUES
    ((SELECT ID_assunto FROM TB_assunto WHERE assunto = 'Árvore'),
    (SELECT ID_projeto FROM TB_projeto WHERE nome_projeto = 'Primeira Semana de Computação'));