// выводит id всех событий, фамилии участников которых начинаются с одинаковой буквы


MATCH (p_1:Participant)-[r_1:PARTICIPATED_IN]->(e:Event)<-[r_2:PARTICIPATED_IN]-(p_2:Participant)
WHERE LEFT(p_1.fio, 1) = LEFT(p_2.fio, 1) AND p_1.fio > p_2.fio
RETURN e.id_sobytiya AS event_id, p_1.fio, p_2.fio
