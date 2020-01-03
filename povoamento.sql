use Trabalho;

/*
O mesmo tecnico de saúde e o mesmo atleta não podem estar a realizar testes diferentes no mesmo horário.
O mesmo atleta só pratica uma única modalidade.
TRUNCATE AGENDAMENTO_REALIZACAO;
TRUNCATE TECNICO_SAUDE;
TRUNCATE MEDICO;
TRUNCATE TESTE;
TRUNCATE ATLETA;
TRUNCATE MODALIDADE;
TRUNCATE CODIGO_POSTAL;
*/


INSERT INTO CODIGO_POSTAL VALUES("4700-028", "Braga");
INSERT INTO CODIGO_POSTAL VALUES("4800-010", "Guimaraes");
INSERT INTO CODIGO_POSTAL VALUES("4800-015", "Guimaraes");
INSERT INTO CODIGO_POSTAL VALUES("4000-009", "Porto");
INSERT INTO CODIGO_POSTAL VALUES("4000-005", "Porto");
INSERT INTO CODIGO_POSTAL VALUES("4900-129", "Viana do Castelo");
INSERT INTO CODIGO_POSTAL VALUES("5000-109", "Vila Real");
INSERT INTO CODIGO_POSTAL VALUES("4730-003", "Vila Verde");
INSERT INTO CODIGO_POSTAL VALUES("4900-100", "Viana do Castelo");
INSERT INTO CODIGO_POSTAL VALUES("4990-038", "Ponte de Lima");


INSERT INTO Modalidade VALUES(1, "lançamento", "lançamento do martelo");
INSERT INTO Modalidade VALUES(2, "lançamento", "lançamento do disco");
INSERT INTO Modalidade VALUES(3, "lançamento", "lançamento do peso");
INSERT INTO Modalidade VALUES(4, "corrida de fundo", "maratona");
INSERT INTO Modalidade VALUES(5, "corrida de fundo", "10000 metros");
INSERT INTO Modalidade VALUES(6, "corrida de pista", "100 metros");
INSERT INTO Modalidade VALUES(7, "corrida de pista", "400 metros");
INSERT INTO Modalidade VALUES(8, "corrida de pista", "obstaculos");
INSERT INTO Modalidade VALUES(9, "salto", "triplo salto");
INSERT INTO Modalidade VALUES(10, "salto", "salto com vara");
INSERT INTO Modalidade VALUES(11, "decaptlo", "masculina");
INSERT INTO Modalidade VALUES(12, "heptatlo", "feminina");

