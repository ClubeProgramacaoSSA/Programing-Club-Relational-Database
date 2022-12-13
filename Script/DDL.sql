-- Esse Script e responsavel por criar as tabelas do Banco de dados Relacional e estabelecer suas restricoes.
-- Disponivel em https://github.com/ClubeProgramacaoSSA/Programing-Club-Relational-Database
    -- Made by:
        --Adrian WIDmer | GitHub: https://github.com/Awi-24
        --Antonio Horácio Magalhaes | GitHub: https://github.com/antoniohoracio77
        --Fernando Antonio Marques Schettini | GitHub: https://github.com/FernandoSchett
        --João Pedro Moreira de Almeida Santos | GitHub: https://github.com/joao7878
        --Orlando Mota Pires | GitHub: https://github.com/orlandomotapires



-- 1
CREATE TABLE TB_assunto(
    ID_assunto SERIAL NOT NULL,
    assunto VARCHAR(500)
);

-- 2 
CREATE TABLE TB_assunto_encontro(
    ID_assunto_encontro SERIAL NOT NULL,
    ID_assunto INT NOT NULL,
    ID_encontro INT NOT NULL
);

-- 3 
CREATE TABLE TB_assunto_projeto(
    ID_assunto_projeto SERIAL NOT NULL,
    ID_assunto INT NOT NULL,
    ID_projeto INT NOT NULL
);

-- 4
CREATE TABLE TB_assunto_questao(
    ID_assunto_questao SERIAL NOT NULL,
    ID_assunto INT NOT NULL,
    ID_questao INT NOT NULL
);

-- 5
CREATE TABLE TB_categoria_imagem(
    ID_categoria_imagem SERIAL NOT NULL,
    nome_categoria_imagem VARCHAR(500) UNIQUE
); 

-- 6
CREATE TABLE TB_capitao(
    ID_capitao SERIAL NOT NULL,
    ID_membro INT NOT NULL,
    nome_capitao VARCHAR(500) NOT NULL
);

-- 7
CREATE TABLE TB_cargo_membro(
    ID_cargo_membro SERIAL NOT NULL,
    ID_cargo INT NOT NULL,
    ID_membro INT NOT NULL, 
    DT_entrada_cargo DATE NOT NULL,
    DT_saida_cargo DATE
);

-- 8
CREATE TABLE TB_certificado(
    ID_certificado SERIAL NOT NULL,
    ID_membro INT NOT NULL,
    descricao_certificado VARCHAR(500),
    DT_emissao DATE NOT NULL,
    horas INT NOT NULL,
    pontos_meta VARCHAR(500) NOT NULL,
    URL_certificado VARCHAR(500) NOT NULL
);

-- 8
CREATE TABLE TB_cidade(
    ID_cidade SERIAL NOT NULL,
    ID_estado INT NOT NULL,
    nome_cidade VARCHAR(500) NOT NULL
);

-- 9
CREATE TABLE TB_comite_organizador(
    ID_comite_organizador SERIAL NOT NULL,
    ID_evento INT NOT NULL,
    ID_membro INT NOT NULL
);

--10
CREATE TABLE TB_conta_clube(
    ID_conta_clube SERIAL NOT NULL,
    ID_membro INT NOT NULL,
    login VARCHAR(500) NOT NULL,
    ponto_jpq INT NOT NULL,
    senha VARCHAR(500) NOT NULL
);

-- 11
CREATE TABLE TB_curso(
    ID_curso SERIAL NOT NULL,
    nome_curso VARCHAR(500) NOT NULL UNIQUE
);

-- 12
CREATE TABLE TB_curso_instituicao(
    ID_curso_instituicao SERIAL NOT NULL,
    ID_curso INT NOT NULL,
    ID_instituicao INT NOT NULL
);

-- 13
CREATE TABLE TB_encontro(
    ID_encontro SERIAL NOT NULL,
    ID_organizador INT NOT NULL,
    ID_projeto INT NOT NULL,
    DT_inicio DATE,
    DT_termino DATE
);

-- 14
CREATE TABLE TB_encontro_online(
    ID_encontro_online SERIAL NOT NULL,
    ID_plataforma INT NOT NULL,
    ID_encontro INT NOT NULL,
    URL_encontro VARCHAR(500),
    URL_gravacao VARCHAR(500)
);

-- 15
CREATE TABLE TB_encontro_presencial(
    ID_encontro_presencial SERIAL NOT NULL,
    ID_encontro INT NOT NULL,
    ID_local INT NOT NULL
);

-- 16
CREATE TABLE TB_equipe(
    ID_equipe SERIAL NOT NULL,
    ID_capitao INT NOT NULL,
    DT_criacao DATE NOT NULL,
    nome_equipe VARCHAR(500) NOT NULL
);

-- 17
CREATE TABLE TB_equipe_torneio(
    ID_equipe_torneio SERIAL NOT NULL,
    ID_equipe INT NOT NULL,
    ID_torneio INT NOT NULL,
    colocacao INT NOT NULL UNIQUE
);

