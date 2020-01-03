/* 
 * INSERIR MODALIDADE
 */
DROP PROCEDURE IF EXISTS inserir_modalidade;
DELIMITER $$
CREATE PROCEDURE inserir_modalidade(IN designacao VARCHAR(45),
                                    IN categoria VARCHAR(45))

BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;

    START TRANSACTION;
	SELECT MAX(idModalidade) + 1 INTO @id FROM Modalidade;
    INSERT INTO Modalidade VALUES (id, designacao, categoria);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$

/* 
 * INSERIR CÓDIGO POSTAL
 */
DROP PROCEDURE IF EXISTS inserir_codigo_postal;
DELIMITER $$
CREATE PROCEDURE inserir_codigo_postal(IN cp VARCHAR(8),
                                       IN concelho VARCHAR(45))

BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;

    START TRANSACTION;
    INSERT INTO Codigo_Postal VALUES (cp, concelho);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$

/* 
 * INSERIR ATLETA
 */
DROP PROCEDURE IF EXISTS inserir_atleta;
DELIMITER $$
CREATE PROCEDURE inserir_atleta(IN nome VARCHAR(45),
                                IN morada VARCHAR(45),
                                IN cp VARCHAR(8),
                                IN nif INT(11),
                                IN data_nascimento DATE,
                                IN idModalidade INT(11))

BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
    DECLARE NAO_EXISTE CONDITION FOR SQLSTATE '45000';
	DECLARE EXIT HANDLER FOR NAO_EXISTE RESIGNAL;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;


	IF NOT EXISTS (SELECT 1 FROM Codigo_Postal WHERE Codigo_Postal = cp)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O código postal não existe.';    
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM Modalidade AS M WHERE M.idModalidade = idModalidade)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'A modalidade não existe.'; 
	END IF;
    
    START TRANSACTION;
	SELECT MAX(idAtleta) + 1 INTO @id FROM Atleta;
    INSERT INTO Atleta VALUES (id, nome, morada, cp, nif, data_nascimento, idModalidade);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$

/* 
 * INSERIR TECNICO DE SAUDE
 */
DROP PROCEDURE IF EXISTS inserir_tecnico_saude;
DELIMITER $$
CREATE PROCEDURE inserir_tecnico_saude(IN nome VARCHAR(45),
									   IN morada VARCHAR(45),
									   IN cp VARCHAR(8),
									   IN categoria VARCHAR(45))

BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
    DECLARE NAO_EXISTE CONDITION FOR SQLSTATE '45000';
	DECLARE EXIT HANDLER FOR NAO_EXISTE RESIGNAL;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;

	IF NOT EXISTS (SELECT 1 FROM Codigo_Postal WHERE Codigo_Postal = cp)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O código postal não existe.';    
    END IF;
    
    START TRANSACTION;
	SELECT MAX(idTecnico_Saude) + 1 INTO @id FROM Tecnico_Saude;
    INSERT INTO Tecnico_Saude VALUES (id, nome, morada, cp, categoria);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$


/* 
 * INSERIR MEDICO
 */
DROP PROCEDURE IF EXISTS inserir_medico;
DELIMITER $$
CREATE PROCEDURE inserir_medico(IN nome VARCHAR(45),
								IN especialidade VARCHAR(45),
							    IN morada VARCHAR(45),
								IN cp VARCHAR(8))

BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
    DECLARE NAO_EXISTE CONDITION FOR SQLSTATE '45000';
	DECLARE EXIT HANDLER FOR NAO_EXISTE RESIGNAL;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;

	IF NOT EXISTS (SELECT 1 FROM Codigo_Postal WHERE Codigo_Postal = cp)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O código postal não existe.';    
    END IF;
    
    START TRANSACTION;
	SELECT MAX(idMedico) + 1 INTO @id FROM Medico;
    INSERT INTO Medico VALUES (id, nome, especialidade, morada, cp);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$

/* 
 * INSERIR TESTE
 */
DROP PROCEDURE IF EXISTS inserir_teste;
DELIMITER $$
CREATE PROCEDURE inserir_teste(IN nome VARCHAR(45),
							   IN preco DECIMAL(6,2),
							   IN compart_estat DECIMAL(3,2))

BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;
    
    START TRANSACTION;
	SELECT MAX(idTeste) + 1 INTO @id FROM Teste;
    INSERT INTO Teste VALUES (id, nome, preco, compart_estat);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$

