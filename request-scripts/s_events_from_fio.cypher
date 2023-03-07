// Выводит все встречи в которых принимала участие Ахромеева Алина Ивановна


MATCH (p:Participant)-[:PARTICIPATED_IN]->(e:Event)
WHERE p.fio = "Ахромеева Алина Ивановна"
RETURN e.id_sobytiya AS event_id
