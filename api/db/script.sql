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
INSERT INTO zona_eleitoral (zona_numero, tre_cnpj, municipio, numero_locais, numero_secoes, eleitorado, zona_cnpj) VALUES (19, '01467492800122', 'Pota Porã', 13, 95, 25177, '01467492800122');

-- forum_eleitoral
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Delegado José Alfredo Hardman', 180, 'Jardim Veraneio', 35, '21077256', '12h às 18h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Sete de setembro', 100, 'Centro', 35, '33259390', '12h às 18h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Avenida Gury Marques', 5111, 'Universitário', 35, '33259391', '8h às 14h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Santo Angelo', 51, 'Coronel Antonino', 35, '33259392', '8h às 14h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Avenida Marechal Deodoro', 2603, 'Aero Rancho', 35, '33259393', '8h às 14h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Montese', 435, 'Jardim Londrina', 18, '34221656', '7:30h às 13:30h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Baltazar Saldanha', 1591, 'Jardim Ipanema', 19, '34313331', '12h às 18h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Bento Marques', 795, 'Centro', 19, '33259394', '7h às 12h', '01467492800122');
INSERT INTO forum_eleitoral (rua, numero, bairro, zona_numero, telefone, horario, forum_cnpj) VALUES ('Waldomiro Maciel', 785, 'Centro', 19, 34832539, '7h às 12h', '01467492800122');

-- secretaria
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria Judiciária', '01467492800122', '21077155', 'sj@tre-ms.jus.br', 'Letânia Ferraz de Brito Coutinho');
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria de Tecnologia da Informação', '01467492800122', '21077109', 'sti@tre-ms.jus.br', 'Luciana Jucineire Vieira de Aguiar');
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria de Administração e Finanças', '01467492800122', '21077072', 'saoms@tre-ms.jus.br', 'Sérgio Roberto da Silva');
INSERT INTO secretaria (nome_sec, tre_cnpj, telefone, email, nome_secretario) VALUES ('Secretaria de Gestão de Pessoas', '01467492800122', '21077043', 'sgp@tre-ms.jus.br', 'Tatiana Quevedo de Souza Rodrigues');

-- coordenadoria	
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de desenvolvimento de soluções corporativas', 'Secretaria de Tecnologia da Informação', 'Lício Sérgio Ferraz de Brito');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de cadastro e logística de eleições', 'Secretaria de Tecnologia da Informação', 'João Silva');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de infraestrutura e suporte', 'Secretaria de Tecnologia da Informação', 'Paulo Ferreira');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de registros e informações processuais', 'Secretaria Judiciária', 'Stephanie Rodrigues');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de sessões, documentação e jurisprudência', 'Secretaria Judiciária', 'Maria do Socorro');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de recursos e materiais', 'Secretaria de Administração e Finanças', 'Jefferson Pereira');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de finanças e contabilidade', 'Secretaria de Administração e Finanças', 'Adriana Morales');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de serviços gerais', 'Secretaria de Administração e Finanças', 'Davi Chamma');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de pessoal', 'Secretaria de Gestão de Pessoas', 'Fabiana Carvalho');
INSERT INTO coordenadoria (nome_coordenadoria, nome_sec, chefe_coordenadoria) VALUES ('Coordenadoria de capacitação e desenvolvimento', 'Secretaria de Administração e Finanças', 'Carol Coelho');

