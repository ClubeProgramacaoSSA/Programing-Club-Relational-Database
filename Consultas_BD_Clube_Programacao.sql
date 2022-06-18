-- Esse Script é responsável fazer consultas de teste no Banco de Dados, tais consultas vão ser úteis para verificar se o banco de dados funciona como o previsto.

-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian WIDmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --João Pedro Moreira de AlmeIDa Santos | GitHub: https://github.com/joao7878
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires
        
        
/* Primeira proposta: Relatório do Torneio Equipes que participaram, seus integrantes, 
suas colocações, questões que eles acertaram e quais acertaram. Nome dos torneios, questões
que foram aplicadas no torneio, seu assuntos, dificuldade estimada, quantas tentativas,
demoraram para acertar.

Segunda proposta: Relatório dos encontros realizados naquele mês Data e horário do encontro,
membros presentes, o assunto, organizador, descrição dos resultados que foram discutidos, 
modalidade (presencial ou online).

Terceira proposta: Relatório do projeto Status do projeto (andamento), nome, objetivo, membros,
concluído, não organizado que fizeram o projeto, organizador do projeto, data inicio, 
data fim, descrição. */

--Primeira consulta:

SELECT
    T.NOME,E.NOME,M.NOME,ET.COLOCACAO
FROM
    TB_EQUIPE E
JOIN 
    TB_EQUIPE_TORNEIO ET ON (E.ID_EQUIPE = ET.ID_EQUIPE)
JOIN
    TB_MEMBRO_EQUIPE EM ON (E.ID_EQUIPE = EM.ID_EQUIPE)
JOIN
    TB_MEMBRO M ON (M.ID_MEMBRO = EM.ID_MEMBRO)
JOIN
    TB_TORNEIO T ON (T.ID_TORNEIO = ET.ID_TORNEIO);
ORDER BY E.NOME ASC;

-- Segunda consulta:

SELECT 
  *
FROM 
  TB_encontro e
JOIN  
  TB_presenca_encontro p 
ON 
  (e.ID_ENCONTRO = p.ID_ENCONTRO);

--Terceira consulta:

SELECT
    P.ID_LIDER,P.NOME,P.DESCRICAO,M.NOME,M.ID_MEMBRO,P.DATA_INICIO,P.DT_FIM_PREVISTO
FROM
    TB_PROJETO P
JOIN
    TB_MEMBRO_PROJETO MP ON (P.ID_PROJETO = MP.ID_PROJETO)
JOIN
    TB_MEMBRO M ON (MP.ID_MEMBRO = M.ID_MEMBRO)
WHERE
    P.ID_PROJETO = 1;