INSERT INTO Atleta VALUES(1, "João Silva", "Rua da Arcela, n.º 15", "4800-010", 230485912, DATE('1989-05-12'), 2);
INSERT INTO Atleta VALUES(2, "Ana Cardoso", "Rua da Cima, n.º 34", "4800-015", 280485912, DATE('1995-05-20'), 3);
INSERT INTO Atleta VALUES(3, "Maria Cristina Salgado", "Rua Damião de Góis, n.º 3, 3.º esq.", "4700-028", 280483612, DATE('1999-01-22'), 1);
INSERT INTO Atleta VALUES(4, "António Martins", "Rua da Liberdade, n.º 45", "4700-028", 280455212, DATE('1999-12-31'), 12);
INSERT INTO Atleta VALUES(5, "Fernanda Vieira", "Avenida da Paz, n.º 100", "4000-005", 282385912, DATE('2000-07-10'), 6);
INSERT INTO Atleta VALUES(6, "Vanessa Martins", "Rua da Boa Hora, n.º 1", "4990-038", 134385912, DATE('1997-10-14'), 13);
INSERT INTO Atleta VALUES(7, "Ronaldo Almeida", "Avenida de Braga, n.º 45", "4700-028", 28049812, DATE('1998-02-28'), 9);
INSERT INTO Atleta VALUES(8, "Carlos Mota Martins", "Avenida de Guimaraes, n.º 459", "4800-015", 28349812, DATE('1996-01-28'), 10);
INSERT INTO Atleta VALUES(9, "Carla Antunes", "Avenida do Desporto, n.º 4", "4800-015", 24249885, DATE('1996-03-20'), 11);
INSERT INTO Atleta VALUES(10, "Catarina Dias", "Rua da Cidade, n.º 3", "4700-028", 24203885, DATE('1998-03-20'), 9);
INSERT INTO Atleta VALUES(11, "João Pedro Correia", "Rua da Vida, n.º 23", "4700-028", 24503286, DATE('1999-08-17'), 3);
INSERT INTO Atleta VALUES(12, "Catarina Antunes", "Rua da Cidade, n.º 3", "4900-100", 24213885, DATE('1998-03-29'), 1);
INSERT INTO Atleta VALUES(13, "Rita Paris", "Rua da Consternação, n.º 39", "4800-015", 24298865, DATE('1998-11-19'), 9);
INSERT INTO Atleta VALUES(14, "António Andrade Viana", "Avenida dos Cisnes, n.º 63", "4700-028", 243453885, DATE('1997-11-01'), 5);
INSERT INTO Atleta VALUES(15, "Armando Carvalho", "Alameda dos Desportos, n.º 345", "4000-005", 249623885, DATE('1998-04-09'), 7);
INSERT INTO Atleta VALUES(16, "Tomás Antunes", "Travessa dos Reis, n.º 11", "4800-015", 12303885, DATE('1996-03-22'), 5);
INSERT INTO Atleta VALUES(17, "Camilo Vieira", "Avenida da Boa Nova, n.º 19", "4700-028", 21203974, DATE('1995-06-10'), 4);
INSERT INTO Atleta VALUES(18, "Fátima Lima", "Avenida General Humberto Delgado, n.º 53", "4700-028", 21203885, DATE('2000-01-01'), 1);
INSERT INTO Atleta VALUES(19, "Valter Carvalho", "Rua dos Mártires, n.º 1920", "5000-109", 29303885, DATE('1998-06-30'), 8);
INSERT INTO Atleta VALUES(20, "Paula Braga", "Avenida Conde Margaride, n.º 124", "4900-100", 115703885, DATE('1996-04-01'), 10);


INSERT INTO Teste VALUES(1, "eletrocardiograma", 1.35, 0.7);
INSERT INTO Teste VALUES(2, "analises clinicas gerais", 10, 0.8);
INSERT INTO Teste VALUES(3, "raioX", 15, 0.8);
INSERT INTO Teste VALUES(4, "ecocardiograma", 5, 0.7);
INSERT INTO Teste VALUES(5, "ecografia", 30, 0.6);
INSERT INTO Teste VALUES(6, "prova de esforço", 50.66, 0.85);
INSERT INTO Teste VALUES(7, "TAC", 190.45, 0.85);
INSERT INTO Teste VALUES(8, "Exame ortopédico", 34.56, 0.77);


INSERT INTO Medico VALUES(1, "Alberto João Antunes", "Cardiologia", "Travessa do António, n.º 25", "4730-003");
INSERT INTO Medico VALUES(2, "Carolina Silva", "Medicina Interna", "Avenida da Universidade, Lote 5, 1.º esq.", "4800-015");
INSERT INTO Medico VALUES(3, "Amadeu Sampaio", "Ortopedia", "Largo da Ponte Nova, nº 23", "4990-038");
INSERT INTO Medico VALUES(4, "Luis Abreu", "Medicina Geral", "Rua da Parede, nº 44", "4730-003");
INSERT INTO Medico VALUES(5, "Casimiro Ribeiro", "Reumatologista", "Avenida da Guia, nº 4045", "5000-109");
INSERT INTO Medico VALUES(6, "Maria da Graça Machado", "Medicina Física e de Reabilitação", "Rua da Paz, nº 45", "4900-100");
INSERT INTO Medico VALUES(7, "Alexandre Tinoco", "Medicina Desportiva", "Rua do Bom Viver, nº 45", "4800-010");





