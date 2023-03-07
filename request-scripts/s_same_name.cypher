// Выводит двух участников, которые являются тёзками


MATCH (p_1:Participant)--(e:Event)--(p_2:Participant)
WITH SPLIT(p_1.fio, ' ') AS p1_name, SPLIT(p_2.fio, ' ') AS p2_name, e.id_sobytiya AS id_event
WHERE p1_name[1] = p2_name[1] AND p1_name > p2_name
RETURN id_event,
       TRIM(REDUCE(s = '', word IN p1_name | s + ' ' + word)) AS p1_name,
       TRIM(REDUCE(s = '', word IN p2_name | s + ' ' + word)) AS p2_name
