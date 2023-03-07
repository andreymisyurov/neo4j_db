// Выводит 10 участников, которые участвовали в максимальном количестве встреч


MATCH (p:Participant)-[r:PARTICIPATED_IN]->()
RETURN p.fio, COUNT(r) AS event_count
ORDER BY event_count DESC
LIMIT 10
