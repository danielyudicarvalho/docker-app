CREATE DATABASE IF NOT EXISTS tre_ms;
USE tre_ms;

CREATE TABLE IF NOT EXISTS tre (
    tre_cnpj varchar(14) NOT NULL,
    orcamento integer(10) NOT NULL,
    rua varchar(100) NOT NULL,
    numero integer(4) NOT NULL,
    bairro varchar(100) NOT NULL,
    PRIMARY KEY (tre_cnpj)
);

CREATE TABLE IF NOT EXISTS zona_eleitoral (
    zona_numero integer(3) NOT NULL,
    tre_cnpj varchar(14) NOT NULL,
    municipio varchar(100) NOT NULL,
    numero_locais integer(5) NOT NULL,
    numero_secoes integer(5) NOT NULL,
    eleitorado integer(6) NOT NULL,
    zona_cnpj varchar(14) NOT NULL,
    PRIMARY KEY (zona_numero),
    FOREIGN KEY (zona_cnpj) REFERENCES tre(tre_cnpj) 
);

CREATE TABLE IF NOT EXISTS forum_eleitoral (
    rua varchar(100) NOT NULL,
    numero integer(4) NOT NULL,
    bairro varchar(100) NOT NULL,
    zona_numero integer(3) NOT NULL,
    telefone varchar(8) NOT NULL,
    horario varchar(100) NOT NULL,
    forum_cnpj varchar(14) NOT NULL,
    PRIMARY KEY (rua, numero, bairro),
    FOREIGN KEY (forum_cnpj) REFERENCES tre(tre_cnpj)
);

CREATE TABLE IF NOT EXISTS secretaria (
    nome_sec varchar(100) NOT NULL,
    tre_cnpj varchar(14) NOT NULL,
    telefone varchar(8) NOT NULL,
    email varchar(100) NOT NULL,
    nome_secretario varchar(100) NOT NULL,
    PRIMARY KEY (nome_sec)
);

CREATE TABLE IF NOT EXISTS coordenadoria (
    nome_coordenadoria varchar(100) NOT NULL,
    nome_sec varchar(100) NOT NULL,
    chefe_coordenadoria varchar(100) NOT NULL,
    PRIMARY KEY (nome_coordenadoria),
    FOREIGN KEY (nome_sec) REFERENCES secretaria(nome_sec)
);

CREATE TABLE IF NOT EXISTS secao (
    nome_secao varchar(100) NOT NULL,
    nome_coordenadoria varchar(100) NOT NULL,
    chefe_secao varchar(100) NOT NULL,
    PRIMARY KEY (nome_secao),
    FOREIGN KEY (nome_coordenadoria) REFERENCES coordenadoria(nome_coordenadoria)
);

CREATE TABLE IF NOT EXISTS servidor (
    cpf varchar(11) NOT NULL,
    matricula varchar(8) NOT NULL,
    nome_secao varchar(100) NOT NULL,
    nome_servidor varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    salario integer(5) 	NOT NULL,
    rua varchar(100) NOT NULL,
    numero integer(4) NOT NULL,
    bairro varchar(100) NOT NULL,
    PRIMARY KEY (cpf, matricula),
    FOREIGN KEY (nome_secao) REFERENCES secao(nome_secao)
);

CREATE TABLE IF NOT EXISTS terceirizado (
    cpf varchar(11) NOT NULL,
    matricula varchar(8) NOT NULL,
    nome_empresa varchar(100) NOT NULL,
    PRIMARY KEY (cpf, matricula)
);

CREATE TABLE IF NOT EXISTS efetivo (
    cpf varchar(11) NOT NULL,
    matricula varchar(8) NOT NULL,
    cargo varchar(100) NOT NULL,
    lotacao varchar(100) NOT NULL,
    PRIMARY KEY (cpf, matricula)
);

CREATE TABLE IF NOT EXISTS estagiario (
    cpf varchar(11) NOT NULL,
    matricula varchar(8) NOT NULL,
    escolaridade varchar(100) NOT NULL,
    instituicao_ensino varchar(100) NOT NULL,
    PRIMARY KEY (cpf, matricula)
);

