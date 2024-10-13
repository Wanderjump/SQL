# SQL
## 1. Общий вид паттерна SQL конструкции, последовательность выполнения шагов запроса.

### Общий вид SQL-запроса можно представить в следующей последовательности:

1. **SELECT** - Определяет, какие столбцы данных нужно выбрать.
2. **FROM** - Указывает таблицы, из которых будут извлекаться данные.
3. **JOIN** - Объединяет таблицы, если это необходимо (INNER JOIN, LEFT JOIN и т.д.).
4. **WHERE** - Определяет условия фильтрации данных.
5. **GROUP BY** - Группирует результаты по указанным столбцам.
6. **HAVING** - Фильтрует группы по определённым условиям.
7. **ORDER BY** - Указывает порядок сортировки результатов.
8. **LIMIT** - Ограничивает количество возвращаемых строк.

### Пример SQL-запроса:
```sql
SELECT column1, column2
FROM table1
JOIN table2 ON table1.id = table2.foreign_id
WHERE condition
GROUP BY column1
HAVING aggregate_condition
ORDER BY column1 ASC
LIMIT 10;
```
Эта последовательность шагов помогает организовать выполнение запроса и оптимизировать его.

## 2. Операции DML, DDL, DCL и TCL
В SQL существует несколько категорий операций, каждая из которых выполняет свои задачи. Вот основные категории:

### 1. DML (Data Manipulation Language) — Язык манипуляции данными
Операции, которые используются для работы с данными в таблицах:
- **SELECT** — выборка данных.
- **INSERT** — добавление новых записей.
- **UPDATE** — обновление существующих записей.
- **DELETE** — удаление записей.

### 2. DDL (Data Definition Language) — Язык определения данных
Операции, которые используются для определения структуры базы данных:
- **CREATE** — создание новых объектов (таблиц, индексов и т.д.).
- **ALTER** — изменение структуры существующих объектов.
- **DROP** — удаление объектов из базы данных.
- **TRUNCATE** — удаление всех записей из таблицы, но не самой таблицы.

### 3. DCL (Data Control Language) — Язык управления данными
Операции, которые управляют доступом к данным:
- **GRANT** — предоставление прав доступа пользователям.
- **REVOKE** — отзыв прав доступа у пользователей.

### 4. TCL (Transaction Control Language) — Язык управления транзакциями
Операции, которые управляют транзакциями в базе данных:
- **COMMIT** — подтверждение изменений, сделанных в транзакции.
- **ROLLBACK** — отмена изменений, сделанных в транзакции.
- **SAVEPOINT** — установка точки сохранения для возможности отката.

Эти операции помогают управлять данными и структурой баз данных, обеспечивая целостность и безопасность информации.

## 3.  Работа со множествами (UNION, EXCEPT, INTERSECT, IN, NOT IN)

Работа со множествами в SQL позволяет объединять, исключать и пересекать результаты различных запросов. Вот основные операции:

### 1. **UNION**
Объединяет результаты двух или более запросов, удаляя дубликаты. Все запросы должны иметь одинаковое количество столбцов и совместимые типы данных.

```sql
SELECT column1 FROM table1
UNION
SELECT column1 FROM table2;
```

### 2. **UNION ALL**
Похож на `UNION`, но не удаляет дубликаты.

```sql
SELECT column1 FROM table1
UNION ALL
SELECT column1 FROM table2;
```

### 3. **EXCEPT**
Возвращает строки из первого запроса, которые не присутствуют во втором. Доступно не во всех СУБД.

СУБД, поддерживающие EXCEPT:
- **PostgreSQL** - Поддерживает EXCEPT.
- **Microsoft SQL Server** - Поддерживает EXCEPT.
- **SQLite** - Поддерживает EXCEPT.
- **Oracle** - Не поддерживает EXCEPT, но можно использовать MINUS, который выполняет аналогичную функцию.

СУБД, не поддерживающие EXCEPT:
- **MySQL** - Не поддерживает EXCEPT. Для достижения аналогичного результата можно использовать LEFT JOIN с условием NULL или NOT EXISTS.
- **MariaDB** - Не поддерживает EXCEPT. Аналогично MySQL, можно использовать другие методы для достижения того же результата.

