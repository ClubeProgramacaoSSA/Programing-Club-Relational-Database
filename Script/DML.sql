-- This Script is responsible for adding content to the Relational Database tables.

-- Available at https://github.com/clubProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian Widmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires

------------------------------------SCRIPT TO DELETE ALL DATA FROM ALL TABLES------------------------------------

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


------------------------------------DATA FORMAT------------------------------------

--ALTER DATABASE "DASDAS" SET datestyle TO "ISO, DMY";
------------------------------------subject------------------------------------
INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Teoria dos Grafos');

INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Pilha');

INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Fila');

INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Árvore');

INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Lógica de Programação');

INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('WebDev');

INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Inteligência Artificial');
    
INSERT INTO 
    TB_subject
    (subject)
VALUES
    ('Banco de Dados');

------------------------------------IMAGE_CATEGORY------------------------------------
INSERT INTO 
    TB_image_category
    (image_category_name)
VALUES
    ('Foto de Membro');

INSERT INTO 
    TB_image_category
    (image_category_name)
VALUES
    ('Foto');

INSERT INTO 
    TB_image_category
    (image_category_name)
VALUES
    ('Capa de Projeto');

INSERT INTO 
    TB_image_category
    (image_category_name)
VALUES
    ('Documentação');

INSERT INTO 
    TB_image_category
    (image_category_name)
VALUES
    ('FluxoGrama');

INSERT INTO 
    TB_image_category
    (image_category_name)
VALUES
    ('Gráfico');

INSERT INTO 
TB_image_category
    (image_category_name)
VALUES
    ('Logo');
------------------------------------COUNTRY------------------------------------
INSERT INTO
    TB_country
    (country_name)
VALUES
    ('Brasil');

INSERT INTO
    TB_country
    (country_name)
VALUES
    ('Alemanha');

INSERT INTO
    TB_country
    (country_name)
VALUES
    ('França');

INSERT INTO
    TB_country
    (country_name)
VALUES
    ('Noruega');

INSERT INTO
    TB_country
    (country_name)
VALUES
    ('Japão');
    
------------------------------------image------------------------------------

INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image, image_name)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Esquema de tabelas que compôem o o Banco de Dados do Clube de Programação','01-09-2022', bytea('../Documentation/modelo_relacional_clube_programacao.jpg'), 'Modelo Relacional do Banco de Dados do Clube');

INSERT INTO 
    TB_image
    (ID_image_category, image_description, DT_image, image, image_name)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Esquema concentual de construção do Banco de Dados do Clube', '01-09-2022', bytea('../Documentation/modelo_conceitual_clube_programacao.jpg'), 'Modelo Conceitual do Banco de Dados do Clube');

-- 1
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Antônio Horácio','01-09-2022', 'FT_member_Antonio_Horacio', 'https://drive.google.com/uc?export=view&id=17mscIXTo5WaapnTOQPGZI2r1P7k9Kr51');
    

-- 2
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Felipe Leão','01-09-2022', 'FT_member_Felipe_Leao', 'https://drive.google.com/uc?export=view&id=1jwsfW1s-4YSTOCoqj_sHA8SEGpQnFt-T');

-- 3
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Fernando Schettini','01-09-2022', 'FT_member_Fernando_Schettini', 'https://drive.google.com/uc?export=view&id=14VD8zwwk5TdNHy-uU7GObFDGgqXu5QZF');

-- 4
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Luiz Guilherme','01-09-2022', 'FT_member_Luiz_Guilherme', 'https://drive.google.com/uc?export=view&id=1P75mL_1uNMcQquvhlmYktQR1cjDCKqaQ');

-- 5
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Marcio Soussa','01-09-2022', 'FT_member_Marcio_Soussa', 'https://drive.google.com/uc?export=view&id=1nI3KrQVdiYtQPMnxq1kRhv3EjM-MYjOZ');

-- 6
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Maria Eduarda Brito','01-09-2022', 'FT_member_Maria_Eduarda', 'https://drive.google.com/uc?export=view&id=1y2FCDNOobPoue7mFlPQPvqoBLZe1ELZ3');

-- 7
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro') ), 'Foto do membro Orlando Mota','01-09-2022', 'FT_member_Orlando_Mota', 'https://drive.google.com/uc?export=view&id=12gZYpt51vfCuOEbnuP0c-ZpYBmki86X5');