-- seção
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de análise e desenvolvimento', 'Coordenadoria de desenvolvimento de soluções corporativas', 'Marcelo Lopes');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de banco de dados', 'Coordenadoria de desenvolvimento de soluções corporativas', 'Robson Rossettini de Andrade Costa');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de autuação e distribuição de processos', 'Coordenadoria de registros e informações processuais', 'Marcelo Rocha Monteiro');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de acórdãos e resoluções', 'Coordenadoria de sessões, documentação e jurisprudência', 'Ludmilla Lins Grilo');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de voto informatizado', 'Coordenadoria de cadastro e logística de eleições', 'Rodrigo Donche');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de microinformática', 'Coordenadoria de infraestrutura e suporte', 'Clodoaldo Fernandes');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de licitação e compras', 'Coordenadoria de recursos e materiais', 'Ana Lúcia');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de finanças', 'Coordenadoria de finanças e contabilidade', 'Wellison Pereira');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de serviços administrativos', 'Coordenadoria de serviços gerais', 'Francisco Ferreira');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de sistemas de pessoal', 'Coordenadoria de pessoal', 'Maurício Rossi');
INSERT INTO secao (nome_secao, nome_coordenadoria, chefe_secao) VALUES ('Seção de desempenho organizacional', 'Coordenadoria de capacitação e desenvolvimento', 'Ana Paula');

