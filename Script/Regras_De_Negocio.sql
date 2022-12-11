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
        
CREATE OR REPLACE FUNCTION TG_preenche_pontos()
    RETURNS trigger AS $teste_trigger$
BEGIN
    INSERT INTO funcionario_funcionarios_auditoria
    (log_id, data_criacao)
    VALUES
    (new.codigo_func, current_timestamp);
    RETURN NEW;
END;

$teste_trigger


CREATE TRIGGER log_trigger
AFTER INSERT ON funcionarios
FOR EACH ROW
EXECUTE PROCEDURE TG_preenche_pontos();



CREATE OR REPLACE PROCEDURE PC_preenche_pontos(ID_tipo_movimentacao_ponto INT,ID_conta_clube INT, quantidade_ponto_jqp INT,ID_procedencia INT, associacao_movimentacao TEXT, avaliacao TEXT)
   AS $$
DECLARE 
    pontos_maximo integer;
    relacao_existe boolean;
    dia_atual time default current_time;   
    hora_atual date default current_date;
BEGIN
    
    INSERT INTO 
    TB_movimentacao_ponto(ID_conta_clube, ID_tipo_movimentacao_ponto, quantidade_ponto_jqp, DT_trasacao, HR_transacao) 
    VALUES 
    (ID_conta_clube, 
     ID_tipo_movimentacao_ponto,
     quantidade_ponto_jqp.
     dia_atual,
     hora_atual
    );
    
    CASE UPPER(associacao_movimentacao)
    WHEN 'PROJETO' THEN
        SELECT pontos_jpq_maximo INTO pontos_maximo FROM TB_projeto WHERE id_procedencia = ID_projeto ;
        
        INSERT INTO
            TB_movimentacao_ponto_projeto(ID_movimentacao_ponto_projeto, ID_projeto, avaliacao_projeto) 
        VALUES 
        (SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto WHERE HR_transacao = hora_atual,
         ID_procedencia,
         avaliacao
        );

    WHEN 'CARGO' THEN
        SELECT pontos_jpq_maximo FROM TB_funcao WHERE id_procedencia = ID_funcao INTO pontos_maximo;
        INSERT INTO 
            TB_movimentacao_ponto_cargo(ID_movimentacao_ponto, ID_projeto) 
        VALUES 
        (SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto WHERE HR_transacao = hora_atual,
         ID_procedencia
        ); 
    
    WHEN 'EVENTO' THEN
        SELECT pontos_jpq_maximo FROM TB_presenca_evento WHERE id_procedencia = ID_presenca_evento INTO pontos_maximo;
        INSERT INTO 
            TB_movimentacao_ponto_evento(ID_movimentacao_ponto, ID_projeto) 
        VALUES 
        (SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto WHERE HR_transacao = hora_atual,
         ID_procedencia
        );

    WHEN 'QUESTAO' THEN
        SELECT pontos_jpq_maximo FROM TB_questao WHERE id_procedencia = ID_questao INTO pontos_maximo;
        
        INSERT INTO 
            TB_movimentacao_ponto_questao(ID_movimentacao_ponto, ID_projeto) 
        VALUES 
        (SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto WHERE HR_transacao = hora_atual,
         ID_procedencia,
         avaliacao
        );

    WHEN 'TORNEIO' THEN
        SELECT pontos_jpq_maximo FROM TB_equipe_torneio_fase WHERE id_procedencia = ID_equipe_torneio_fase INTO pontos_maximo;
        
        INSERT INTO 
            TB_movimentacao_ponto_torneio(ID_movimentacao_ponto, ID_projeto) 
        VALUES 
        (SELECT ID_movimentacao_ponto FROM TB_movimentacao_ponto WHERE HR_transacao = hora_atual,
         ID_procedencia
        );

    ELSE
        RAISE 'associacao_movimentacao de movimentacao desconhecida' USING ERRCODE = '23421';
    END CASE;

    IF quantidade_ponto_jqp < 0 OR quantidade_ponto_jqp > pontos_maximo THEN
            RAISE 'Quantidade de pontos invalida' USING ERRCODE = '23420';
    END IF;
    
END; $$
LANGUAGE plpgsql;