-- 8
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro')), 'Foto do membro Pedro Barros','01-09-2022', 'FT_member_Pedro_Barros', 'https://drive.google.com/uc?export=view&id=1cypEMmBP7Ea5vwvEE6HEG1yICeTWQqEy');

-- 9
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto de Membro')), 'Foto do membro Pedro Felipe Facundes','01-09-2022', 'FT_member_Pedro_Facundes', 'https://drive.google.com/uc?export=view&id=1R6GWLISMvtSV0SZxFDB4ROOg_a0ExIMv');

-- 10
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto') ), 'Foto da administração do Clube de Programação com professor e orientador Márcio Soussa','01-09-2022', 'FT_adm_clube_2', 'https://drive.google.com/uc?export=view&id=18UcyunlRHKRBYGcUPudYl3RQbC3meact');

-- 11
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Foto') ), 'Foto da administração do Clube de Programação','01-09-2022', 'FT_adm_clube', 'https://drive.google.com/uc?export=view&id=1nR5T1Giq06gaaw0rDVkf7aY5-i-0Sau7');

-- 12
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Capa de Projeto') ), 'Capa do projeto de Algoritmos e estruturas de dados','01-09-2022', 'CAPA_project_aed', 'https://drive.google.com/uc?export=view&id=1rGCJaW4F0V8U9YTE4YKTK7lEDQ_EB9el');

-- 13
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Capa de Projeto') ), 'Capa do projeto de Introdução a algoritmos','01-09-2022', 'CAPA_project_aula_algoritmos', 'https://drive.google.com/uc?export=view&id=1oIvueM34_8H4SOfnFYeyfrbz5n4PZ1zP');

-- 14
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Capa de Projeto') ), 'Capa do projeto do Banco de dados do Clube de Programação','01-09-2022', 'CAPA_project_banco_de_dados', 'https://drive.google.com/uc?export=view&id=17wyEMAfjtHHUknfrT3duPKPIYS_CcuoU');

-- 15
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Capa de Projeto') ), 'Capa do projeto da primeira Semana de computação', '01-09-2022', 'CAPA_project_semana_computacao', 'https://drive.google.com/uc?export=view&id=1mdrryMslOaWjet5cqaPijEuLXiTVUBWn');

-- 16
INSERT INTO 
    TB_image
	(ID_image_category, image_description, DT_image, image_name, URL_image)
VALUES
    ((select id_image_category from tb_image_category where UPPER(image_category_name) = UPPER('Capa de Projeto') ), 'Capa do projeto do Site do Clube de Programação','01-09-2022', 'CAPA_project_site_clube', 'https://drive.google.com/uc?export=view&id=102jzrhlC7gMw9vqGk6hKNzuC01e9B5YU');


------------------------------------COURSE------------------------------------
INSERT INTO
    TB_COURSE
    (course_name)
VALUES
    ('Engenharia de Computação');

INSERT INTO
    TB_COURSE
    (course_name)
VALUES
    ('Engenharia Mecânica');

INSERT INTO
    TB_COURSE
    (course_name)
VALUES
    ('Análise e Desenvolvimento de Sistemas');

INSERT INTO
    TB_COURSE
    (course_name)
VALUES
    ('Sistemas da Informação');

INSERT INTO
    TB_COURSE
    (course_name)
VALUES
    ('Ciência da Computação');

------------------------------------function------------------------------------
INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Presidente','Cabeça do Clube', 100);

INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Vice-Presidente','Cabeça do Clube quando o cabeça falta', 60);

INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Gerente de Marketing','Gerencia o Marketing do Clube de Programação', 50);

INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Projetista','Realiza Projetos dentro do clube', 200);

INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Organizador de Atração','Organiza Atrações naquele evento', 100);

INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Palestrante','Palestra naquele evento', 80);

INSERT INTO
    TB_function
    (function_name, function_description, max_jpq_score)
VALUES
    ('Marketing do Projeto','Realiza Marketing do projeto', 90);

------------------------------------STATE------------------------------------
INSERT INTO
    TB_STATE
    (ID_country, state_name)
VALUES
    ((select id_country from tb_country where country_name = 'Brasil'),'Bahia');

------------------------------------CITY------------------------------------
INSERT INTO 
    TB_CITY
    (ID_STATE, city_name)