-- servidor
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04856250091', '19131785', 'Seção de banco de dados', 'Robson Rossettini de Andrade Costa', 'robson.costa@tre-ms.jus.br', 11840, 'Ernesto Geisel', 1286, 'Jardim Florêncio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03446208234', '19131788', 'Seção de análise e desenvolvimento', 'Marcelo Lopes', 'marcelo.lopes@tre-ms.jus.br', 13100, 'Coronel Cerqueira', 920, 'Jardim Ipiranga');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('15646019901', '20130088', 'Seção de autuação e distribuição de processos', 'Marcelo Rocha Monteiro', 'marcelo.monteiro@tre-ms.jus.br', 18400, 'Coronel Cerqueira', 920, 'Jardim Ipiranga');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03386905538', '20200618', 'Seção de acórdãos e resoluções', 'Ludmilla Lins Grilo', 'ludmilla.grilo@tre-ms.jus.br', 14600, 'Itaparica', 916, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('09187236500', '20210101', 'Seção de acórdãos e resoluções', 'Bruna Biato', 'bruna.biato@tre-ms.jus.br', 10000, 'Panonia', 200, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('22247809031', '20210130', 'Seção de acórdãos e resoluções', 'Haylla Santos', 'haylla.santos@tre-ms.jus.br', 10000, 'Barão de Grajaú', 1120, 'Santa Efigênia');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('22375305419', '19009854', 'Seção de voto informatizado', 'Rodrigo Donche', 'rodrigo.donche@tre-ms.jus.br', 8500, 'Coata', 1010, 'Princesa Isabel');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04856222132', '19016703', 'Seção de microinformática', 'Clodoaldo Fernandes', 'clodoaldo.fernandes@tre-ms.jus.br', 11350, 'Pelourinho', 142, 'Mineiros');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04811905592', '20136844', 'Seção de licitação e compras', 'Ana Lúcia', 'ana.lucia@tre-ms.jus.br', 14800, 'Itupeba', 837, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('19016625573', '20206922', 'Seção de finanças', 'Wellison Pereira', 'wellison.pereira@tre-ms.jus.br', 12670, 'Simões', 1230, 'Aero Rancho');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('32488903421', '20201011', 'Seção de serviços administrativos', 'Francisco Ferreira', 'francisco.ferreira@tre-ms.jus.br', 5600, 'Simões', 1230, 'Aero Rancho');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04855672343', '19947921', 'Seção de sistemas de pessoal', 'Maurício Rossi', 'mauricio.rossi@tre-ms.jus.br', 11200, 'Cotipora', 610, 'Moreninhas I');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03386904173', '20130209', 'Seção de desempenho organizacional', 'Ana Paula', 'ana.paula@tre-ms.jus.br', 8000, 'Travessa Guatuba', 41, 'Jardim Montevidéu');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('23753350191', '20101365', 'Seção de desempenho organizacional', 'Carol Coelho', 'carol.coelho@tre-ms.jus.br', 14000, 'Fernando Mattos', 120, 'Jardim Veraneio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04047258011', '20046098', 'Seção de sistemas de pessoal', 'Fabiana Carvalho', 'fabiana.carvalho@tre-ms.jus.br', 8040, 'Bandeirantes', 286, 'Los Angeles');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('11150750812', '20000812', 'Seção de serviços administrativos', 'Davi Chamma', 'davi.chamma@tre-ms.jus.br', 10300, 'Carlos Drummond', 616, 'Coqueiral');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03652250189', '20131201', 'Seção de finanças', 'Adriana Morales', 'adriana.morales@tre-ms.jus.br', 19210, 'Desembargador Pedro Neto', 340, 'Florêncio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('21700236091', '20141903', 'Seção de licitação e compras', 'Jefferson Pereira', 'jefferson.pereira@tre-ms.jus.br', 14440, 'Dom Pedro I', 1200, 'Imperial');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('12489927801', '19911511', 'Seção de acórdãos e resoluções', 'Maria do Socorro', 'maria.socorro@tre-ms.jus.br', 13060, 'Princesa Isabel', 112, 'Imperial');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('04855156391', '20050802', 'Seção de autuação e distribuição de processos', 'Stephanie Rodrigues', 'stephanie.rodrigues@tre-ms.jus.br', 12000, 'Afonso Pena', 2014, 'Coimbra');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('33056221814', '20060612', 'Seção de microinformática', 'Paulo Ferreira', 'paulo.ferreira@tre-ms.jus.br', 7000, 'Ayrton Senna', 50, 'Jardim Passeio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('21890433380', '14082000', 'Seção de voto informatizado', 'João Silva', 'joao.silva@tre-ms.jus.br', 8000, 'Marechal Deodoro da Fonseca', 1400, 'Vila Militar');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('58402265020', '17001931', 'Seção de análise e desenvolvimento', 'Lício Sérgio Ferraz de Brito', 'licio.brito@tre-ms.jus.br', 19000, 'Presidente Vargas', 362, 'Mambucaia');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('10775051080', '10775051', 'Seção de análise e desenvolvimento', 'Leandro Carvalho Almeida', 'leandro.almeida@tre-ms.jus.br', 4600, 'Presidente Juscelino', 800, 'Mambucaia');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('03669186050', '03669186', 'Seção de voto informatizado', 'Matheus Luiz Mendes', 'matheus.mendes@tre-ms.jus.br', 4000, 'Avenida Ana Rosa', 2242, 'Novos Estados');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('13987341017', '13987341', 'Seção de microinformática', 'Paulo Vinícius Coelho', 'paulo.coelho@tre-ms.jus.br', 3300, 'Avenida Araucárias', 1016, 'Jardim Floresta');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('62879835070', '62879835', 'Seção de acórdãos e resoluções', 'João Pedro Saraiva', 'joao.saraiva@tre-ms.jus.br', 850, 'Rua Horto', 348, 'Jardim União');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('60961273046', '60961273', 'Seção de serviços administrativos', 'Laura Fabiana Pessoa', 'laura.pessoa@tre-ms.jus.br', 400, 'Rua Joaquim Murtinho', 3319, 'Pedro Celestino');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('97355621033', '97355621', 'Seção de licitação e compras', 'Gabriel Henrique da Silva', 'gabriel.silva@tre-ms.jus.br', 850, 'Rua Perpétua', 1018, 'Jardim Veraneio');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('41747219045', '41747219', 'Seção de sistemas de pessoal', 'Luis Passos', 'luis.passos@tre-ms.jus.br', 850, 'Rua Sisto', 3302, 'Jardim União');
INSERT INTO servidor (cpf, matricula, nome_secao, nome_servidor, email, salario, rua, numero, bairro) VALUES ('95920585048', '95920585', 'Seção de desempenho organizacional', 'Gabriel Barbosa', 'gabriel.barbosa@tre-ms.jus.br', 850, 'Rua Flamengo', 2019, 'Libertadores');

-- terceirizado
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('03669186050', '03669186', 'Indra Tecnologia');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('13987341017', '13987341', 'Indra Tecnologia');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('10775051080', '10775051', 'TOTVS');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('09187236500', '20210101', 'Biato Santos');
INSERT INTO terceirizado (cpf, matricula, nome_empresa) VALUES ('22247809031', '20210130', 'Biato Santos');

-- efetivo 
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('58402265020', '17001931', 'Analista judiciário', 'Seção de análise e desenvolvimento');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('21890433380', '14082000', 'Analista judiciário', 'Seção de voto informatizado');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('33056221814', '20060612', 'Analista judiciário', 'Seção de microinformática');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04855156391', '20050802', 'Analista judiciário', 'Seção de autuação e distribuição de processos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('12489927801', '19911511', 'Analista judiciário', 'Seção de acórdãos e resoluções');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('21700236091', '20141903', 'Analista judiciário', 'Seção de licitação e compras');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03652250189', '20131201', 'Analista judiciário', 'Seção de finanças');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('11150750812', '20000812', 'Analista judiciário', 'Seção de serviços administrativos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04047258011', '20046098', 'Analista judiciário', 'Seção de sistemas de pessoal');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('23753350191', '20101365', 'Analista judiciário', 'Seção de desempenho organizacional');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03446208234', '19131788', 'Analista judiciário', 'Seção de análise e desenvolvimento');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04856250091', '19131785', 'Analista judiciário', 'Seção de banco de dados');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('15646019901', '20130088', 'Analista judiciário', 'Seção de autuação e distribuição de processos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03386905538', '20200618', 'Analista judiciário', 'Seção de acórdãos e resoluções');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('22375305419', '19009854', 'Analista judiciário', 'Seção de voto informatizado');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04856222132', '19016703', 'Analista judiciário', 'Seção de microinformática');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04811905592', '20136844', 'Analista judiciário', 'Seção de licitação e compras');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('19016625573', '20206922', 'Analista judiciário', 'Seção de finanças');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('32488903421', '20201011', 'Analista judiciário', 'Seção de serviços administrativos');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('04855672343', '19947921', 'Analista judiciário', 'Seção de sistemas de pessoal');
INSERT INTO efetivo (cpf, matricula, cargo, lotacao) VALUES ('03386904173', '20130209', 'Analista judiciário', 'Seção de desempenho organizacional');