/* 
 * INSERIR AGENDAMENTO REALIZAÇÃO
 */
DROP PROCEDURE IF EXISTS inserir_agendamento_realizacao;
DELIMITER $$
CREATE PROCEDURE inserir_agendamento_realizacao(IN resultado VARCHAR(100),
											    IN data_hora DATETIME,
												IN realizacao TINYINT(4),
												IN idTeste INT(11),
                                                IN idAtleta INT(11),
                                                IN idTecnico INT(11),
                                                IN idMedico INT(11))
BEGIN 
	DECLARE	error BOOL DEFAULT 0;
	DECLARE id INT(11) DEFAULT 0;
    DECLARE NAO_EXISTE CONDITION FOR SQLSTATE '45000';
	DECLARE EXIT HANDLER FOR NAO_EXISTE RESIGNAL;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;

	IF NOT EXISTS (SELECT 1 FROM Teste AS T WHERE T.idTeste = idTeste)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O teste não existe.';    
    END IF;
    
	IF NOT EXISTS (SELECT 1 FROM Atleta AS A WHERE A.idAtleta = idAtleta)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O atleta não existe.';    
    END IF;
    
	IF NOT EXISTS (SELECT 1 FROM Tecnico_Saude AS TS WHERE TS.idTecnico_Saude = idTecnico)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O técnico de saúde não existe.';    
    END IF;
    
	IF NOT EXISTS (SELECT 1 FROM Medico AS M WHERE M.idMedico = idMedico)
		THEN SIGNAL NAO_EXISTE
			 SET MESSAGE_TEXT = 'O médico não existe.';    
    END IF;
    
    START TRANSACTION;
    INSERT INTO Agendamento_Realizacao VALUES (resultado, data_hora, realizacao, idTeste, idAtleta, idTecnico, idMedico);
    
    IF error
		THEN ROLLBACK;
        ELSE COMMIT;
	END IF;
END; $$
DELIMITER $$

/*
 * TRIGGER PARA IMPEDIR QUE SE INSIRA UM TESTE EM QUE UM TECNICO 
 * REALIZE OUTRO NA MESMA HORA, OU QUE O ATLETA REALIZE UM NESSA MESMA HORA
 */
DROP TRIGGER IF EXISTS agendamentoRealizacao;
DELIMITER $$
CREATE TRIGGER agendamentoRealizacao
BEFORE INSERT ON Agendamento_Realizacao
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM Agendamento_Realizacao AS AR WHERE (AR.Data_Hora_Agendamento = NEW.Data_Hora_Agendamento AND AR.idTecnico = NEW.idTecnico)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe um agendamento com o técnico de saúde indicado para a data e hora fornecidas.';
	END IF;
    
    IF EXISTS (SELECT 1 FROM Agendamento_Realizacao AS AR WHERE (AR.Data_Hora_Agendamento = NEW.Data_Hora_Agendamento AND AR.idAtleta = NEW.idAtleta)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe um agendamento com o atleta indicado para a data e hora fornecidas.';
	END IF;
    
    IF (NEW.Realizacao = 0 AND LENGTH(NEW.Resultado) > 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Não pode existir resultado quando o exame ainda não foi realizado.';
	END IF;
    
    IF (NEW.Realizacao = 1 AND LENGTH(NEW.Resultado) = 0) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'O exame foi realizado, mas não existe resultado.';
    END IF;
END; $$
DELIMITER $$

/*
 * TRIGGER PARA IMPEDIR QUE SE INSIRA UM ATLETA COM O MESMO NIF
 */
DROP TRIGGER IF EXISTS inserirAtleta;
DELIMITER $$
CREATE TRIGGER inserirAtleta
BEFORE INSERT ON Atleta
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM Atleta AS A WHERE A.NIF = NEW.NIF) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe um atleta com o NIF fornecido.';
	END IF;
END; $$
DELIMITER $$

/*
 * TRIGGER PARA IMPEDIR QUE SE INSIRA UMA MODALIDADE REPETIDA
 */
DROP TRIGGER IF EXISTS inserirModalidade;
DELIMITER $$
CREATE TRIGGER inserirModalidade
BEFORE INSERT ON Modalidade
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM Modalidade AS M WHERE M.Designacao = NEW.Designacao AND M.Categoria = NEW.Categoria) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe uma modalidade com os dados fornecidos.';
	END IF;
