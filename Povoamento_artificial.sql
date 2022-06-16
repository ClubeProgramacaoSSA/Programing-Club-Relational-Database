-- Esse Script e responsavel para povoamento do Banco de dados de forma articicial, ele tem o objetivo de testar o banco, e suas funcionalidades.
    -- Disponivel em: https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian Widmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --João Pedro Moreira de Almeida Santos | GitHub: https://github.com/joao7878
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires


-- Inserindo na Tabela TB_membros:
INSERT INTO 
    TB_MEMBROS 
    (id_membro,nome,RA,genero,oficio,curso,cargo,dt_nascimento,faculdade,dt_ingresso_clube,dt_ingresso_faculdade) 
VALUES 
    (SQ_MEMBROS.nextVal,'Fernando Schettini',20A.752312,'M','Estudante','Eng. Computação','CEO','14 april 2002','Senai Cimatec','1 january 2021','1 january 2021');

INSERT INTO 
    TB_MEMBROS 
    (id_membro,nome,RA,genero,oficio,curso,cargo,dt_nascimento,faculdade,dt_ingresso_clube,dt_ingresso_faculdade) 
VALUES 
    (SQ_MEMBROS.nextVal,'Orlando Mota', 20A.752325,'M','Estudante','Eng. Computação','CEO','14 april 2002','Senai Cimatec','1 january 2021','1 january 2021');

-- Inserindo na Tabela TB_membro:
INSERT INTO 
    TB_MEMBROS 
    (id_membro, ID_foto, RA, genero,oficio,curso,cargo,dt_nascimento,faculdade,dt_ingresso_clube,dt_ingresso_faculdade)

-- Inserindo na Tabela TB_lider:
INSERT INTO 
    TB_LIDER 
    (id_lider, id_membro, nome_lider)
VALUES 
    (SQ_LIDER.nextVal, 1, 'Fernando Schettini');


-- Inserindo na Tabela TB_projetos:
INSERT INTO 
  TB_PROJETO (id_projeto, lider, descricao, DT_inicio, DT_fim_previsto, nome, URL_github) 
VALUES 
  (SQ_PROJETOS.nextVal, 1

-- Inserindo na Tabela TB_encontro
INSERT INTO 
    TB_ENCONTRO (id_encontro, organizador, id_projeto, DT_inicio, DT_fim) 
VALUES 
    (SQ_ENCONTROS.nextVal, 'Fernando Schettini', 