CREATE TABLE IF NOT EXISTS chefe_de_coordenadoria (
    cpf varchar(11) NOT NULL,
    matricula varchar(8) NOT NULL,
    funcao_confianca varchar(100) NOT NULL,
    coordenadoria varchar(100) NOT NULL,
    PRIMARY KEY (cpf, matricula),
    FOREIGN KEY (coordenadoria) REFERENCES coordenadoria(nome_coordenadoria)
);

SET FOREIGN_KEY_CHECKS=0;
TRUNCATE TABLE tre;
TRUNCATE TABLE zona_eleitoral;
TRUNCATE TABLE forum_eleitoral;
TRUNCATE TABLE secretaria;
TRUNCATE TABLE coordenadoria;
TRUNCATE TABLE secao;
TRUNCATE TABLE servidor;
TRUNCATE TABLE terceirizado;
TRUNCATE TABLE efetivo;
TRUNCATE TABLE estagiario;
TRUNCATE TABLE chefe_de_coordenadoria;
SET FOREIGN_KEY_CHECKS=1;

-- tre
INSERT INTO tre (tre_cnpj, orcamento, rua, numero, bairro) VALUES ('01467492800122', 10944568, 'Borg', '1555', 'Parque dos poderes');

-- zona_eleitoral
INSERT INTO zona_eleitoral (zona_numero, tre_cnpj, municipio, numero_locais, numero_secoes, eleitorado, zona_cnpj) VALUES (35, '01467492800122', 'Campo Grande', 46, 394, 110821, '01467492800122');
INSERT INTO zona_eleitoral (zona_numero, tre_cnpj, municipio, numero_locais, numero_secoes, eleitorado, zona_cnpj) VALUES (18, '01467492800122', 'Dourados', 48, 314, 91281, '01467492800122');
INSERT INTO zona_eleitoral (zona_numero, tre_cnpj, municipio, numero_locais, numero_secoes, eleitorado, zona_cnpj) VALUES (19, '01467492800122', 'Pota Por??', 13, 95, 25177, '01467492800122');

-- forum_eleitoral
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Delegado Jos?? Alfredo Hardman', 180, 'Jardim Veraneio', 35, '21077256', '12h ??s 18h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Sete de setembro', 100, 'Centro', 35, '33259390', '12h ??s 18h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Avenida Gury Marques', 5111, 'Universit??rio', 35, '33259391', '8h ??s 14h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Santo Angelo', 51, 'Coronel Antonino', 35, '33259392', '8h ??s 14h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Avenida Marechal Deodoro', 2603, 'Aero Rancho', 35, '33259393', '8h ??s 14h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Montese', 435, 'Jardim Londrina', 18, '34221656', '7:30h ??s 13:30h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Baltazar Saldanha', 1591, 'Jardim Ipanema', 19, '34313331', '12h ??s 18h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Bento Marques', 795, 'Centro', 19, '33259394', '7h ??s 12h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Waldomiro Maciel', 785, 'Centro', 19, 34832539, '7h ??s 12h', '01467492800122');

-- secretaria
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria Judici??ria', '01467492800122', '21077155', 'sj@tre-ms.jus.br', 'Let??nia Ferraz de Brito Coutinho');
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria de Tecnologia da Informa????o', '01467492800122', '21077109', 'sti@tre-ms.jus.br', 'Luciana Jucineire Vieira de Aguiar');
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria de Administra????o e Finan??as', '01467492800122', '21077072', 'saoms@tre-ms.jus.br', 'S??rgio Roberto da Silva');
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria de Gest??o de Pessoas', '01467492800122', '21077043', 'sgp@tre-ms.jus.br', 'Tatiana Quevedo de Souza Rodrigues');

-- coordenadoria	
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de desenvolvimento de solu????es corporativas', 'Secretaria de Tecnologia da Informa????o', 'L??cio S??rgio Ferraz de Brito');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de cadastro e log??stica de elei????es', 'Secretaria de Tecnologia da Informa????o', 'Jo??o Silva');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de infraestrutura e suporte', 'Secretaria de Tecnologia da Informa????o', 'Paulo Ferreira');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de registros e informa????es processuais', 'Secretaria Judici??ria', 'Stephanie Rodrigues');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de sess??es, documenta????o e jurisprud??ncia', 'Secretaria Judici??ria', 'Maria do Socorro');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de recursos e materiais', 'Secretaria de Administra????o e Finan??as', 'Jefferson Pereira');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de finan??as e contabilidade', 'Secretaria de Administra????o e Finan??as', 'Adriana Morales');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de servi??os gerais', 'Secretaria de Administra????o e Finan??as', 'Davi Chamma');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de pessoal', 'Secretaria de Gest??o de Pessoas', 'Fabiana Carvalho');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de capacita????o e desenvolvimento', 'Secretaria de Administra????o e Finan??as', 'Carol Coelho');