-- 18
CREATE TABLE TB_equipe_torneio_fase(
    ID_equipe_torneio_fase SERIAL NOT NULL,
    ID_equipe_torneio INT NOT NULL,
    ID_fase INT NOT NULL,
    colocacao_fase INT NOT NULL UNIQUE,
    ponto_jpq_maximo INT
);

-- 19
CREATE TABLE TB_estado(
    ID_estado SERIAL NOT NULL,
    ID_pais INT NOT NULL,
    nome_estado VARCHAR(500) NOT NULL
);

-- 20
CREATE TABLE TB_evento(
    ID_evento SERIAL NOT NULL,
    ID_local INT NOT NULL,
    descricao_evento VARCHAR(500),
    DT_inicio DATE,
    DT_termino DATE,
    nome_evento VARCHAR(500) NOT NULL
);

-- 21
CREATE TABLE TB_evento_projeto(
    ID_evento_projeto SERIAL NOT NULL,
    ID_evento SERIAL NOT NULL,
    ID_projeto INT NOT NULL,
    descricao_evento_projeto VARCHAR(300) NOT NULL
);

-- 21
CREATE TABLE TB_fase(
    ID_fase SERIAL NOT NULL,
    ID_torneio INT NOT NULL,
    DT_inicio DATE NOT NULL,
    DT_termino DATE NOT NULL,
    numero INT NOT NULL
);

-- 22
CREATE TABLE TB_fase_online(
    ID_fase_online SERIAL NOT NULL,
    ID_fase INT NOT NULL,
    ID_plataforma INT NOT NULL
);

-- 23
CREATE TABLE TB_fase_presencial(
    ID_fase_presencial SERIAL NOT NULL,
    ID_fase INT NOT NULL,
    ID_local INT NOT NULL
);

-- 24
CREATE TABLE TB_equipe_torneio_fase_questao(
    ID_equipe_torneio_fase_questao SERIAL NOT NULL,
    ID_equipe_torneio_fase INT NOT NULL,
    ID_questao INT NOT NULL,
    ID_status INT NOT NULL, 
    numero_tentativas INT NOT NULL
);

-- 25
CREATE TABLE TB_funcao(
    ID_funcao SERIAL NOT NULL,
    descricao_funcao VARCHAR(500) NOT NULL,
    nome_funcao VARCHAR(500) NOT NULL,
    ponto_jpq_maximo INT
);

-- 26
CREATE TABLE TB_grau_dificuldade(
    ID_grau_dificuldade SERIAL NOT NULL,
    dificuldade VARCHAR(500) NOT NULL
);

-- 27
CREATE TABLE TB_imagem(
    ID_imagem SERIAL NOT NULL,
    ID_categoria_imagem INT NOT NULL,
    descricao_imagem VARCHAR(500),
    DT_imagem DATE,
    imagem bytea,
    nome_imagem VARCHAR(200),
    URL_imagem VARCHAR(500)
);

-- 28
CREATE TABLE TB_imagem_encontro(
    ID_imagem_encontro SERIAL NOT NULL,
    ID_encontro INT NOT NULL,
    ID_imagem INT NOT NULL
);

-- 29
CREATE TABLE TB_imagem_projeto(
    ID_imagem_projeto SERIAL NOT NULL,
    ID_imagem INT NOT NULL,
    ID_projeto INT NOT NULL
);

-- 30
CREATE TABLE TB_imagem_evento(
    ID_imagem_evento SERIAL NOT NULL,
    ID_evento INT NOT NULL,
    ID_imagem INT NOT NULL  
);

-- 31
CREATE TABLE TB_instituicao_ensino(
    ID_instituicao_ensino SERIAL NOT NULL,
    ID_local INT NOT NULL,
    nome_instituicao_ensino VARCHAR(500) NOT NULL
);

-- 32
CREATE TABLE TB_lider(
    ID_lider SERIAL NOT NULL,
    ID_membro INT NOT NULL,
    nome_lider VARCHAR(500) NOT NULL
);

-- 33
CREATE TABLE TB_local(
    ID_local SERIAL NOT NULL,
    ID_logradouro INT NOT NULL,
    descricao_local VARCHAR(500) NOT NULL,
    nome_local VARCHAR(500) NOT NULL
);    

-- 34
CREATE TABLE TB_logradouro(
    ID_logradouro SERIAL NOT NULL,
    ID_cidade INT NOT NULL,
    CEP VARCHAR(100) NOT NULL,
    complemento VARCHAR(500),
    nome_bairro VARCHAR(100) NOT NULL,
    nome_rua VARCHAR(100) NOT NULL,
    numero VARCHAR(50) NOT NULL
   
);

-- 35
CREATE TABLE TB_membro(
    ID_membro SERIAL NOT NULL,
    ID_curso_instituicao INT NOT NULL,
    ID_foto_membro INT NOT NULL,
    ID_oficio INT NOT NULL,
    DT_ingresso_clube DATE NOT NULL,
    DT_ingresso_faculdade DATE,
    DT_nascimento DATE,
    genero CHAR(1) NOT NULL,
    nome_membro VARCHAR(500) NOT NULL
);

