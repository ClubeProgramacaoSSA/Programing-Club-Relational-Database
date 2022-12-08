-- Esse Script é responsável fazer consultas de teste no Banco de Dados, tais consultas vão ser úteis para verificar se o banco de dados funciona como o previsto.

-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian WIDmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --João Pedro Moreira de AlmeIDa Santos | GitHub: https://github.com/joao7878
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires
        
         
/* Primeira proposta: Relatório do Torneio. 
Um relatório construído com base para informar sobre um certo torneio, nosso escopo para consulta resultará em: nome do torneio, quantas fases compuseram o torneio, o nome das equipes que participaram do torneio, seus integrantes, o nome de seu capitão, suas colocações, questões que eles erraram e quais acertaram,quantas tentativas demoraram, questões que foram aplicadas no torneio, seu assuntos, dificuldade estimada.
Segunda proposta: Relatório dos encontros realizados em um mês específico.

Um relatório construído com base para informar sobre a atividade do clube em um certo mês, nosso escopo para consulta resultará em: Data e horário do encontro,membros presentes, o assunto do encontro, organizador do encontro, descrição dos resultados que foram discutidos, modalidade (presencial ou online), local onde o encontro foi realizado ou plataforma (caso for on-line).
Terceira proposta: Relatório do projeto.
 
Um relatório construído com base para informar sobre o status de andamento de um projeto, nosso escopo para consulta resultará em: Status do projeto (andamento), nome do projeto, objetivo do projeto, membros que compõem a equipe do projeto, líder do projeto, data do início, data do fim previsto, data do fim efetivo (se houver), descrição do projeto. 
*/

--Primeira consulta:

SELECT
    T.NOME_torneio,E.NOME_equipe,M.NOME_membro,ET.COLOCACAO
FROM
    TB_EQUIPE E
JOIN 
    TB_EQUIPE_TORNEIO ET ON (E.ID_EQUIPE = ET.ID_EQUIPE)
JOIN
    TB_MEMBRO_EQUIPE EM ON (E.ID_EQUIPE = EM.ID_EQUIPE)
JOIN
    TB_MEMBRO M ON (M.ID_MEMBRO = EM.ID_MEMBRO)
JOIN
    TB_TORNEIO T ON (T.ID_TORNEIO = ET.ID_TORNEIO)
ORDER BY E.NOME_equipe ASC;

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
    P.ID_LIDER,P.NOME_projeto,P.DESCRICAO,M.NOME_membro,M.ID_MEMBRO,P.DT_INICIO,P.DT_TERMINO_PREVISTO
FROM
    TB_PROJETO P
JOIN
    TB_MEMBRO_PROJETO MP ON (P.ID_PROJETO = MP.ID_PROJETO)
JOIN
    TB_MEMBRO M ON (MP.ID_MEMBRO = M.ID_MEMBRO)
WHERE
    P.ID_PROJETO = 1;