-- se????o
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de an??lise e desenvolvimento', 'Coordenadoria de desenvolvimento de solu????es corporativas', 'Marcelo Lopes');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de banco de dados', 'Coordenadoria de desenvolvimento de solu????es corporativas', 'Robson Rossettini de Andrade Costa');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de autua????o e distribui????o de processos', 'Coordenadoria de registros e informa????es processuais', 'Marcelo Rocha Monteiro');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de ac??rd??os e resolu????es', 'Coordenadoria de sess??es, documenta????o e jurisprud??ncia', 'Ludmilla Lins Grilo');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de voto informatizado', 'Coordenadoria de cadastro e log??stica de elei????es', 'Rodrigo Donche');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de microinform??tica', 'Coordenadoria de infraestrutura e suporte', 'Clodoaldo Fernandes');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de licita????o e compras', 'Coordenadoria de recursos e materiais', 'Ana L??cia');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de finan??as', 'Coordenadoria de finan??as e contabilidade', 'Wellison Pereira');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de servi??os administrativos', 'Coordenadoria de servi??os gerais', 'Francisco Ferreira');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de sistemas de pessoal', 'Coordenadoria de pessoal', 'Maur??cio Rossi');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Se????o de desempenho organizacional', 'Coordenadoria de capacita????o e desenvolvimento', 'Ana Paula');

