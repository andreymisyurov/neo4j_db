// Выводит всех участников, которые участвовали более чем в одной встрече


MATCH (p:Participant)--(e:Event)
WITH p.fio AS name, COUNT(e) AS events
WHERE events > 1
RETURN name, events
ORDER BY events
