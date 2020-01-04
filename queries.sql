/*
1.Quantidade e lista de agendamentos e realização de testes num determinado
intervalo de datas
*/

drop procedure agendamentos;
delimiter //
CREATE PROCEDURE agendamentos (IN dataIni DATETIME, IN dataFim DATETIME, IN realizado BOOLEAN)
    BEGIN
		SELECT Count(*) from AGENDAMENTO_REALIZACAO ag
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = realizado;
    END //
delimiter ;


/*
2.Quantidade de testes clínicos, por tipo de teste, agendada e realizada 
num determinado período.
*/

drop procedure testesClinicos;
delimiter //
CREATE PROCEDURE testesClinicos (IN dataIni DATETIME, IN dataFim DATETIME, IN realizado BOOLEAN)
    BEGIN
		SELECT count(*) as Quantidade, t.Nome, t.idTeste from AGENDAMENTO_REALIZACAO ag
		inner join Teste t on t.idTeste = ag.idTeste
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = realizado group by t.idTeste order by Quantidade DESC;
    END //
delimiter ;

call testesClinicos('2019-01-02', '2019-10-02', 1);




/*
3.Lista de testes clínicos agendados e realizados por um técnico de 
saúde num determinado período (intervalo de datas);
TecnicoX
*/

drop procedure testesDeUmTecnico;
delimiter //
CREATE PROCEDURE testesDeUmTecnico (IN dataIni DATETIME, IN dataFim DATETIME, IN realizado BOOLEAN, IN tecnicoId INT)
    BEGIN
		SELECT ag.idTeste as "Tipo de Teste", ag.Data_Hora_Agendamento as Data, 
		ts.idTecnico_Saude as "id Técnico", ts.Nome as "Nome do Técnico" from AGENDAMENTO_REALIZACAO ag 
		inner join TECNICO_SAUDE ts on ts.idTecnico_Saude = ag.idTecnico
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
        and ag.idTecnico = tecnicoId and ag.realizacao = realizado;
    END //
delimiter ;

call testesDeUmTecnico('2019-01-02', '2019-10-02', 1, 3);




/*
4. Quais os técnicos de saúde associados aos testes clínicos agendados 
e realizados num determinado período.
*/


drop procedure testesETecnico;
delimiter //
CREATE PROCEDURE testesETecnico (IN dataIni DATETIME, IN dataFim DATETIME, IN realizado BOOLEAN)
    BEGIN
		SELECT ag.idTeste as "Tipo de Teste", ag.Data_Hora_Agendamento as Data, 
		ts.idTecnico_Saude as "id Técnico", ts.Nome as "Nome do Técnico" from AGENDAMENTO_REALIZACAO ag 
		inner join TECNICO_SAUDE ts on ts.idTecnico_Saude = ag.idTecnico
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
        and ag.idTecnico = ts.idTecnico_Saude and ag.realizacao = realizado;
    END //
delimiter ;

call testesETecnico('2019-01-02', '2019-10-02', 1);

/*
5. Lista de testes clínicos agendados e realizados por um atleta 
num determinado período (intervalo de datas);
*/

drop procedure testesDeUmAtleta;
delimiter //
CREATE PROCEDURE testesDeUmAtleta (IN dataIni DATETIME, IN dataFim DATETIME, IN realizado BOOLEAN, IN atletaId INT)
    BEGIN
		SELECT ag.idTeste as "Tipo de Teste", ag.Data_Hora_Agendamento as Data, 
		ag.idAtleta as "id Atleta", a.Nome as "Nome do Atleta" from AGENDAMENTO_REALIZACAO ag 
		inner join ATLETA a on a.idAtleta = ag.idAtleta
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = realizado and ag.idAtleta = atletaId;
    END //
delimiter ;

call testesDeUmAtleta('2019-01-02', '2019-10-02', 0, 6);


/*
6.Quais os atletas que agendaram e realizaram testes clínicos em determinada data;
*/


drop procedure testesEAtletas;
delimiter //
CREATE PROCEDURE testesEAtletas (IN dataIni DATETIME, IN dataFim DATETIME, IN realizado BOOLEAN)
    BEGIN
		SELECT t.nome as Teste, ag.Data_Hora_Agendamento as Data, ag.idAtleta as "id Atleta", 
		a.Nome as "Nome do Atleta" from AGENDAMENTO_REALIZACAO ag 
		inner join ATLETA a on a.idAtleta = ag.idAtleta
		inner join TESTE t on t.idTeste = ag.idTeste
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = realizado;
    END //