-- servidor
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04856250091', '19131785', 'Se????o de banco de dados', 'Robson Rossettini de Andrade Costa', 'robson.costa@tre-ms.jus.br', 11840, 'Ernesto Geisel', 1286, 'Jardim Flor??ncio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03446208234', '19131788', 'Se????o de an??lise e desenvolvimento', 'Marcelo Lopes', 'marcelo.lopes@tre-ms.jus.br', 13100, 'Coronel Cerqueira', 920, 'Jardim Ipiranga');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('15646019901', '20130088', 'Se????o de autua????o e distribui????o de processos', 'Marcelo Rocha Monteiro', 'marcelo.monteiro@tre-ms.jus.br', 18400, 'Coronel Cerqueira', 920, 'Jardim Ipiranga');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03386905538', '20200618', 'Se????o de ac??rd??os e resolu????es', 'Ludmilla Lins Grilo', 'ludmilla.grilo@tre-ms.jus.br', 14600, 'Itaparica', 916, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('09187236500', '20210101', 'Se????o de ac??rd??os e resolu????es', 'Bruna Biato', 'bruna.biato@tre-ms.jus.br', 10000, 'Panonia', 200, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('22247809031', '20210130', 'Se????o de ac??rd??os e resolu????es', 'Haylla Santos', 'haylla.santos@tre-ms.jus.br', 10000, 'Bar??o de Graja??', 1120, 'Santa Efig??nia');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('22375305419', '19009854', 'Se????o de voto informatizado', 'Rodrigo Donche', 'rodrigo.donche@tre-ms.jus.br', 8500, 'Coata', 1010, 'Princesa Isabel');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04856222132', '19016703', 'Se????o de microinform??tica', 'Clodoaldo Fernandes', 'clodoaldo.fernandes@tre-ms.jus.br', 11350, 'Pelourinho', 142, 'Mineiros');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04811905592', '20136844', 'Se????o de licita????o e compras', 'Ana L??cia', 'ana.lucia@tre-ms.jus.br', 14800, 'Itupeba', 837, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('19016625573', '20206922', 'Se????o de finan??as', 'Wellison Pereira', 'wellison.pereira@tre-ms.jus.br', 12670, 'Sim??es', 1230, 'Aero Rancho');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('32488903421', '20201011', 'Se????o de servi??os administrativos', 'Francisco Ferreira', 'francisco.ferreira@tre-ms.jus.br', 5600, 'Sim??es', 1230, 'Aero Rancho');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04855672343', '19947921', 'Se????o de sistemas de pessoal', 'Maur??cio Rossi', 'mauricio.rossi@tre-ms.jus.br', 11200, 'Cotipora', 610, 'Moreninhas I');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03386904173', '20130209', 'Se????o de desempenho organizacional', 'Ana Paula', 'ana.paula@tre-ms.jus.br', 8000, 'Travessa Guatuba', 41, 'Jardim Montevid??u');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('23753350191', '20101365', 'Se????o de desempenho organizacional', 'Carol Coelho', 'carol.coelho@tre-ms.jus.br', 14000, 'Fernando Mattos', 120, 'Jardim Veraneio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04047258011', '20046098', 'Se????o de sistemas de pessoal', 'Fabiana Carvalho', 'fabiana.carvalho@tre-ms.jus.br', 8040, 'Bandeirantes', 286, 'Los Angeles');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('11150750812', '20000812', 'Se????o de servi??os administrativos', 'Davi Chamma', 'davi.chamma@tre-ms.jus.br', 10300, 'Carlos Drummond', 616, 'Coqueiral');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03652250189', '20131201', 'Se????o de finan??as', 'Adriana Morales', 'adriana.morales@tre-ms.jus.br', 19210, 'Desembargador Pedro Neto', 340, 'Flor??ncio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('21700236091', '20141903', 'Se????o de licita????o e compras', 'Jefferson Pereira', 'jefferson.pereira@tre-ms.jus.br', 14440, 'Dom Pedro I', 1200, 'Imperial');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('12489927801', '19911511', 'Se????o de ac??rd??os e resolu????es', 'Maria do Socorro', 'maria.socorro@tre-ms.jus.br', 13060, 'Princesa Isabel', 112, 'Imperial');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04855156391', '20050802', 'Se????o de autua????o e distribui????o de processos', 'Stephanie Rodrigues', 'stephanie.rodrigues@tre-ms.jus.br', 12000, 'Afonso Pena', 2014, 'Coimbra');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('33056221814', '20060612', 'Se????o de microinform??tica', 'Paulo Ferreira', 'paulo.ferreira@tre-ms.jus.br', 7000, 'Ayrton Senna', 50, 'Jardim Passeio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('21890433380', '14082000', 'Se????o de voto informatizado', 'Jo??o Silva', 'joao.silva@tre-ms.jus.br', 8000, 'Marechal Deodoro da Fonseca', 1400, 'Vila Militar');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('58402265020', '17001931', 'Se????o de an??lise e desenvolvimento', 'L??cio S??rgio Ferraz de Brito', 'licio.brito@tre-ms.jus.br', 19000, 'Presidente Vargas', 362, 'Mambucaia');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('10775051080', '10775051', 'Se????o de an??lise e desenvolvimento', 'Leandro Carvalho Almeida', 'leandro.almeida@tre-ms.jus.br', 4600, 'Presidente Juscelino', 800, 'Mambucaia');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03669186050', '03669186', 'Se????o de voto informatizado', 'Matheus Luiz Mendes', 'matheus.mendes@tre-ms.jus.br', 4000, 'Avenida Ana Rosa', 2242, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('13987341017', '13987341', 'Se????o de microinform??tica', 'Paulo Vin??cius Coelho', 'paulo.coelho@tre-ms.jus.br', 3300, 'Avenida Arauc??rias', 1016, 'Jardim Floresta');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('62879835070', '62879835', 'Se????o de ac??rd??os e resolu????es', 'Jo??o Pedro Saraiva', 'joao.saraiva@tre-ms.jus.br', 850, 'Rua Horto', 348, 'Jardim Uni??o');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('60961273046', '60961273', 'Se????o de servi??os administrativos', 'Laura Fabiana Pessoa', 'laura.pessoa@tre-ms.jus.br', 400, 'Rua Joaquim Murtinho', 3319, 'Pedro Celestino');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('97355621033', '97355621', 'Se????o de licita????o e compras', 'Gabriel Henrique da Silva', 'gabriel.silva@tre-ms.jus.br', 850, 'Rua Perp??tua', 1018, 'Jardim Veraneio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('41747219045', '41747219', 'Se????o de sistemas de pessoal', 'Luis Passos', 'luis.passos@tre-ms.jus.br', 850, 'Rua Sisto', 3302, 'Jardim Uni??o');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('95920585048', '95920585', 'Se????o de desempenho organizacional', 'Gabriel Barbosa', 'gabriel.barbosa@tre-ms.jus.br', 850, 'Rua Flamengo', 2019, 'Libertadores');