```sql
SELECT column1 FROM table1
EXCEPT
SELECT column1 FROM table2;
```

### 4. **INTERSECT**
Возвращает строки, которые присутствуют в обоих запросах.

СУБД, поддерживающие INTERSECT:
- **PostgreSQL** - Поддерживает INTERSECT.
- **Microsoft SQL Server** - Поддерживает INTERSECT.
- **Oracle** - Поддерживает INTERSECT.
- **SQLite** - Поддерживает INTERSECT.

СУБД, не поддерживающие INTERSECT:
- **MySQL** - Не поддерживает INTERSECT. Для достижения аналогичного результата можно использовать INNER JOIN или WHERE EXISTS.
- **MariaDB** - Не поддерживает INTERSECT. Аналогично MySQL, можно использовать другие методы для получения пересечений.
```sql
SELECT column1 FROM table1
INTERSECT
SELECT column1 FROM table2;
```

### 5. **IN**
Используется для проверки, содержится ли значение в наборе значений.

```sql
SELECT column1 FROM table1
WHERE column1 IN (value1, value2, value3);
```

### 6. **NOT IN**
Проверяет, не содержится ли значение в наборе значений.

```sql
SELECT column1 FROM table1
WHERE column1 NOT IN (value1, value2, value3);
```

Эти операции позволяют эффективно работать с множествами данных и выполнять сложные запросы в SQL.


## 4. Операторы объединения (JOIN, LEFT/RIGHT, INNER/OUTER JOIN)

Операторы объединения (JOIN) в SQL позволяют комбинировать строки из двух или более таблиц на основе связанных между ними столбцов. Вот основные типы объединений:

### 1. **INNER JOIN**
Возвращает строки, которые имеют совпадающие значения в обеих таблицах.

```sql
SELECT *
FROM table1
INNER JOIN table2 ON table1.common_column = table2.common_column;
```

### 2. **LEFT JOIN (или LEFT OUTER JOIN)**
Возвращает все строки из левой таблицы и совпадающие строки из правой таблицы. Если совпадений нет, возвращаются NULL для столбцов правой таблицы.

```sql
SELECT *
FROM table1
LEFT JOIN table2 ON table1.common_column = table2.common_column;
```

### 3. **RIGHT JOIN (или RIGHT OUTER JOIN)**
Возвращает все строки из правой таблицы и совпадающие строки из левой таблицы. Если совпадений нет, возвращаются NULL для столбцов левой таблицы.

```sql
SELECT *
FROM table1
RIGHT JOIN table2 ON table1.common_column = table2.common_column;
```

### 4. **FULL JOIN (или FULL OUTER JOIN)**
Возвращает строки, когда есть совпадения в одной из таблиц. Если совпадений нет, возвращаются NULL для столбцов из отсутствующей таблицы.

```sql
SELECT *
FROM table1
FULL JOIN table2 ON table1.common_column = table2.common_column;
```

### 5. **CROSS JOIN**
Возвращает декартово произведение двух таблиц, то есть все возможные комбинации строк.

```sql
SELECT *
FROM table1
CROSS JOIN table2;
```

### Примеры использования:
Предположим, у нас есть две таблицы: `employees` и `departments`.

- **INNER JOIN**: Получить сотрудников и их департаменты.
  
```sql
SELECT employees.name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;
```

- **LEFT JOIN**: Получить всех сотрудников и их департаменты, включая тех, кто не принадлежит ни к одному департаменту.

```sql
SELECT employees.name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.id;
```

- **RIGHT JOIN**: Получить все департаменты и сотрудников, включая департаменты без сотрудников.

```sql
SELECT employees.name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.id;
```

- **FULL JOIN**: Получить всех сотрудников и все департаменты, включая тех, у кого нет соответствий.

```sql
SELECT employees.name, departments.department_name
FROM employees
FULL JOIN departments ON employees.department_id = departments.id;
```

Эти операторы объединения позволяют гибко работать с данными из нескольких таблиц в SQL.