END; $$

/*
 * TRIGGER PARA IMPEDIR QUE SE INSIRA O MESMO CÓDIGO POSTAL
 */
DROP TRIGGER IF EXISTS inserirCP;
DELIMITER $$
CREATE TRIGGER inserirCP
BEFORE INSERT ON Codigo_Postal
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM Codigo_Postal AS CP WHERE CP.Codigo_Postal = NEW.Codigo_Postal) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Já existe um código postal igual ao que forneceu.';
	END IF;
END; $$
DELIMITER $$

CREATE USER 'admin'@'localhost';
	SET PASSWORD FOR 'admin'@'localhost' = 'adminpass';
    
GRANT SELECT, INSERT, DELETE, UPDATE ON Trabalho.* TO 'admin'@'localhost'
	WITH GRANT OPTION;
    

CREATE USER 'medico1'@'localhost';
	SET PASSWORD FOR 'medico1'@'localhost' = 'medico1pass';

CREATE USER 'medico2'@'localhost';
	SET PASSWORD FOR 'medico2'@'localhost' = 'medico2pass';
    
CREATE USER 'medico3'@'localhost';
	SET PASSWORD FOR 'medico3'@'localhost' = 'medico3pass';
    
CREATE USER 'medico4'@'localhost';
	SET PASSWORD FOR 'medico4'@'localhost' = 'medico4pass';
    
    
CREATE USER 'tecnicoSaude1'@'localhost';
	SET PASSWORD FOR 'tecnicoSaude1'@'localhost' = 'tecnicoSaude1pass';
    
CREATE USER 'tecnicoSaude2'@'localhost';
	SET PASSWORD FOR 'tecnicoSaude2'@'localhost' = 'tecnicoSaude2pass';

CREATE USER 'tecnicoSaude3'@'localhost';
	SET PASSWORD FOR 'tecnicoSaude3'@'localhost' = 'tecnicoSaude3pass';

CREATE USER 'tecnicoSaude4'@'localhost';
	SET PASSWORD FOR 'tecnicoSaude4'@'localhost' = 'tecnicoSaude4pass';
    

/*
 *  PERMISSÕES PARA MÉDICOS                                                         
 */             
 
GRANT SELECT, INSERT, DELETE, UPDATE ON Trabalho.Teste TO 'medico1'@'localhost',
														  'medico2'@'localhost',
                                                          'medico3'@'localhost',
                                                          'medico4'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE ON Trabalho.Agendamento_Realizacao TO 'medico1'@'localhost',
																		   'medico2'@'localhost',
																		   'medico3'@'localhost',
																		   'medico4'@'localhost';
GRANT SELECT ON Trabalho.Atleta TO 'medico1'@'localhost',
								   'medico2'@'localhost',
								   'medico3'@'localhost',
								   'medico4'@'localhost';
                                   
REVOKE INSERT, DELETE, UPDATE ON Trabalho.Atleta FROM 'medico1'@'localhost',
													  'medico2'@'localhost',
													  'medico3'@'localhost',
													  'medico4'@'localhost';                                   
                                   
GRANT SELECT ON Trabalho.Modalidade TO 'medico1'@'localhost',
									   'medico2'@'localhost',
									   'medico3'@'localhost',
									   'medico4'@'localhost';

REVOKE INSERT, DELETE, UPDATE ON Trabalho.Modalidade FROM 'medico1'@'localhost',
														  'medico2'@'localhost',
													      'medico3'@'localhost',
													      'medico4'@'localhost';                                            
                                       
GRANT SELECT ON Trabalho.Codigo_Postal TO 'medico1'@'localhost',
										  'medico2'@'localhost',
									      'medico3'@'localhost',
									      'medico4'@'localhost';
                                          
REVOKE INSERT, DELETE, UPDATE ON Trabalho.Codigo_Postal FROM 'medico1'@'localhost',
															 'medico2'@'localhost',
													         'medico3'@'localhost',
													         'medico4'@'localhost';                                               

GRANT SELECT ON Trabalho.Medico TO 'medico1'@'localhost',
								   'medico2'@'localhost',
								   'medico3'@'localhost',
								   'medico4'@'localhost';

