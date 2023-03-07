// Выводит всех участников, чьи имена "Александр"


MATCH (p:Participant)--(e:Event)
WHERE p.fio CONTAINS " Александр "
RETURN p.fio AS name