-- estagiario
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('62879835070', '62879835', 'Superior incompleto', 'Universidade Federal de Mato Grosso do Sul');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('60961273046', '60961273', 'Ensino médio incompleto', 'Universidade Federal de Mato Grosso do Sul');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('97355621033', '97355621', 'Superior incompleto', 'Universidade Federal de Mato Grosso do Sul');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('41747219045', '41747219', 'Superior incompleto', 'Uniderp');
INSERT INTO estagiario (cpf, matricula, escolaridade, instituicao_ensino) VALUES ('95920585048', '95920585', 'Superior incompleto', 'Universidade Anhanguera');

-- chefe_de_coordenadoria
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('58402265020', '17001931', 'FC06', 'Coordenadoria de desenvolvimento de soluções corporativas');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('21890433380', '14082000', 'FC06', 'Coordenadoria de cadastro e logística de eleições');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('33056221814', '20060612', 'FC06', 'Coordenadoria de infraestrutura e suporte');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('04855156391', '20050802', 'FC06', 'Coordenadoria de registros e informações processuais');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('12489927801', '19911511', 'FC06', 'Coordenadoria de sessões, documentação e jurisprudência');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('21700236091', '20141903', 'FC06', 'Coordenadoria de recursos e materiais');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('03652250189', '20131201', 'FC06', 'Coordenadoria de finanças e contabilidade');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('11150750812', '20000812', 'FC06', 'Coordenadoria de serviços gerais');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('04047258011', '20046098', 'FC06', 'Coordenadoria de pessoal');
INSERT INTO chefe_de_coordenadoria (cpf, matricula, funcao_confianca, coordenadoria) VALUES ('23753350191', '20101365', 'FC06', 'Coordenadoria de capacitação e desenvolvimento');