REVOKE INSERT, DELETE, UPDATE ON Trabalho.Medico FROM 'medico1'@'localhost',
													  'medico2'@'localhost',
													  'medico3'@'localhost',
													  'medico4'@'localhost';                                          
                                   
GRANT SELECT ON Trabalho.Tecnico_Saude TO 'medico1'@'localhost',
								          'medico2'@'localhost',
								          'medico3'@'localhost',
										  'medico4'@'localhost';

REVOKE INSERT, DELETE, UPDATE ON Trabalho.Tecnico_Saude FROM 'medico1'@'localhost',
													         'medico2'@'localhost',
														     'medico3'@'localhost',
													         'medico4'@'localhost';
                                                             
/*
 *  PERMISSÕES PARA TÉCNICOS DE SAÚDE                                                            
 */ 
 
GRANT SELECT, INSERT, DELETE, UPDATE ON Trabalho.Teste TO 'tecnicoSaude1'@'localhost',
														  'tecnicoSaude2'@'localhost',
                                                          'tecnicoSaude3'@'localhost',
                                                          'tecnicoSaude4'@'localhost';

GRANT SELECT, INSERT, DELETE, UPDATE ON Trabalho.Agendamento_Realizacao TO 'tecnicoSaude1'@'localhost',
																		   'tecnicoSaude2'@'localhost',
																		   'tecnicoSaude3'@'localhost',
																		   'tecnicoSaude4'@'localhost';
GRANT SELECT ON Trabalho.Atleta TO 'tecnicoSaude1'@'localhost',
								   'tecnicoSaude2'@'localhost',
								   'tecnicoSaude3'@'localhost',
								   'tecnicoSaude4'@'localhost';
                                   
REVOKE INSERT, DELETE, UPDATE ON Trabalho.Atleta FROM 'tecnicoSaude1'@'localhost',
													  'tecnicoSaude2'@'localhost',
													  'tecnicoSaude3'@'localhost',
													  'tecnicoSaude4'@'localhost';                                   
                                   
GRANT SELECT ON Trabalho.Modalidade TO 'tecnicoSaude1'@'localhost',
									   'tecnicoSaude2'@'localhost',
									   'tecnicoSaude3'@'localhost',
									   'tecnicoSaude4'@'localhost';

REVOKE INSERT, DELETE, UPDATE ON Trabalho.Modalidade FROM 'tecnicoSaude1'@'localhost',
														  'tecnicoSaude2'@'localhost',
													      'tecnicoSaude3'@'localhost',
													      'tecnicoSaude4'@'localhost';                                            
                                       
GRANT SELECT ON Trabalho.Codigo_Postal TO 'tecnicoSaude1'@'localhost',
										  'tecnicoSaude2'@'localhost',
									      'tecnicoSaude3'@'localhost',
									      'tecnicoSaude4'@'localhost';
                                          
REVOKE INSERT, DELETE, UPDATE ON Trabalho.Codigo_Postal FROM 'tecnicoSaude1'@'localhost',
															 'tecnicoSaude2'@'localhost',
													         'tecnicoSaude3'@'localhost',
													         'tecnicoSaude4'@'localhost';                                               

GRANT SELECT ON Trabalho.Medico TO 'tecnicoSaude1'@'localhost',
								   'tecnicoSaude2'@'localhost',
								   'tecnicoSaude3'@'localhost',
								   'tecnicoSaude4'@'localhost';

REVOKE INSERT, DELETE, UPDATE ON Trabalho.Medico FROM 'tecnicoSaude1'@'localhost',
													  'tecnicoSaude2'@'localhost',
													  'tecnicoSaude3'@'localhost',
													  'tecnicoSaude4'@'localhost';                                          
                                   
GRANT SELECT ON Trabalho.Tecnico_Saude TO 'tecnicoSaude1'@'localhost',
								          'tecnicoSaude2'@'localhost',
								          'tecnicoSaude3'@'localhost',
										  'tecnicoSaude4'@'localhost';

REVOKE INSERT, DELETE, UPDATE ON Trabalho.Tecnico_Saude FROM 'tecnicoSaude1'@'localhost',
													         'tecnicoSaude2'@'localhost',
														     'tecnicoSaude3'@'localhost',
													         'tecnicoSaude4'@'localhost';                                                                  
                                   
CREATE VIEW examesView AS SELECT * FROM Agendamento_Realizacao WHERE SELECT USER(),CURRENT_USER();;
