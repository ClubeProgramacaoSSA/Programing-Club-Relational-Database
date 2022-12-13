
-- Esse Script é responsável por criar objetos no banco de dados para otimização de algumas regras de negocio estabelecidas.

-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian Widmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires

-- IDEIAS DE REGRA DE NEGOCIO
    -- Gerar certificados auto
    -- Sistema de Triggers para preenchimento de movimentação pontos
        /*
            Criar uma tela para o gestor poder dar os pontos das pessoas de maneira individual e controlada, 
            divisão lógica para torneios, eventos, cargos, PE, jpq 
        */
        

CREATE OR REPLACE PROCEDURE PC_preenche_pontos(ID_tipo_movimentacao_ponto_PC INT,
ID_conta_clube_PC INT, quantidade_ponto_jqp_PC INT,
ID_procedencia_PC INT, associacao_movimentacao_PC TEXT, avaliacao_PC TEXT)
   AS $$

DECLARE 
    pontos_maximo_PC INT;
    dia_atual_PC DATE default current_date; 
    hora_atual_PC TIME default current_time; 

    ID_movimentacao_ponto_PC INT;
BEGIN   
    INSERT INTO 
        TB_movimentacao_ponto(ID_conta_clube, ID_tipo_movimentacao_ponto, quantidade_ponto_jpq, DT_transacao, HR_transacao) 
    VALUES 
        (ID_conta_clube_PC, ID_tipo_movimentacao_ponto_PC, quantidade_ponto_jqp_PC, dia_atual_PC, hora_atual_PC);
    
    CASE UPPER(associacao_movimentacao_PC)
    WHEN 'PROJETO' THEN
        SELECT ponto_jpq_maximo FROM TB_projeto WHERE id_procedencia_PC = ID_projeto INTO pontos_maximo_PC;

        SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto MP, TB_conta_clube CB
        WHERE MP.HR_transacao = hora_atual_PC 
            AND MP.DT_transacao = dia_atual_PC 
            AND CB.ID_conta_clube = MP.ID_conta_clube 
        INTO ID_movimentacao_ponto_PC;

        INSERT INTO
            TB_movimentacao_ponto_projeto(ID_movimentacao_ponto, ID_projeto, avaliacao_projeto) 
        VALUES 
            (ID_movimentacao_ponto_PC , ID_procedencia_PC, avaliacao_PC);

    WHEN 'CARGO' THEN
        SELECT ponto_jpq_maximo FROM TB_funcao WHERE ID_procedencia_PC = ID_funcao INTO pontos_maximo_PC;

        SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto MP ,TB_conta_clube CB
        WHERE MP.HR_transacao = hora_atual_PC AND MP.DT_transacao = dia_atual_PC AND  CB.ID_conta_clube = MP.ID_conta_clube
        INTO ID_movimentacao_ponto_PC;

        INSERT INTO 
            TB_movimentacao_ponto_cargo(ID_movimentacao_ponto, ID_projeto) 
        VALUES 
            (ID_movimentacao_ponto_PC, ID_procedencia_PC); 
    
    WHEN 'EVENTO' THEN
        SELECT ponto_jpq_maximo FROM TB_presenca_evento WHERE id_procedencia_PC = ID_presenca_evento INTO pontos_maximo_PC;
        
        SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto MP ,TB_conta_clube CB 
        WHERE MP.HR_transacao = hora_atual_PC AND MP.DT_transacao = dia_atual_PC AND  CB.ID_conta_clube = MP.ID_conta_clube
        INTO ID_movimentacao_ponto_PC;
        
        INSERT INTO 
            TB_movimentacao_ponto_evento(ID_movimentacao_ponto, ID_projeto) 
        VALUES 
            (ID_movimentacao_ponto_PC, ID_procedencia_PC);

    WHEN 'QUESTAO' THEN
        SELECT ponto_jpq_maximo FROM TB_questao WHERE id_procedencia = ID_questao INTO pontos_maximo_PC;
        

        SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto MP ,TB_conta_clube CB 
        WHERE MP.HR_transacao = hora_atual_PC AND MP.DT_transacao = dia_atual_PC AND  CB.ID_conta_clube = MP.ID_conta_clube
        INTO ID_movimentacao_ponto_PC;

        INSERT INTO
            TB_movimentacao_ponto_questao(ID_movimentacao_ponto, ID_projeto, avaliacao_projeto) 
        VALUES 
            (ID_movimentacao_ponto_PC , ID_procedencia_PC, avaliacao_PC);

    WHEN 'TORNEIO' THEN
        SELECT ponto_jpq_maximo FROM TB_equipe_torneio_fase WHERE id_procedencia_PC = ID_equipe_torneio_fase INTO pontos_maximo_PC;
        
        SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto MP ,TB_conta_clube CB 
        WHERE MP.HR_transacao = hora_atual_PC AND MP.DT_transacao = dia_atual_PC AND  CB.ID_conta_clube = MP.ID_conta_clube
        INTO ID_movimentacao_ponto_PC;

        INSERT INTO
            TB_movimentacao_ponto_torneio(ID_movimentacao_ponto, ID_projeto, avaliacao_projeto) 
        VALUES 
            (ID_movimentacao_ponto_PC , ID_procedencia_PC, avaliacao_PC);
    ELSE
        RAISE 'Tipo de movimentacao desconhecida.' USING ERRCODE = '23421';
    END CASE;

    IF quantidade_ponto_jqp_PC < 0 OR quantidade_ponto_jqp_PC > pontos_maximo_PC THEN
            RAISE 'Quantidade de pontos invalida.' USING ERRCODE = '23420';
    END IF;
    
