## project: neo4j_db

## graph database test task

#### подготовливаем софт
- устанавливаем ipynb
- устанавливаем neo4j и GDS из репозитория https://github.com/neo4j согласно билдим иснструкциям
- библиотеки pandas, neo4j, networkx пакетным менеджером pip

#### парсим данные из csv в neo4j
- должен быть запущен neo4j на 7687 порту
- имя файла `data_test.csv` должен лежать в одной дириктории со скриптом
- запускаем скрипт, переходим на localhost:7474, авторизуемся, проверяем

#### запросы neo4j на языке Cypher

Запускаем в терминале интерактивный режим Cypher Shell командой `cypher-shell`, авторизуемся
Попросит ввести `user` и `password`<br>
или<br>
`:connect bolt://localhost:7687 -u neo4j -p password`<br>

- Выводим 10 участников с максимальным количеством событий:
`MATCH (p:Participant)-[r:PARTICIPATED_IN]->()`<br>
`RETURN p.fio, COUNT(r) AS event_count`<br>
`ORDER BY event_count DESC`<br>
`LIMIT 10`<br>


- Вывести всех участников, которые участвовали в событии с заданным id:
`MATCH (p:Participant)-[:PARTICIPATED_IN {event_id: $event_id}]->(e:Event)`<br>
`RETURN p.fio`<br>


- Вывести все события в которых участвовал заданный участник:
`MATCH (p:Participant {fio: $participant_name})-[:PARTICIPATED_IN]->(e:Event)`<br>
`RETURN e.id_sobytiya`<br>