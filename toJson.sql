use Trabalho;

SELECT json_object(
'resultado', a_r.Resultado, 
'realização', a_r.Realizacao, 
'date_time_agendamento', DATE_FORMAT(a_r.Data_Hora_Agendamento,'%Y-%m-%dT%TZ'),
'atleta', json_object('id', atl.idAtleta, 'nome', atl.Nome, 'nif', atl.NIF , 'data_nascimento', DATE_FORMAT(atl.data_nascimento,'%Y-%m-%dT%TZ'),
 'morada' , atl.Morada,  'codigo_postal', json_object('codigo_postal' , cp_atl.Codigo_Postal, 'concelho', cp_atl.Concelho), 
 'modalidade', json_object('id' , moda.idModalidade, 'designacao', moda.designacao, 'categoria', moda.categoria)),
'teste', json_object('id', t.idTeste, 'nome', t.Nome, 'preco', t.Preco, 'comparticipacao_estatal', t.Comparticipacao_estatal ),
'medico', json_object('id', m.idMedico, 'nome', m.Nome, 'especialidade', m.Especialidade, 'morada', m.Morada,  'codigo_postal', 
json_object('codigo_postal' , cp_med.Codigo_Postal, 'concelho', cp_med.Concelho)),
'tecnico_saude', json_object('id', ts.idTecnico_Saude, 'nome', ts.Nome, 'categoria', ts.Categoria, 'morada', ts.Morada,  'codigo_postal', 
json_object('codigo_postal' , cp_tec.Codigo_Postal, 'concelho', cp_tec.Concelho))
) AS 'json' 
INTO OUTFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\trabalho.json'
FROM AGENDAMENTO_REALIZACAO As a_r
INNER JOIN Atleta As atl ON atl.idAtleta=a_r.idAtleta
INNER JOIN CODIGO_POSTAL As cp_atl ON cp_atl.Codigo_Postal=atl.Codigo_Postal
INNER JOIN Modalidade As moda ON moda.idModalidade=atl.idModalidade
INNER JOIN Teste As t on t.idTeste = a_r.idTeste
INNER JOIN Medico As m on m.idMedico = a_r.idMedico
INNER JOIN CODIGO_POSTAL As cp_med ON cp_med.Codigo_Postal=m.Codigo_Postal
INNER JOIN TECNICO_SAUDE As ts on ts.idTecnico_Saude = a_r.idTecnico
INNER JOIN CODIGO_POSTAL As cp_tec ON cp_tec.Codigo_Postal=ts.Codigo_Postal;

SELECT json_pretty(json_object(
'resultado', a_r.Resultado, 
'realização', a_r.Realizacao, 
'date_time_agendamento', DATE_FORMAT(a_r.Data_Hora_Agendamento,'%Y-%m-%dT%TZ'),
'atleta', JSON_ARRAY(json_object('id', atl.idAtleta, 'nome', atl.Nome, 'nif', atl.NIF , 'data_nascimento', DATE_FORMAT(atl.data_nascimento,'%Y-%m-%dT%TZ'),
 'morada' , atl.Morada,  'codigo_postal', json_object('codigo_postal' , cp_atl.Codigo_Postal, 'concelho', cp_atl.Concelho), 
 'modalidade', json_object('id' , moda.idModalidade, 'designacao', moda.designacao, 'categoria', moda.categoria))),
'teste', JSON_ARRAY(json_object('id', t.idTeste, 'nome', t.Nome, 'preco', t.Preco, 'comparticipacao_estatal', t.Comparticipacao_estatal )),
'medico', JSON_ARRAY(json_object('id', m.idMedico, 'nome', m.Nome, 'especialidade', m.Especialidade, 'morada', m.Morada,  'codigo_postal', 
json_object('codigo_postal' , cp_med.Codigo_Postal, 'concelho', cp_med.Concelho))),
'tecnico_saude', JSON_ARRAY(json_object('id', ts.idTecnico_Saude, 'nome', ts.Nome, 'categoria', ts.Categoria, 'morada', ts.Morada,  'codigo_postal', 
json_object('codigo_postal' , cp_tec.Codigo_Postal, 'concelho', cp_tec.Concelho)))
)) AS 'json' 
FROM AGENDAMENTO_REALIZACAO As a_r
INNER JOIN Atleta As atl ON atl.idAtleta=a_r.idAtleta
INNER JOIN CODIGO_POSTAL As cp_atl ON cp_atl.Codigo_Postal=atl.Codigo_Postal
INNER JOIN Modalidade As moda ON moda.idModalidade=atl.idModalidade
INNER JOIN Teste As t on t.idTeste = a_r.idTeste
INNER JOIN Medico As m on m.idMedico = a_r.idMedico
INNER JOIN CODIGO_POSTAL As cp_med ON cp_med.Codigo_Postal=m.Codigo_Postal
INNER JOIN TECNICO_SAUDE As ts on ts.idTecnico_Saude = a_r.idTecnico
INNER JOIN CODIGO_POSTAL As cp_tec ON cp_tec.Codigo_Postal=ts.Codigo_Postal
LIMIT 1;

select * from AGENDAMENTO_REALIZACAO;