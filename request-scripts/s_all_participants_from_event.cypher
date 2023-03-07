// Выводит всех участников встречи, id которой равен 850472


MATCH (p:Participant)-[r:PARTICIPATED_IN]-(e:Event)
WHERE r.event_id = 850472
RETURN p.fio