-- 36
CREATE TABLE TB_membro_equipe(
    ID_membro_equipe SERIAL NOT NULL,
    ID_equipe INT NOT NULL,
    ID_membro INT NOT NULL
);

-- 37
CREATE TABLE TB_membro_projeto(
    ID_membro_projeto SERIAL NOT NULL,
    ID_membro INT NOT NULL,
    ID_funcao INT NOT NULL,
    ID_projeto INT NOT NULL,
    DT_entrada_projeto DATE NOT NULL,
    DT_saida_projeto DATE
);

-- 38
CREATE TABLE TB_movimentacao_ponto(
    ID_movimentacao_ponto SERIAL NOT NULL,
    ID_conta_clube INT NOT NULL,
    ID_tipo_movimentacao_ponto INT NOT NULL,
    quantidade_ponto_jpq INT,
    HR_transacao TIME,
    DT_transacao DATE
);

-- 39
CREATE TABLE TB_movimentacao_ponto_cargo(
    ID_movimentacao_ponto_cargo SERIAL NOT NULL,
    ID_cargo_membro INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL
);

-- 409
CREATE TABLE TB_movimentacao_ponto_evento(
    ID_movimentacao_ponto_evento SERIAL NOT NULL,
    ID_movimentacao_ponto INT NOT NULL,
    ID_presenca_evento INT NOT NULL
);

-- 41
CREATE TABLE TB_movimentacao_ponto_projeto(
    ID_movimentacao_ponto_projeto SERIAL NOT NULL,
    ID_movimentacao_ponto INT NOT NULL,
    ID_projeto INT NOT NULL,
    avaliacao_projeto VARCHAR(500)
);

-- 42
CREATE TABLE TB_movimentacao_ponto_questao(
    ID_movimentacao_ponto_questao SERIAL NOT NULL,
    ID_movimentacao_ponto INT NOT NULL,
    ID_questao INT NOT NULL,
    avaliacao_questao VARCHAR(500) 
);

-- 43
CREATE TABLE TB_movimentacao_ponto_torneio(
    ID_movimentacao_ponto_torneio SERIAL NOT NULL,
    ID_equipe_torneio_fase INT NOT NULL,
    ID_movimentacao_ponto INT NOT NULL
);

-- 44

CREATE TABLE TB_oficio(
    ID_oficio SERIAL NOT NULL,
    nome_oficio VARCHAR(500) NOT NULL
);
 
-- 44
CREATE TABLE TB_organizador(
    ID_organizador SERIAL NOT NULL,
    descricao_organizador VARCHAR(500),
    nome_organizador VARCHAR(500) NOT NULL
);

-- 45
CREATE TABLE TB_pais(
    ID_pais SERIAL NOT NULL,
    nome_pais VARCHAR(500)
);

-- 46
CREATE TABLE TB_presenca_encontro(
    ID_presenca_encontro SERIAL NOT NULL,
    ID_encontro INT NOT NULL,
    ID_membro INT NOT NULL
);

-- 47
CREATE TABLE TB_presenca_evento(
    ID_presenca_evento SERIAL NOT NULL,
    ID_membro INT NOT NULL,
    ID_evento INT NOT NULL,
    DT_inicio DATE NOT NULL,
    DT_termino DATE NOT NULL,
    ponto_jpq_maximo INT 
);

-- 48
CREATE TABLE TB_procedencia_questao(
    ID_procedencia_questao SERIAL NOT NULL,
    procedencia_questao VARCHAR (100) NOT NULL
);

-- 49
CREATE TABLE TB_projeto(
    ID_projeto SERIAL NOT NULL,
    ID_lider INT NOT NULL,
    ID_imagem_capa INT NOT NULL,
    ID_tipo_projeto INT NOT NULL,
    descricao_projeto VARCHAR(500),
    DT_inicio DATE NOT NULL,
    DT_termino_previsto DATE,
    DT_termino DATE,
    nome_projeto VARCHAR(500),
    ponto_jpq_maximo INT,
    URL_gitHub VARCHAR(500)
);

-- 50
CREATE TABLE TB_plataforma(
    ID_plataforma SERIAL NOT NULL,
    nome_plataforma VARCHAR(500) NOT NULL UNIQUE,
    URL_plataforma VARCHAR(500) NOT NULL UNIQUE
);

-- 51
CREATE TABLE TB_questao( 
    ID_questao SERIAL NOT NULL,
    ID_grau_dificuldade INT NOT NULL,
    ID_procedencia_questao INT NOT NULL,
    enunciado VARCHAR(200) NOT NULL,
    nome_questao VARCHAR(500) NOT NULL,
    ponto_jpq_maximo INT,
    resposta_certa VARCHAR(500)
);

-- 52
CREATE TABLE TB_status(
    ID_status SERIAL NOT NULL,
    descricao_status VARCHAR(500) NOT NULL
);

-- 53
CREATE TABLE TB_tipo_movimentacao_ponto(
    ID_tipo_movimentacao_ponto SERIAL  NOT NULL,
    tipo_movimentacao_ponto VARCHAR (100) NOT NULL
);

-- 54
CREATE TABLE TB_tipo_projeto(
    ID_tipo_projeto SERIAL NOT NULL,
    tipo VARCHAR(500) NOT NULL
);