delimiter ;

call testesEAtletas('2019-01-02', '2019-10-02', 1);


/*
7.Lista dos testes agendados e não realizados num determinado período;
*/

drop procedure testesNaoRealizados;
delimiter //
CREATE PROCEDURE testesNaoRealizados (IN dataIni DATETIME, IN dataFim DATETIME)
    BEGIN
		SELECT t.nome as Teste, 
		ag.Data_Hora_Agendamento as Data from AGENDAMENTO_REALIZACAO ag 
		inner join TESTE t on t.idTeste = ag.idTeste
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = 0;
    END //
delimiter ;

call testesNaoRealizados('2019-01-02', '2019-10-02');




/*
8.Alterar ou cancelar determinado agendamento;
*/


drop procedure cancelaTeste;
delimiter //
CREATE PROCEDURE cancelaTeste (IN dataAgendamento DATETIME, IN idAtleta INT)
    BEGIN
		DELETE FROM AGENDAMENTO_REALIZACAO ag where ag.data_hora_agendamento = dataAgendamento
        and ag.idAtleta = idAtleta;
    END //
delimiter ;

drop procedure alteraTeste;
delimiter //
CREATE PROCEDURE alteraTeste (IN dataAgendamento DATETIME, IN resultado VARCHAR(100), IN novaData DATETIME, IN idAtleta INT)
    BEGIN
		UPDATE AGENDAMENTO_REALIZACAO ag 
        SET ag.data_hora_agendamento = novaData,
            ag.resultado = resultado
        where ag.data_hora_agendamento = dataAgendamento
        and ag.idAtleta = idAtleta;
    END //
delimiter ;



INSERT INTO AGENDAMENTO_REALIZACAO VALUES(null, '2020-10-10 17:00:10', 1, 1, 20, 3, 7);

call cancelaTeste('2020-10-10 17:00:10', 20);

call alteraTeste('2020-10-10 17:00:10', null, '2020-01-10 18:00:10', 20);

call cancelaTeste('2020-01-10 18:00:10', 20);

SELECT * from AGENDAMENTO_REALIZACAO;


/*
9. Qual a modalidade que é mais atendida pelo centro;
*/

SELECT m.idModalidade, m.designacao, count(*) as Atendimento
from AGENDAMENTO_REALIZACAO ag 
inner join ATLETA a on a.idAtleta = ag.idAtleta
inner join MODALIDADE m on m.idModalidade = a.idModalidade
where ag.realizacao = 1 group by m.idModalidade order by Atendimento DESC;


/*
10. Qual o valor monetário arrecadado com os testes clínicos, por tipo de teste,
num determinado intervalo de datas;
*/

drop procedure totalFacturado;
delimiter //
CREATE PROCEDURE totalFacturado (IN dataIni DATETIME, IN dataFim DATETIME)
    BEGIN
		SELECT ifnull(sum(t.preco),0) as Total,t.Nome, count(*) as Quantidade, 
		t.preco as "Preço unitário" from AGENDAMENTO_REALIZACAO ag 
		inner join TESTE t on t.idTeste = ag.idTeste
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = 1 group by t.idTeste order by Total DESC;
    END //
delimiter ;


call totalFacturado('2019-01-02', '2019-10-02');



/*
11. Qual o valor monetário dos testes clínicos, por tipo de teste, 
num determinado intervalo de datas a ser pago pelo estado.
*/


drop procedure totalEstado;
delimiter //
CREATE PROCEDURE totalEstado (IN dataIni DATETIME, IN dataFim DATETIME)
    BEGIN
		SELECT ifnull(sum((t.preco * t.Comparticipacao_estatal)),0) as Total,
		t.Nome, count(*) as Quantidade, t.preco as "Preço unitário", 
		t.comparticipacao_estatal from AGENDAMENTO_REALIZACAO ag 
		inner join TESTE t on t.idTeste = ag.idTeste
		where (ag.Data_hora_Agendamento between dataIni and dataFim)
		and ag.realizacao = 1 group by t.idTeste order by Total DESC;
    END //
delimiter ;


call totalEstado('2019-01-02', '2019-10-02');