VALUES
    ((SELECT id_STATE from tb_STATE where state_name = 'Bahia'),'Salvador');

------------------------------------PUBLIC_PLACE------------------------------------
INSERT INTO 
    TB_PUBLIC_PLACE
    (ID_CITY, CEP, district_name, street_name, number)
VALUES
    ((select id_CITY from tb_CITY where city_name = 'Salvador'), '41650-010', 'Piata', 'Orlando Gomes', '1845');

------------------------------------place------------------------------------
INSERT INTO
    TB_place
    (ID_PUBLIC_PLACE, place_description, place_name)
VALUES
    ((SELECT ID_PUBLIC_PLACE FROM TB_PUBLIC_PLACE WHERE CEP = '41650-010' AND district_name = 'Piata' AND street_name = 'Orlando Gomes' AND number = '1845'), 'Centro de convenções de Salvador usado para realizar eventos', 'Centro de Convenções');
  
------------------------------------education_institution------------------------------------
INSERT INTO 
    TB_education_institution
    (id_place, education_institution_name)
VALUES
    ((select id_place from tb_place where place_name = 'Centro de Convenções'),'CIMATEC');

------------------------------------COURSE_INSITUICAO------------------------------------
INSERT INTO 
    TB_institution_course
    (ID_COURSE, ID_institution)
VALUES
    ((select id_COURSE from tb_COURSE where course_name ='Engenharia de Computação'),(select id_education_institution from tb_education_institution where education_institution_name='CIMATEC'));

----------------------occupation------------------------------------
INSERT INTO
    TB_occupation
    (occupation_name)
VALUES
    ('Professor');

INSERT INTO
    TB_occupation
    (occupation_name)
VALUES
    ('Estudante');
INSERT INTO
    TB_occupation
    (occupation_name)
VALUES
    ('Estagiário Senior');
	
------------------------------------MEMBROS------------------------------------
INSERT INTO
	TB_member
    (ID_institution_course, ID_member_photo, DT_birth, DT_club_entrance, DT_college_entrance, gender, member_name, ID_occupation)
VALUES
	((select ID_institution_course from TB_institution_course A, TB_COURSE B, TB_education_institution C WHERE A.ID_COURSE = B.ID_COURSE AND A.ID_institution = C.ID_education_institution AND B.course_name = 'Engenharia de Computação' AND C.education_institution_name = 'CIMATEC'), 
     (select id_image from tb_image where image_name = 'Modelo Relacional do Banco de Dados do Clube'),
     '14-08-2003','27-10-2021', '27-10-2021', 'M','Fernando Schettini',
     (select id_occupation from tb_occupation where occupation_name = 'Estudante')
    );

INSERT INTO
	TB_member
    (ID_institution_course, ID_member_photo, DT_birth, DT_club_entrance, DT_college_entrance, gender, member_name, ID_occupation)
VALUES
	((select ID_institution_course from TB_institution_course A, TB_COURSE B, TB_education_institution C WHERE A.ID_COURSE = B.ID_COURSE AND A.ID_institution = C.ID_education_institution AND B.course_name = 'Engenharia de Computação' AND C.education_institution_name = 'CIMATEC'), 
     (select id_image from tb_image where image_name = 'Modelo Relacional do Banco de Dados do Clube'),
     '24-12-2002','27-10-2021', '27-10-2021', 'M','Orlando Mota',
     (select id_occupation from tb_occupation where occupation_name = 'Estudante')
    );

INSERT INTO
	TB_member
    (ID_institution_course, ID_member_photo, DT_birth, DT_club_entrance, DT_college_entrance, gender, member_name, ID_occupation)
VALUES
	((select ID_institution_course from TB_institution_course A, 
 TB_COURSE B, TB_education_institution C WHERE A.ID_COURSE = B.ID_COURSE AND 
 A.ID_institution = C.ID_education_institution AND B.course_name = 'Engenharia de Computação' AND C.education_institution_name = 'CIMATEC'), 
     (select id_image from tb_image where image_name = 'Modelo Relacional do Banco de Dados do Clube'),
     '24-11-2001','27-10-2021', '27-10-2021', 'M','Antônio Horácio',
     (select id_occupation from tb_occupation where occupation_name = 'Estudante')
    );