-- terceirizado
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('03669186050', '03669186', 'Indra Tecnologia');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('13987341017', '13987341', 'Indra Tecnologia');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('10775051080', '10775051', 'TOTVS');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('09187236500', '20210101', 'Biato Santos');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('22247809031', '20210130', 'Biato Santos');

-- efetivo 
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('58402265020', '17001931', 'Analista judici??rio', 'Se????o de an??lise e desenvolvimento');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('21890433380', '14082000', 'Analista judici??rio', 'Se????o de voto informatizado');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('33056221814', '20060612', 'Analista judici??rio', 'Se????o de microinform??tica');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04855156391', '20050802', 'Analista judici??rio', 'Se????o de autua????o e distribui????o de processos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('12489927801', '19911511', 'Analista judici??rio', 'Se????o de ac??rd??os e resolu????es');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('21700236091', '20141903', 'Analista judici??rio', 'Se????o de licita????o e compras');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03652250189', '20131201', 'Analista judici??rio', 'Se????o de finan??as');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('11150750812', '20000812', 'Analista judici??rio', 'Se????o de servi??os administrativos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04047258011', '20046098', 'Analista judici??rio', 'Se????o de sistemas de pessoal');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('23753350191', '20101365', 'Analista judici??rio', 'Se????o de desempenho organizacional');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03446208234', '19131788', 'Analista judici??rio', 'Se????o de an??lise e desenvolvimento');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04856250091', '19131785', 'Analista judici??rio', 'Se????o de banco de dados');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('15646019901', '20130088', 'Analista judici??rio', 'Se????o de autua????o e distribui????o de processos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03386905538', '20200618', 'Analista judici??rio', 'Se????o de ac??rd??os e resolu????es');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('22375305419', '19009854', 'Analista judici??rio', 'Se????o de voto informatizado');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04856222132', '19016703', 'Analista judici??rio', 'Se????o de microinform??tica');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04811905592', '20136844', 'Analista judici??rio', 'Se????o de licita????o e compras');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('19016625573', '20206922', 'Analista judici??rio', 'Se????o de finan??as');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('32488903421', '20201011', 'Analista judici??rio', 'Se????o de servi??os administrativos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04855672343', '19947921', 'Analista judici??rio', 'Se????o de sistemas de pessoal');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03386904173', '20130209', 'Analista judici??rio', 'Se????o de desempenho organizacional');

-- estagiario
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('62879835070', '62879835', 'Superior incompleto', 'Universidade Federal de Mato Grosso do Sul');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('60961273046', '60961273', 'Ensino m??dio incompleto', 'Universidade Federal de Mato Grosso do Sul');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('97355621033', '97355621', 'Superior incompleto', 'Universidade Federal de Mato Grosso do Sul');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('41747219045', '41747219', 'Superior incompleto', 'Uniderp');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('95920585048', '95920585', 'Superior incompleto', 'Universidade Anhanguera');

-- chefe_de_coordenadoria
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('58402265020', '17001931', 'FC06', 'Coordenadoria de desenvolvimento de solu????es corporativas');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('21890433380', '14082000', 'FC06', 'Coordenadoria de cadastro e log??stica de elei????es');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('33056221814', '20060612', 'FC06', 'Coordenadoria de infraestrutura e suporte');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('04855156391', '20050802', 'FC06', 'Coordenadoria de registros e informa????es processuais');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('12489927801', '19911511', 'FC06', 'Coordenadoria de sess??es, documenta????o e jurisprud??ncia');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('21700236091', '20141903', 'FC06', 'Coordenadoria de recursos e materiais');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('03652250189', '20131201', 'FC06', 'Coordenadoria de finan??as e contabilidade');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('11150750812', '20000812', 'FC06', 'Coordenadoria de servi??os gerais');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('04047258011', '20046098', 'FC06', 'Coordenadoria de pessoal');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('23753350191', '20101365', 'FC06', 'Coordenadoria de capacita????o e desenvolvimento');