-- 55
CREATE TABLE TB_torneio(
    ID_torneio SERIAL NOT NULL,
    ID_organizador INT NOT NULL,
    DT_inicio DATE NOT NULL,
    DT_termino DATE,
    nome_torneio VARCHAR(500) NOT NULL
);

-- Restricao de genero.
ALTER TABLE TB_membro ADD CONSTRAINT CK_GENERO_membro CHECK(genero in('F','M'));

-- Restricoes de chave primaria.
ALTER TABLE TB_assunto ADD CONSTRAINT PK_assunto PRIMARY KEY (ID_assunto); 
ALTER TABLE TB_assunto_encontro ADD CONSTRAINT PK_assunto_encontro PRIMARY KEY (ID_assunto_encontro); 
ALTER TABLE TB_assunto_projeto ADD CONSTRAINT PK_assunto_projeto PRIMARY KEY (ID_assunto_projeto); 
ALTER TABLE TB_assunto_questao ADD CONSTRAINT PK_assunto_questao PRIMARY KEY(ID_assunto_questao); 
ALTER TABLE TB_categoria_imagem ADD CONSTRAINT PK_categoria_imagem PRIMARY KEY (ID_categoria_imagem); 
ALTER TABLE TB_capitao ADD CONSTRAINT PK_capitao PRIMARY KEY (ID_capitao); 
ALTER TABLE TB_cargo_membro ADD CONSTRAINT PK_cargo_membro PRIMARY KEY (ID_cargo_membro);
ALTER TABLE TB_certificado ADD CONSTRAINT PK_certificado PRIMARY KEY (ID_certificado);
ALTER TABLE TB_cidade ADD CONSTRAINT PK_cidade PRIMARY KEY (ID_cidade); 
ALTER TABLE TB_comite_organizador ADD CONSTRAINT PK_comite_organizador PRIMARY KEY (ID_comite_organizador); 
ALTER TABLE TB_conta_clube ADD CONSTRAINT PK_conta_clube PRIMARY KEY (ID_conta_clube);
ALTER TABLE TB_curso ADD CONSTRAINT PK_curso PRIMARY KEY (ID_curso); 
ALTER TABLE TB_curso_instituicao ADD CONSTRAINT PK_curso_instituicao PRIMARY KEY (ID_curso_instituicao); 
ALTER TABLE TB_encontro ADD CONSTRAINT PK_encontro PRIMARY KEY (ID_encontro); 
ALTER TABLE TB_encontro_online ADD CONSTRAINT PK_encontro_online PRIMARY KEY (ID_encontro_online); 
ALTER TABLE TB_encontro_presencial ADD CONSTRAINT PK_encontro_presencial PRIMARY KEY (ID_encontro_presencial);
ALTER TABLE TB_equipe ADD CONSTRAINT PK_equipe PRIMARY KEY (ID_equipe); 
ALTER TABLE TB_equipe_torneio ADD CONSTRAINT PK_equipe_torneio PRIMARY KEY (ID_equipe_torneio); 
ALTER TABLE TB_equipe_torneio_fase ADD CONSTRAINT PK_equipe_torneio_fase PRIMARY KEY (ID_equipe_torneio_fase); 
ALTER TABLE TB_estado ADD CONSTRAINT PK_estado PRIMARY KEY (ID_estado); 
ALTER TABLE TB_evento ADD CONSTRAINT PK_evento PRIMARY KEY (ID_evento); 
ALTER TABLE TB_evento_projeto ADD CONSTRAINT PK_evento_projeto PRIMARY KEY (ID_evento_projeto);
ALTER TABLE TB_fase ADD CONSTRAINT PK_fase PRIMARY KEY (ID_fase); 
ALTER TABLE TB_fase_online ADD CONSTRAINT PK_fase_online PRIMARY KEY (ID_fase_online); 
ALTER TABLE TB_fase_presencial ADD CONSTRAINT PK_fase_presencial PRIMARY KEY (ID_fase_presencial); 
ALTER TABLE TB_equipe_torneio_fase_questao ADD CONSTRAINT PK_equipe_torneio_fase_questao PRIMARY KEY (ID_equipe_torneio_fase_questao); 
ALTER TABLE TB_funcao ADD CONSTRAINT PK_funcao PRIMARY KEY (ID_funcao); 
ALTER TABLE TB_grau_dificuldade ADD CONSTRAINT PK_grau_dificuldade PRIMARY KEY (ID_grau_dificuldade); 
ALTER TABLE TB_imagem ADD CONSTRAINT PK_imagem PRIMARY KEY (ID_imagem); 
ALTER TABLE TB_imagem_encontro ADD CONSTRAINT PK_imagem_encontro PRIMARY KEY (ID_imagem_encontro); 
ALTER TABLE TB_imagem_projeto ADD CONSTRAINT PK_imagem_projeto PRIMARY KEY (ID_imagem_projeto); 
ALTER TABLE TB_imagem_evento ADD CONSTRAINT PK_imagem_evento PRIMARY KEY (ID_imagem_evento); 
ALTER TABLE TB_instituicao_ensino ADD CONSTRAINT PK_instituicao_ensino PRIMARY KEY (ID_instituicao_ensino); 
ALTER TABLE TB_lider ADD CONSTRAINT PK_lider PRIMARY KEY (ID_lider); 
ALTER TABLE TB_local ADD CONSTRAINT PK_local PRIMARY KEY (ID_local); 
ALTER TABLE TB_logradouro ADD CONSTRAINT PK_logradouro PRIMARY KEY (ID_logradouro); 
ALTER TABLE TB_membro ADD CONSTRAINT PK_membro PRIMARY KEY (ID_membro); 
ALTER TABLE TB_membro_equipe ADD CONSTRAINT PK_membro_equipe PRIMARY KEY (ID_membro_equipe); 
ALTER TABLE TB_membro_projeto ADD CONSTRAINT PK_membro_projeto PRIMARY KEY (ID_membro_projeto); 
ALTER TABLE TB_movimentacao_ponto ADD CONSTRAINT PK_movimentacao_ponto PRIMARY KEY (ID_movimentacao_ponto); 
ALTER TABLE TB_movimentacao_ponto_cargo ADD CONSTRAINT PK_movimentacao_ponto_cargo PRIMARY KEY (ID_movimentacao_ponto_cargo); 
ALTER TABLE TB_movimentacao_ponto_evento ADD CONSTRAINT PK_movimentacao_ponto_evento PRIMARY KEY (ID_movimentacao_ponto_evento); 
ALTER TABLE TB_movimentacao_ponto_projeto ADD CONSTRAINT PK_movimentacao_ponto_projeto PRIMARY KEY (ID_movimentacao_ponto_projeto); 
ALTER TABLE TB_movimentacao_ponto_questao ADD CONSTRAINT PK_movimentacao_ponto_questao PRIMARY KEY (ID_movimentacao_ponto_questao); 
ALTER TABLE TB_movimentacao_ponto_torneio ADD CONSTRAINT PK_movimentacao_ponto_torneio PRIMARY KEY (ID_movimentacao_ponto_torneio); 
ALTER TABLE TB_oficio ADD CONSTRAINT PK_oficio PRIMARY KEY(ID_oficio);
ALTER TABLE TB_organizador ADD CONSTRAINT PK_organizador PRIMARY KEY(ID_organizador);
ALTER TABLE TB_pais ADD CONSTRAINT PK_pais PRIMARY KEY (ID_pais); 
ALTER TABLE TB_presenca_encontro ADD CONSTRAINT PK_preseca_encontro PRIMARY KEY (ID_presenca_encontro); 
ALTER TABLE TB_presenca_evento ADD CONSTRAINT PK_presenca_evento PRIMARY KEY (ID_presenca_evento); 
ALTER TABLE TB_procedencia_questao ADD CONSTRAINT PK_procedencia_questao PRIMARY KEY (ID_procedencia_questao); 
ALTER TABLE TB_projeto ADD CONSTRAINT PK_projeto PRIMARY KEY (ID_projeto); 
ALTER TABLE TB_plataforma ADD CONSTRAINT PK_platafomra PRIMARY KEY (ID_plataforma); 
ALTER TABLE TB_questao ADD CONSTRAINT PK_questao PRIMARY KEY (ID_questao); 
ALTER TABLE TB_status ADD CONSTRAINT PK_status PRIMARY KEY (ID_status); 
ALTER TABLE TB_tipo_movimentacao_ponto ADD CONSTRAINT PK_tipo_movimentacao_ponto PRIMARY KEY (ID_tipo_movimentacao_ponto);
ALTER TABLE TB_tipo_projeto ADD CONSTRAINT PK_tipo_projeto PRIMARY KEY (ID_tipo_projeto);
ALTER TABLE TB_torneio ADD CONSTRAINT PK_torneio PRIMARY KEY (ID_torneio); 

