# Лабораторная работа №2

## Вариант 3131234
Отчет: [pdf](./reports/report.pdf), [docx](./reports/report.docx)

### Текст заданя

Составить запросы на языке SQL (пункты 1-7).

1. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
  - Н_ТИПЫ_ВЕДОМОСТЕЙ, Н_ВЕДОМОСТИ.  
  - Вывести атрибуты: Н_ТИПЫ_ВЕДОМОСТЕЙ.НАИМЕНОВАНИЕ, Н_ВЕДОМОСТИ.ИД.  
  - Фильтры (AND):  
    a) Н_ТИПЫ_ВЕДОМОСТЕЙ.ИД > 3.  
    b) Н_ВЕДОМОСТИ.ДАТА = 2022-06-08.  
  - Вид соединения: INNER JOIN.

2. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
  - Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ, Н_СЕССИЯ.  
  - Вывести атрибуты: Н_ЛЮДИ.ИД, Н_ВЕДОМОСТИ.ДАТА, Н_СЕССИЯ.ДАТА.  
  - Фильтры (AND):  
    a) Н_ЛЮДИ.ОТЧЕСТВО = Сергеевич.  
    b) Н_ВЕДОМОСТИ.ИД = 1250972.  
    c) Н_СЕССИЯ.ДАТА = 2002-01-04.  
  - Вид соединения: LEFT JOIN.  

3. Вывести число студентов группы 3102, которые не имеет отчества.  
  Ответ должен содержать только одно число.

4. Найти группы, в которых в 2011 году было ровно 10 обучающихся студентов на кафедре вычислительной техники.  
  Для реализации использовать соединение таблиц.

5. Выведите таблицу со средними оценками студентов группы 4100 (Номер, ФИО, Ср_оценка), у которых средняя оценка не больше минимальной оценк(е|и) в группе 3100.

6. Получить список студентов, отчисленных после первого сентября 2012 года с заочной формы обучения (специальность: Программная инженерия). В результат включить:
  - номер группы;  
  - номер, фамилию, имя и отчество студента;  
  - номер пункта приказа;  
  Для реализации использовать подзапрос с IN.

7. Сформировать запрос для получения числа в СПбГУ ИТМО отличников.