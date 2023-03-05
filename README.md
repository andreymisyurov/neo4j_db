## Project: neo4j_db

## Graph database test task

#### Подготовливаем софт
- устанавливаем ipynb
- устанавливаем neo4j и GDS из репозитория https://github.com/neo4j согласно билдим иснструкциям
- библиотеки pandas, neo4j, networkx пакетным менеджером pip

#### Парсим данные из csv в neo4j
- должен быть запущен neo4j на 7687 порту
- имя файла `data_test.csv` должен лежать в одной дириктории со скриптом
- запускаем скрипт, переходим на localhost:7474, авторизуемся, проверяем

#### Запросы neo4j на языке Cypher

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

#### Rest-API
Для реализации этой части задания использовал фреймворк Flask.<br>
Чтобы запустить сервер необходимо выполнить в терминале `python3 flask-rest.py`<br>

Реализовано два способа отправки POST запроса.

- простой UI интерфейс с возможностью ввода данных в форму<br>
`http://127.0.0.1:5000/search`<br>

- или curl-запрос из терминала со строкой для поиска `curl -X POST -H "Content-Type: text/plain" -d "Галчевская Карина Владимировна" http://localhost:5000/search`<br>
