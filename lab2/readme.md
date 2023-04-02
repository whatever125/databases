# Лабораторная работа №2

## Вариант 31311234
Отчет: [pdf](./report.pdf), [docx](./report.docx)

### Текст заданя

Составить запросы на языке SQL (пункты 1-7).

1. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
  - Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ.  
  - Вывести атрибуты: Н_ЛЮДИ.ОТЧЕСТВО, Н_ВЕДОМОСТИ.ДАТА.  
  - Фильтры (AND):  
    a) Н_ЛЮДИ.ОТЧЕСТВО < Сергеевич.  
    b) Н_ВЕДОМОСТИ.ИД = 1457443.  
    c) Н_ВЕДОМОСТИ.ИД < 1250972.  
  - Вид соединения: INNER JOIN.  

2. Сделать запрос для получения атрибутов из указанных таблиц, применив фильтры по указанным условиям:
  - Таблицы: Н_ЛЮДИ, Н_ВЕДОМОСТИ, Н_СЕССИЯ.  
  - Вывести атрибуты: Н_ЛЮДИ.ИМЯ, Н_ВЕДОМОСТИ.ИД, Н_СЕССИЯ.ИД.  
  - Фильтры (AND):  
    a) Н_ЛЮДИ.ИМЯ > Александр.  
    b) Н_ВЕДОМОСТИ.ИД = 1426978.  
  - Вид соединения: INNER JOIN.  

3. Вывести число студентов вечерней формы обучения, которые младше 20 лет.  
  Ответ должен содержать только одно число.

4. Найти группы, в которых в 2011 году было менее 10 обучающихся студентов на ФКТИУ.  
  Для реализации использовать подзапрос.

5. Выведите таблицу со средним возрастом студентов во всех группах (Группа, Средний возраст), где средний возраст равен минимальному возрасту в группе 3100.

6. Получить список студентов, отчисленных до первого сентября 2012 года с очной или заочной формы обучения (специальность: 230101). В результат включить:
  - номер группы;  
  - номер, фамилию, имя и отчество студента;  
  - номер пункта приказа;  
  Для реализации использовать подзапрос с EXISTS.

7. Вывести список студентов, имеющих одинаковые отчества, но не совпадающие даты рождения.