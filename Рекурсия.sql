-- Создание таблицы
CREATE TABLE tmp_table (
user_id INT NOT NULL,
post VARCHAR(100) NOT NULL,
manager_id INT NULL);

-- Добавление данных в таблицу
INSERT INTO tmp_table(user_id, post, manager_id)
 VALUES(1, 'Директор', NULL),
		(2, 'Главный бухгалтер', 1),
		(3, 'Бухгалтер', 2),
		(4, 'Начальник отдела продаж', 1),
		(5, 'Старший менеджер по продажам', 4),
		(6, 'Менеджер по продажам', 5),
		(7, 'Начальник отдела информационных технологий', 1),
		(8, 'Старший программист', 7),
		(9, 'Программист', 8),
		(10, 'Системный администратор', 7);
		
SELECT * FROM tmp_table;

WITH RECURSIVE TestCTE (user_id, post, manager_id,
level_user) AS
( -- Находим якорь рекурсии
	SELECT user_id, post, manager_id, 0 AS level_user
	FROM tmp_table
	WHERE manager_id IS NULL
	UNION ALL
	-- Делаем объединение с TestCTE (хотя мы его еще не	дописали)
	SELECT t1.user_id, t1.post, t1.manager_id, t2.level_user + 1
	FROM tmp_table t1
	JOIN TestCTE t2 ON t1.manager_id = t2.user_id
)
SELECT *
FROM TestCTE
ORDER BY level_user;