use Trabalho;

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
INSERT INTO Modalidade VALUES(4, "lançamento", "lançamento do peso");
INSERT INTO Modalidade VALUES(5, "corrida de fundo", "maratona");
INSERT INTO Modalidade VALUES(6, "corrida de fundo", "10000 metros");
INSERT INTO Modalidade VALUES(7, "corrida de pista", "100 metros");
INSERT INTO Modalidade VALUES(8, "corrida de pista", "400 metros");
INSERT INTO Modalidade VALUES(9, "corrida de pista", "200 metros");
INSERT INTO Modalidade VALUES(10, "corrida de pista", "obstaculos");
INSERT INTO Modalidade VALUES(11, "salto", "salto em comprimento");
INSERT INTO Modalidade VALUES(12, "salto", "salto em altura");
INSERT INTO Modalidade VALUES(13, "salto", "triplo salto");
INSERT INTO Modalidade VALUES(14, "salto", "salto com vara");
INSERT INTO Modalidade VALUES(15, "decaptlo", "masculina");
INSERT INTO Modalidade VALUES(16, "heptatlo", "feminina");




INSERT INTO Atleta VALUES(1, "João Silva", "Rua da Arcela, n.º 15", "4800-010", 230485912, DATE('1989-05-12'), 2);
INSERT INTO Atleta VALUES(2, "Ana Cardoso", "Rua da Cima, n.º 34", "4800-015", 280485912, DATE('1995-05-20'), 3);
INSERT INTO Atleta VALUES(3, "Maria Cristina Salgado", "Rua Damião de Góis, n.º 3, 3.º esq.", "4700-028", 280485912, DATE('1999-01-22'), 1);
INSERT INTO Atleta VALUES(4, "António Martins", "Rua da Liberdade, n.º 45", "4700-028", 280485912, DATE('1999-12-31'), 15);
INSERT INTO Atleta VALUES(5, "Fernanda Vieira", "Avenida da Paz, n.º 100", "4000-005", 282385912, DATE('2000-07-10'), 6);
INSERT INTO Atleta VALUES(6, "Vanessa Martins", "Rua da Boa Hora, n.º 1", "4990-038", 134385912, DATE('1997-10-14'), 16);
INSERT INTO Atleta VALUES(7, "Ronaldo Almeida", "Avenida de Braga, n.º 45", "4700-028", 28049812, DATE('1998-02-28'), 10);


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


INSERT INTO TECNICO_SAUDE VALUES(1, "Arnaldo Amarante", "Largo da Ponte Velha, nº 23", "5000-109", "Fisioterapeuta");
INSERT INTO TECNICO_SAUDE VALUES(2, "Ana Salgado", "Rua Eça de Queiros, n.º 130", "4700-028", "Enfermeira");
INSERT INTO TECNICO_SAUDE VALUES(3, "Anabela Lima", "Rua da Porta Aberta, n.º 134", "4900-129", "Radiologista");


INSERT INTO AGENDAMENTO_REALIZACAO VALUES("cardiomiopatia hipertrofica", DATE'2019-10-15', DATE'2019-10-23', 1, 2, 2, 1);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("fractura do peronio", DATE'2019-09-15', DATE'2019-09-29', 1, 7, 3, 3);
INSERT INTO AGENDAMENTO_REALIZACAO VALUES("luxação muscular na coxa", DATE'2019-08-07', DATE'2019-08-18', 8, 3, 2, 2);