INSERT INTO TECNICO_SAUDE VALUES(1, "Arnaldo Amarante", "Largo da Ponte Velha, nº 23", "4000-009", "Enfermeiro");
INSERT INTO TECNICO_SAUDE VALUES(2, "Ana Salgado", "Rua Eça de Queiros, n.º 130", "4700-028", "Enfermeira");
INSERT INTO TECNICO_SAUDE VALUES(3, "Anabela Lima", "Rua da Porta Aberta, n.º 134", "4900-129", "Radiologista");
INSERT INTO TECNICO_SAUDE VALUES(4, "Maria da Assunção Lima Cardoso", "Rua da Ameixa, n.º 8", "4700-028", "Radiologista");
INSERT INTO TECNICO_SAUDE VALUES(5, "António Sales Silva", "Rua do Bom Viver, n.º 15", "4990-038", "Enfermeiro");
INSERT INTO TECNICO_SAUDE VALUES(6, "Amélia Cardoso Rodrigues", "Rua do Bom Sucesso, n.º 10, 1.º dto.", "4800-015", "Enfermeira");
INSERT INTO TECNICO_SAUDE VALUES(7, "Américo Tomás", "Avenida da República, n.º 110", "4800-010", "Enfermeiro");

INSERT INTO AGENDAMENTO_REALIZACAO VALUES("cardiomiopatia hipertrofica", '2019-01-01 11:45:10', 1, 1, 2, 2, 1);   
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("fractura do peronio", '2019-01-02 09:00:10', 1, 3, 7, 3, 3);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("inflamação na zona da fratura", '2019-03-02 09:00:10', 1, 2, 7, 2, 3);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("luxação muscular na coxa", '2019-01-03 10:30:10', 1, 8, 3, 2, 2);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("espondilose", '2019-01-04 10:10:10', 1, 7, 13, 1, 4);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("ruptura de ligamentos", '2019-01-05 17:18:10', 1, 8, 12, 4, 5);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("anemia", '2019-02-01 08:15:10', 1, 2, 10, 6, 1);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("distensão muscular", '2019-03-01 15:30:10', 1, 8, 11, 7, 6);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("entorse do tornozelo direito", '2019-04-01 15:30:10', 1, 3, 15, 4, 7);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("entorse do tornozelo esquerdo", '2019-05-01 17:30:10', 1, 3, 15, 4, 7);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("sopro cardiaco", '2019-05-01 16:15:10', 1, 4, 16, 2, 1);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES(null, '2019-06-01 16:15:10', 0, 2, 9, 5, 7);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES(null, '2019-06-02 16:15:10', 0, 4, 4, 1, 1);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("entorse pulso", '2019-07-01 14:30:10', 1, 3, 1, 3, 3);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("Arritmia cardíaca", '2019-07-03 14:50:10', 1, 6, 5, 4, 2);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES(null, '2019-07-04 11:00:10', 0, 6, 6, 1, 2);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("fractura no dedo indicador", '2019-07-05 14:50:10', 1, 3, 8, 3, 7);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("fractura no polegar", '2019-07-06 14:50:10', 1, 3, 8, 3, 7);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("diabetes tipo 2", '2019-07-10 11:30:10', 1, 2, 14, 7, 2);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("Arritmia cardíaca", '2019-09-10 18:30:10', 1, 6, 14, 4, 2);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES(null, '2019-08-03 14:50:10', 0, 7, 17, 3, 1);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("Regurgitação mitral", '2019-09-01 09:50:10', 1, 5, 18, 4, 4);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("Bursite", '2019-10-03 14:50:10', 1, 5, 19, 4, 2);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("fractura tíbia", '2019-11-13 14:00:10', 1, 7, 20, 3, 7);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("Arritmia cardíaca", '2019-12-13 19:00:10', 1, 6, 20, 4, 2);