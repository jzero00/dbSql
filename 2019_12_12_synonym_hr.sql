SELECT *
FROM PC05.users;

SELECT *
FROM jobs;

SELECT *
FROM USER_TABLES;

--78 �� 79
SELECT *
FROM ALL_TABLES
WHERE OWNER = 'PC05';

SELECT *
FROM PC05.fastfood;

CREATE SYNONYM  fastfood FOR PC05.fastfood;

SELECT * 

FROM fastfood;