-- Restricoes de chave estrangeira. 

-- TB_assunto_encontro
ALTER TABLE TB_assunto_encontro ADD CONSTRAINT FK_assunto_encontro_assunto FOREIGN KEY (ID_assunto) REFERENCES TB_assunto(ID_assunto);
ALTER TABLE TB_assunto_encontro ADD CONSTRAINT FK_assunto_encontro_encontro FOREIGN KEY (ID_encontro) REFERENCES TB_encontro(ID_encontro);

-- TB_assunto_projeto
ALTER TABLE TB_assunto_projeto ADD CONSTRAINT FK_assunto_projeto_assunto FOREIGN KEY (ID_assunto) REFERENCES TB_assunto(ID_assunto);
ALTER TABLE TB_assunto_projeto ADD CONSTRAINT FK_assunto_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_assunto_questao
ALTER TABLE TB_assunto_questao ADD CONSTRAINT FK_assunto_questao_assunto FOREIGN KEY (ID_assunto) REFERENCES TB_assunto (ID_assunto);
ALTER TABLE TB_assunto_questao ADD CONSTRAINT FK_assunto_questao_questao FOREIGN KEY (ID_questao) REFERENCES TB_questao (ID_questao);

-- TB_capitao
ALTER TABLE TB_capitao ADD CONSTRAINT FK_capitao_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

