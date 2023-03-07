// Выводит id встреч, в которых участвовали 4 и более участника


MATCH (p:Participant)--(e:Event)
WITH e.id_sobytiya as event_id, COUNT(p) as count
WHERE count >= 4
RETURN event_id, count
ORDER BY count