INSERT INTO
	TB_member
    (ID_institution_course, ID_member_photo, DT_birth, DT_club_entrance, DT_college_entrance, gender, member_name, ID_occupation)
VALUES
	((select ID_institution_course from TB_institution_course A, TB_COURSE B, TB_education_institution C WHERE A.ID_COURSE = B.ID_COURSE AND 
 A.ID_institution = C.ID_education_institution AND B.course_name = 'Engenharia de Computação' AND C.education_institution_name = 'CIMATEC'), 
     (select id_image from tb_image where image_name = 'Modelo Relacional do Banco de Dados do Clube'),
     '04-12-1500','27-10-2021', '27-10-2021', 'M','Pedro Facundes',
     (select id_occupation from tb_occupation where occupation_name = 'Estagiário Senior')
    );
     
------------------------------------leaderES------------------------------------
INSERT INTO
    TB_leader
    (ID_member, leader_name)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'),'Fernando Schettini');

INSERT INTO
    TB_leader
	(ID_member, leader_name)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Orlando Mota'), 'Orlando Mota');

INSERT INTO
    TB_leader
	(ID_member, leader_name)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Antônio Horácio'), 'Antônio Horácio');

INSERT INTO
    TB_leader
	(ID_member, leader_name)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Pedro Facundes'), 'Pedro Facundes');

------------------------------------platform------------------------------------
INSERT INTO 
TB_platform
    (URL_platform, platform_name)
VALUES
    ('www.beecrowd.com.br','beecrowd');

------------------------------------organizer------------------------------------
INSERT INTO 
    TB_organizer
    (organizer_name, organizer_description)
VALUES
    ('SBC','SOCIEDADE BRASILEIRA DE COMPUTACAO, reponsável pelos computadores do Brasil');

------------------------------------tournament------------------------------------
INSERT INTO
    TB_tournament
    (ID_organizer, tournament_name, DT_start, DT_end )
VALUES
    ((SELECT ID_organizer FROM TB_organizer WHERE organizer_name = 'SBC'), 'ICPC', '01-10-2022','01-10-2022');

------------------------------------captain------------------------------------
INSERT INTO
	TB_captain
    (ID_member, captain_name)