--TB_cargo_membro
ALTER TABLE TB_cargo_membro ADD CONSTRAINT FK_cargo_membro_funcao FOREIGN KEY (ID_cargo) REFERENCES TB_funcao(ID_funcao);
ALTER TABLE TB_cargo_membro ADD CONSTRAINT FK_cargo_membro_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

--TB_certificado
ALTER TABLE TB_certificado ADD CONSTRAINT FK_certificado_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

-- TB_cidade
ALTER TABLE TB_cidade ADD CONSTRAINT FK_cidade_estado FOREIGN KEY (ID_estado) REFERENCES TB_estado(ID_estado);

-- TB_comite_organizador
ALTER TABLE TB_comite_organizador ADD CONSTRAINT FK_comite_organizador_evento FOREIGN KEY (ID_evento) REFERENCES  TB_evento(ID_evento);
ALTER TABLE TB_comite_organizador ADD CONSTRAINT FK_comite_organizador_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_conta_clube
ALTER TABLE TB_conta_clube ADD CONSTRAINT FK_conta_clube_membro FOREIGN KEY (ID_membro) REFERENCES TB_membro(ID_membro);

-- TB_curso_instituicao
ALTER TABLE TB_curso_instituicao ADD CONSTRAINT FK_curso_instituicao_curso FOREIGN KEY (ID_curso) REFERENCES  TB_curso(ID_curso);
ALTER TABLE TB_curso_instituicao ADD CONSTRAINT FK_curso_instituicao_instituicao_ensino FOREIGN KEY (ID_instituicao) REFERENCES  TB_instituicao_ensino(ID_instituicao_ensino);

-- TB_encontro
ALTER TABLE TB_encontro ADD CONSTRAINT FK_encontro_organizador FOREIGN KEY (ID_organizador) REFERENCES TB_membro(ID_membro);
ALTER TABLE TB_encontro ADD CONSTRAINT FK_encontro_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_encontro_online 
ALTER TABLE TB_encontro_online ADD CONSTRAINT FK_encontro_online_plataforma FOREIGN KEY (ID_plataforma) REFERENCES TB_plataforma(ID_plataforma);
ALTER TABLE TB_encontro_online ADD CONSTRAINT FK_encontro_online_encontro FOREIGN KEY (ID_encontro) REFERENCES TB_encontro(ID_encontro);

-- TB_encontro_presencial
ALTER TABLE TB_encontro_presencial ADD CONSTRAINT FK_encontro_presencial_encontro FOREIGN KEY (ID_encontro) REFERENCES TB_encontro(ID_encontro);
ALTER TABLE TB_encontro_presencial ADD CONSTRAINT FK_encontro_presencial_local FOREIGN KEY (ID_local) REFERENCES  TB_local(ID_local);

-- TB_equipe
ALTER TABLE TB_equipe ADD CONSTRAINT FK_equipe_capitao FOREIGN KEY (ID_capitao) REFERENCES  TB_capitao(ID_capitao);

-- TB_equipe_torneio
ALTER TABLE TB_equipe_torneio ADD CONSTRAINT FK_equipe_torneio_equipe FOREIGN KEY (ID_equipe) REFERENCES  TB_equipe(ID_equipe);
ALTER TABLE TB_equipe_torneio ADD CONSTRAINT FK_equipe_torneio_torneio FOREIGN KEY (ID_torneio) REFERENCES  TB_torneio(ID_torneio);

-- TB_equipe_torneio_fase
ALTER TABLE TB_equipe_torneio_fase ADD CONSTRAINT FK_equipe_torneio_fase_equipe_torneio FOREIGN KEY (ID_equipe_torneio) REFERENCES  TB_equipe_torneio(ID_equipe_torneio);
ALTER TABLE TB_equipe_torneio_fase ADD CONSTRAINT FK_equipe_torneio_fase_fase FOREIGN KEY (ID_fase) REFERENCES  TB_fase(ID_fase);

-- TB_estado
ALTER TABLE TB_estado ADD CONSTRAINT FK_estado_pais FOREIGN KEY (ID_pais) REFERENCES  TB_pais(ID_pais);

-- TB_evento
ALTER TABLE TB_evento ADD CONSTRAINT FK_evento_local FOREIGN KEY (ID_local) REFERENCES TB_local(ID_local);

--TB_evento_projeto
ALTER TABLE TB_evento_projeto ADD CONSTRAINT FK_evento_projeto_evento FOREIGN KEY (ID_evento) REFERENCES TB_evento(ID_evento);
ALTER TABLE TB_evento_projeto ADD CONSTRAINT FK_evento_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_fase
ALTER TABLE TB_fase ADD CONSTRAINT FK_fase_torneio FOREIGN KEY (ID_torneio) REFERENCES  TB_torneio (ID_torneio);

-- TB_fase_online
ALTER TABLE TB_fase_online ADD CONSTRAINT FK_fase_online_fase FOREIGN KEY (ID_fase) REFERENCES  TB_fase(ID_fase);
ALTER TABLE TB_fase_online ADD CONSTRAINT FK_fase_online_plataforma FOREIGN KEY (ID_plataforma) REFERENCES  TB_plataforma(ID_plataforma);