END;    $$
LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE PC_gera_certificados(ID_membro_PC INT, URL_certificado_PC TEXT)
   AS $$

DECLARE 

    data_ingresso_clube_PC DATE;
    data_emissao DATE default current_date;

    pontos_total_membro INTEGER;
    descricao TEXT;
    funcoes TEXT;
    carga_horaria_PC INTEGER;
    
    cur_cargo_membro CURSOR for 
    SELECT F.nome_funcao  
    FROM TB_cargo_membro CM, TB_funcao F WHERE ID_membro_PC = CM.ID_membro AND F.ID_funcao = CM.ID_cargo;

    cargo_membro TEXT;

BEGIN

    SELECT  
        ponto_jpq
    FROM 
        TB_conta_clube CC 
    WHERE 
        ID_membro_PC = CC.ID_membro INTO pontos_total_membro;   
    
    -- Descrição do certificado de um membro, o qual contém as funções que o mesmo exerceu e a quantidade de horas adquiridas
    descricao := 'PARTICIPOU DO CLUBE DE PROGRAMACAO NA(S) FUNÇÃO(ÕES) DE';

    OPEN cur_cargo_membro;  
    LOOP
        FETCH cur_cargo_membro INTO cargo_membro; 
        EXIT WHEN NOT FOUND;
        descricao :=  descricao || ', ' || cargo_membro;
    END LOOP;
    
    SELECT M.dt_ingresso_clube FROM TB_membro M WHERE ID_membro_PC = M.ID_membro INTO data_ingresso_clube_PC;
    
    descricao := descricao || '. NO PERÍODO DE '  || to_char(data_ingresso_clube_PC, 'ddmmyyyy') || ' A ' || to_char(data_emissao, 'ddmmyyyy');
    carga_horaria_PC := pontos_total_membro/100;
    descricao := descricao || ' COM CARGA HORÁRIA DE ' || (carga_horaria_PC::numeric)::text; 
    descricao := descricao || ' HORAS, NO CENTRO UNIVERSITÁRIO SENAI CIMATEC';

    INSERT INTO TB_certificado
        (ID_membro, descricao_certificado, DT_emissao, horas, pontos_meta, URL_certificado)
    VALUES
        (ID_membro_PC, descricao, data_emissao, carga_horaria_PC, pontos_total_membro, URL_certificado_PC);

END;   $$
LANGUAGE plpgsql;


--- TESTES DE REGRA DE NEGOCIO ---

call pc_gera_certificados(1, 'Teste');
select * from tb_certificado;

call pc_preenche_pontos (1, 1,  50, 1, 'Projeto', 'Correto');
select * from tb_movimentacao_ponto;
select * from tb_movimentacao_ponto_projeto;

    /* 
    
    Elementos do certificado:

    ------------ DINAMICO ------------
    - Horas de trabalho -> CALCULO INCRIVEL 
    - Nome do membro -> NOME FACIL
    - Data de emissao -> DIA HOJE
    - Data de entrada clube -> TABELO DO MEMBRO
    - Funções executadas -> SELECT COM CURSOS NO CARGO MEMBRO
    - Identificador -> ID DO CERTIFICADO

    ------------ ESTATICO ------------
    - Assinatura do presidente
    - ""
      PARTICIPOU DO CLUBE DE PROGRAMACAO COMO \ funcao \. NO PERÍODO 
      DE \ dataentrada \ A \ datasaida \, Com CARGA HORÁRIA DE \ horas_trabalhadas \ HORAS, NO CENTRO UNIVERSITÁRIO SENAI CIMATEC.

      **OBS: para a coordenacao CIMATEC 
      
    */
    
    -- Pegar pontos JQP totais do membro para calculo de horas. 