VALUES
	((SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'),'Fernando Schettini');

------------------------------------team------------------------------------
INSERT INTO
	TB_team
    (ID_captain, DT_creation, team_name)
VALUES
	((SELECT ID_captain FROM TB_captain WHERE captain_name = 'Fernando Schettini'),'05-11-2022','N-Laranjinhas');
	
------------------------------------tournament_team------------------------------------
INSERT INTO
	TB_tournament_team
    (ID_team, ID_tournament, team_placing)
VALUES
	((SELECT ID_team FROM TB_team WHERE team_name = 'N-Laranjinhas'),(SELECT ID_tournament FROM TB_tournament WHERE tournament_name = 'ICPC'), 2);

------------------------------------MEMBRO_team------------------------------------
INSERT INTO
	TB_member_team
    (ID_team, ID_member)
VALUES
    ((select ID_team from TB_team where team_name = 'N-Laranjinhas'), (select ID_member from TB_member where member_name = 'Fernando Schettini'));

INSERT INTO
	TB_member_team
    (ID_team, ID_member)
VALUES
    ((select ID_team from TB_team where team_name = 'N-Laranjinhas'), (select ID_member from TB_member where member_name = 'Orlando Mota'));

INSERT INTO
	TB_member_team
    (ID_team, ID_member)
VALUES
    ((select ID_team from TB_team where team_name = 'N-Laranjinhas'), (select ID_member from TB_member where member_name = 'Antônio Horácio'));

INSERT INTO
	TB_member_team
    (ID_team, ID_member)
VALUES
    ((select ID_team from TB_team where team_name = 'N-Laranjinhas'), (select ID_member from TB_member where member_name = 'Pedro Facundes'));


------------------------------------project_type------------------------------------
INSERT INTO
    TB_project_type
    (project_type)
VALUES
    ('WorkShop');

INSERT INTO
    TB_project_type
    (project_type)
VALUES
    ('Aula');

INSERT INTO
    TB_project_type
    (project_type)
VALUES
    ('Maratona');

INSERT INTO
    TB_project_type
    (project_type)
VALUES
    ('Evento');

INSERT INTO
    TB_project_type
    (project_type)
VALUES
    ('Desenvolvimento de Produto');

------------------------------------PROJETO------------------------------------

INSERT INTO
    TB_project 
    (ID_project_type, ID_leader, ID_face_image, project_description, DT_start, DT_foreseen_end, DT_end, project_name, max_jpq_score, URL_github)
VALUES
    ((SELECT ID_project_type FROM TB_project_type WHERE UPPER(project_type) = UPPER('Desenvolvimento de Produto') ), 
     (SELECT ID_leader FROM TB_leader WHERE leader_name = 'Fernando Schettini'),
     (SELECT ID_image FROM TB_image WHERE UPPER(image_name) = UPPER('CAPA_project_banco_de_dados') ),
     'Desenvolvimento de um Banco de Dados para controle e gestão do clube de Programação', '02-02-2022', '02-02-2050', '02-02-2055','Banco de Dados Relacional', 100, 'https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database');


INSERT INTO
    TB_project
	(ID_project_type, ID_leader, ID_face_image, project_description, DT_start, DT_foreseen_end, DT_end, project_name, max_jpq_score)
VALUES
	((SELECT ID_project_type FROM TB_project_type WHERE UPPER(project_type) = UPPER('Evento') ),
     (SELECT ID_leader FROM TB_leader WHERE leader_name = 'Fernando Schettini'),
     (SELECT ID_image FROM TB_image WHERE UPPER(image_name) = UPPER('CAPA_project_semana_computacao') ),
     'Realização da Semana de Computação, para o COURSE de Engenharia de Computação', '14-08-2022', '22-11-2022', '22-11-2025','Primeira Semana de Computação', 150);


INSERT INTO
    TB_project 
    (ID_project_type, ID_leader, ID_face_image, project_description, DT_start, DT_foreseen_end, DT_end, project_name, max_jpq_score)
VALUES
    ((SELECT ID_project_type FROM TB_project_type WHERE UPPER(project_type) = UPPER('workshop') ), 
     (SELECT ID_leader FROM TB_leader WHERE leader_name = 'Orlando Mota'),
     (SELECT ID_image FROM TB_image WHERE UPPER(image_name) = UPPER('CAPA_project_aula_algoritmos') ),
     'Desenvolvimento de aulas para os calouros para suprir uma necessidade deles de ter mais aulas de programação', 
     '02-05-2022', '21-11-2022', '21-11-2028', 'Introducao a algoritmos', 100);


INSERT INTO
    TB_project 
    (ID_project_type, ID_leader, ID_face_image, project_description, DT_start, DT_foreseen_end, DT_end, project_name, max_jpq_score, URL_github)
VALUES
    ((SELECT ID_project_type FROM TB_project_type WHERE UPPER(project_type) = UPPER('Desenvolvimento de Produto') ), 
     (SELECT ID_leader FROM TB_leader WHERE leader_name = 'Pedro Facundes'),
     (SELECT ID_image FROM TB_image WHERE UPPER(image_name) = UPPER('CAPA_project_site_clube') ),
     'Desenvolvimento de um site para divulgação e gestão do Clube de Programação, integrando o Banco de Dados', 
     '15-06-2022', '30-11-2022', '30-11-2024', 'Site do Clube de Programação', 100, 'https://github.com/ClubeProgramacaoSSA/Back-End-Site-Clube-de-Programacao');


INSERT INTO
    TB_project 
    (ID_project_type, ID_leader, ID_face_image, project_description, DT_start, DT_foreseen_end, DT_end, project_name, max_jpq_score)
VALUES
    ((SELECT ID_project_type FROM TB_project_type WHERE UPPER(project_type) = UPPER('workshop') ), 
     (SELECT ID_leader FROM TB_leader WHERE leader_name = 'Fernando Schettini'),
     (SELECT ID_image FROM TB_image WHERE UPPER(image_name) = UPPER('CAPA_project_aed') ),
     'Desenvolvimento de aulas de reforço para os alunos de AED (Algoritmos e estruturas de dados)', 
     '15-06-2022', '30-11-2022', '30-11-2024', 'Projeto AED', 100);
  
------------------------------------ENCONTRO------------------------------------
INSERT INTO 
    TB_encounter
    (ID_organizer, ID_project, DT_start, DT_end)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'),(SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'), '05-11-2022','05-11-2022');