-- TB_fase_presencial
ALTER TABLE TB_fase_presencial ADD CONSTRAINT FK_fase_presencial_fase FOREIGN KEY (ID_fase) REFERENCES  TB_fase(ID_fase);
ALTER TABLE TB_fase_presencial ADD CONSTRAINT FK_fase_presencial_local FOREIGN KEY (ID_local) REFERENCES  TB_local(ID_local);

-- TB_equipe_torneio_fase_questao
ALTER TABLE TB_equipe_torneio_fase_questao ADD CONSTRAINT FK_equipe_torneio_fase_questao_equipe_torneio_fase FOREIGN KEY (ID_equipe_torneio_fase) REFERENCES  TB_equipe_torneio_fase (ID_equipe_torneio_fase);
ALTER TABLE TB_equipe_torneio_fase_questao ADD CONSTRAINT FK_equipe_torneio_fase_questao_questao FOREIGN KEY (ID_questao) REFERENCES  TB_questao(ID_questao);
ALTER TABLE TB_equipe_torneio_fase_questao ADD CONSTRAINT FK_equipe_torneio_fase_questao_status FOREIGN KEY (ID_status) REFERENCES  TB_status(ID_status);

-- TB_imagem
ALTER TABLE TB_imagem ADD CONSTRAINT FK_imagem_categoria_imagem FOREIGN KEY (ID_categoria_imagem) REFERENCES TB_categoria_imagem(ID_categoria_imagem);

-- TB_imagem_encontro
ALTER TABLE TB_imagem_encontro ADD CONSTRAINT FK_imagem_encontro_encontro FOREIGN KEY (ID_encontro) REFERENCES  TB_encontro (ID_encontro);
ALTER TABLE TB_imagem_encontro ADD CONSTRAINT FK_imagem_encontro_imagem FOREIGN KEY (ID_imagem) REFERENCES  TB_imagem(ID_imagem);

-- TB_imagem_projeto
ALTER TABLE TB_imagem_projeto ADD CONSTRAINT FK_imagem_projeto_imagem FOREIGN KEY (ID_imagem) REFERENCES  TB_imagem(ID_imagem);
ALTER TABLE TB_imagem_projeto ADD CONSTRAINT FK_imagem_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES  TB_projeto (ID_projeto);

-- TB_imagem_evento
ALTER TABLE TB_imagem_evento ADD CONSTRAINT FK_imagem_evento_evento FOREIGN KEY (ID_evento) REFERENCES  TB_evento(ID_evento);
ALTER TABLE TB_imagem_evento ADD CONSTRAINT FK_imagem_evento_imagem FOREIGN KEY (ID_imagem) REFERENCES  TB_imagem(ID_imagem);

-- TB_instituicao_ensino
ALTER TABLE TB_instituicao_ensino ADD CONSTRAINT FK_instituicao_ensino_local FOREIGN KEY (ID_local) REFERENCES  TB_local (ID_local);

-- TB_lider
ALTER TABLE TB_lider ADD CONSTRAINT FK_lider_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro (ID_membro);

-- TB_local
ALTER TABLE TB_local ADD CONSTRAINT FK_local_logradouro FOREIGN KEY (ID_logradouro) REFERENCES  TB_logradouro (ID_logradouro);

-- TB_logradouro
ALTER TABLE TB_logradouro ADD CONSTRAINT FK_logradouro_cidade FOREIGN KEY (ID_cidade) REFERENCES  TB_cidade(ID_cidade);

-- TB_membro
ALTER TABLE TB_membro ADD CONSTRAINT FK_membro_curso_instituicao FOREIGN KEY (ID_curso_instituicao) REFERENCES  TB_curso_instituicao(ID_curso_instituicao);
ALTER TABLE TB_membro ADD CONSTRAINT FK_membro_imagem FOREIGN KEY (ID_foto_membro) REFERENCES  TB_imagem(ID_imagem);
ALTER TABLE TB_membro ADD CONSTRAINT FK_membro_oficio FOREIGN KEY (ID_oficio) REFERENCES  TB_oficio(ID_oficio);

-- TB_membro_equipe
ALTER TABLE TB_membro_equipe ADD CONSTRAINT FK_membro_equipe_equipe FOREIGN KEY(ID_equipe) REFERENCES  TB_equipe(ID_equipe);
ALTER TABLE TB_membro_equipe ADD CONSTRAINT FK_membro_equipe_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_membro_projeto 
ALTER TABLE TB_membro_projeto ADD CONSTRAINT FK_membro_projeto_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);
ALTER TABLE TB_membro_projeto ADD CONSTRAINT FK_membro_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES  TB_projeto(ID_projeto);
ALTER TABLE TB_membro_projeto ADD CONSTRAINT FK_membro_projeto_funcao FOREIGN KEY (ID_funcao) REFERENCES  TB_funcao(ID_funcao);

--TB_movimentacao_ponto
ALTER TABLE TB_movimentacao_ponto ADD CONSTRAINT FK_movimentacao_ponto_conta_clube FOREIGN KEY (ID_conta_clube) REFERENCES  TB_conta_clube(ID_conta_clube);
ALTER TABLE TB_movimentacao_ponto ADD CONSTRAINT FK_movimentacao_ponto_tipo_movimentacao_ponto FOREIGN KEY (ID_tipo_movimentacao_ponto) REFERENCES  TB_tipo_movimentacao_ponto(ID_tipo_movimentacao_ponto);

--TB_movimentacao_ponto_cargo
ALTER TABLE TB_movimentacao_ponto_cargo ADD CONSTRAINT FK_movimentacao_ponto_cargo_cargo_membro FOREIGN KEY (ID_cargo_membro) REFERENCES  TB_cargo_membro(ID_cargo_membro);
ALTER TABLE TB_movimentacao_ponto_cargo ADD CONSTRAINT FK_movimentacao_ponto_cargo_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES  TB_movimentacao_ponto(ID_movimentacao_ponto);

--TB_movimentacao_ponto_evento
ALTER TABLE TB_movimentacao_ponto_evento ADD CONSTRAINT FK_movimentacao_ponto_evento_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES  TB_movimentacao_ponto(ID_movimentacao_ponto);
ALTER TABLE TB_movimentacao_ponto_evento ADD CONSTRAINT FK_movimentacao_ponto_presenca_evento FOREIGN KEY (ID_presenca_evento) REFERENCES  TB_presenca_evento(ID_presenca_evento);

-- TB_movimentacao_ponto_projeto
ALTER TABLE TB_movimentacao_ponto_projeto ADD CONSTRAINT FK_movimentacao_ponto_projeto_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES TB_movimentacao_ponto(ID_movimentacao_ponto);
ALTER TABLE TB_movimentacao_ponto_projeto ADD CONSTRAINT FK_movimentacao_ponto_projeto_projeto FOREIGN KEY (ID_projeto) REFERENCES TB_projeto(ID_projeto);

-- TB_movimentacao_ponto_questao
ALTER TABLE TB_movimentacao_ponto_questao ADD CONSTRAINT FK_movimentacao_ponto_questao_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES TB_movimentacao_ponto(ID_movimentacao_ponto);
ALTER TABLE TB_movimentacao_ponto_questao ADD CONSTRAINT FK_movimentacao_ponto_questao_questao FOREIGN KEY (ID_questao) REFERENCES TB_questao(ID_questao);

-- TB_movimentacao_ponto_torneio
ALTER TABLE TB_movimentacao_ponto_torneio ADD CONSTRAINT FK_movimentacao_ponto_torneio_equipe_torneio_fase FOREIGN KEY (ID_equipe_torneio_fase) REFERENCES TB_equipe_torneio_fase(ID_equipe_torneio_fase);
ALTER TABLE TB_movimentacao_ponto_torneio ADD CONSTRAINT FK_movimentacao_ponto_torneio_movimentacao_ponto FOREIGN KEY (ID_movimentacao_ponto) REFERENCES TB_movimentacao_ponto(ID_movimentacao_ponto);

-- TB_presenca_evento
ALTER TABLE TB_presenca_evento ADD CONSTRAINT FK_presenca_evento_evento FOREIGN KEY (ID_evento) REFERENCES  TB_evento(ID_evento);
ALTER TABLE TB_presenca_evento ADD CONSTRAINT FK_presenca_evento_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_presenca_encontro
ALTER TABLE TB_presenca_encontro ADD CONSTRAINT FK_presenca_encontro_encontro FOREIGN KEY (ID_encontro) REFERENCES  TB_encontro(ID_encontro);
ALTER TABLE TB_presenca_encontro ADD CONSTRAINT FK_presenca_encontro_membro FOREIGN KEY (ID_membro) REFERENCES  TB_membro(ID_membro);

-- TB_projeto
ALTER TABLE TB_projeto ADD CONSTRAINT FK_projeto_lider FOREIGN KEY (ID_lider) REFERENCES  TB_lider(ID_lider);
ALTER TABLE TB_projeto ADD CONSTRAINT FK_projeto_tipo_projeto FOREIGN KEY (ID_tipo_projeto) REFERENCES TB_tipo_projeto (ID_tipo_projeto);
ALTER TABLE TB_projeto ADD CONSTRAINT FK_projeto_imagem_capa FOREIGN KEY (ID_imagem_capa) REFERENCES TB_imagem (ID_imagem);

-- TB_questao
ALTER TABLE TB_questao ADD CONSTRAINT FK_questao_grau_dificuldade FOREIGN KEY (ID_grau_dificuldade) REFERENCES  TB_grau_dificuldade(ID_grau_dificuldade);
ALTER TABLE TB_questao ADD CONSTRAINT FK_questao_procedencia_questao FOREIGN KEY (ID_procedencia_questao) REFERENCES  TB_procedencia_questao(ID_procedencia_questao);

-- TB_torneio
ALTER TABLE TB_torneio ADD CONSTRAINT FK_torneio_organizador FOREIGN KEY (ID_organizador) REFERENCES  TB_organizador(ID_organizador);