INSERT INTO
    TB_encounter
    (ID_organizer, ID_project, DT_start, DT_end)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Orlando Mota'),(SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'),'25-10-2022','25-10-2022');

------------------------------------PRESENCA_encounter------------------------------------
INSERT INTO 
    TB_encounter_attendance
    (ID_encounter, ID_member)
VALUES
    ((SELECT ID_encounter FROM TB_encounter A, TB_project B WHERE A.ID_project = B.ID_project AND A.DT_start = '2022-11-05' AND B.project_name = 'Site do Clube de Programação'),
     (SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'));
     
INSERT INTO 
    TB_encounter_attendance
    (ID_encounter, ID_member)
VALUES
    ((SELECT ID_encounter FROM TB_encounter A, TB_project B WHERE A.ID_project = B.ID_project AND A.DT_start = '2022-11-05' AND B.project_name = 'Site do Clube de Programação'),
     (SELECT ID_member FROM TB_member WHERE member_name = 'Orlando Mota'));

INSERT INTO 
    TB_encounter_attendance
    (ID_encounter, ID_member)
VALUES
    ((SELECT ID_encounter FROM TB_encounter A, TB_project B WHERE A.ID_project = B.ID_project AND A.DT_start = '2022-11-05' AND B.project_name = 'Site do Clube de Programação'),
     (SELECT ID_member FROM TB_member WHERE member_name = 'Pedro Facundes'));

----------------------MEMBRO_project------------------------------------

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Orlando Mota'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Antônio Horácio'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Pedro Facundes'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Organizador de Atração'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Orlando Mota'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Antônio Horácio'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

INSERT INTO
    TB_member_project
    (ID_member, ID_project, ID_function, DT_enter_project, DT_exit_project)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Pedro Facundes'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'),
    (SELECT ID_function FROM TB_function WHERE function_name = 'Projetista'),
    '14-09-2022',
    '22-11-2022');

----------------------project_image------------------------------------
INSERT INTO
    TB_project_image
    (ID_image, ID_project)
VALUES
    ((SELECT ID_image FROM TB_image WHERE image_name = 'Modelo Conceitual do Banco de Dados do Clube'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'));

INSERT INTO
    TB_project_image
    (ID_image, ID_project)
VALUES
    ((SELECT ID_image FROM TB_image WHERE image_name = 'Modelo Conceitual do Banco de Dados do Clube'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'));

INSERT INTO
    TB_project_image
    (ID_image, ID_project)
VALUES
    ((SELECT ID_image FROM TB_image WHERE image_name = 'Modelo Conceitual do Banco de Dados do Clube'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Banco de Dados Relacional'));

----------------------project_subject------------------------------------

INSERT INTO
    TB_project_subject
    (ID_subject, ID_project)
VALUES
    ((SELECT ID_subject FROM TB_subject WHERE subject = 'Teoria dos Grafos'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Banco de Dados Relacional'));

INSERT INTO
    TB_project_subject
    (ID_subject, ID_project)
VALUES
    ((SELECT ID_subject FROM TB_subject WHERE subject = 'Pilha'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Site do Clube de Programação'));

INSERT INTO
    TB_project_subject
    (ID_subject, ID_project)
VALUES
    ((SELECT ID_subject FROM TB_subject WHERE subject = 'Árvore'),
    (SELECT ID_project FROM TB_project WHERE project_name = 'Primeira Semana de Computação'));


----------------------TB_club_account------------------------------------

INSERT INTO
    TB_club_account
    (ID_member, login, jpq_score, password)
VALUES
    ((SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'),
    'nandin_ceo_google', 200, 'paocombanana');

----------------------TB_member_role---------------------------------

INSERT INTO
    TB_member_role
    (ID_role, ID_member, 
    DT_role_enter,
    DT_role_exit)
VALUES
    ((SELECT ID_function FROM TB_function WHERE function_name = 'Presidente'),(SELECT ID_member FROM TB_member WHERE member_name = 'Fernando Schettini'), '2022-11-05', null);


----------------------TB_score_transaction_type------------------------------------
INSERT INTO
    TB_score_transaction_type
    (score_transaction_type)
VALUES
    ('Depósito');

INSERT INTO
    TB_score_transaction_type
    (score_transaction_type)
VALUES
    ('Saque');

INSERT INTO
    TB_score_transaction_type
    (score_transaction_type)
VALUES
    ('Punição');