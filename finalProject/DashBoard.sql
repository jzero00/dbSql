-- ProjectID가 1인 프로젝트에 참여하는 참여자의 아이디와 팀장인지 팀원인지 정보 조회
SELECT p.*
FROM pro_team p
WHERE p.projectid = 1;

SELECT DISTINCT(o.title)
FROM pro_team p, off_schedule o
WHERE p.projectid = o.projectid
AND o.projectid = 1;

SELECT o.*
FROM pro_team p, off_schedule o
WHERE p.projectid = o.projectid
AND o.projectid = 1;

AND p.memberid = o.register;


SELECT * FROM  pro_team p;

-- 1번 프로젝트의 공식 일정을 조회하는 쿼리
SELECT s.* 
FROM pro_master p , off_schedule s
where p.projectid=s.projectid
AND p.projectid =1;

--1번 프로젝트에 최근 등록된 업무
SELECT *
FROM per_schedule
WHERE projectid=1
ORDER BY regdate DESC;

--1번 프로젝트의 1주일 남겨진 업무 조회
SELECT *
FROM per_schedule
WHERE projectid=1
AND enddate - SYSDATE < 7;

--1번 프로젝트의 전체 업무 개수
SELECT COUNT(*) cnt
FROM per_schedule;

--1번 프로젝트의 전체 업무 진행 상황
-- 전체 진행 퍼센트를 더해서 전체 업무 갯수로 나눔
SELECT AVG(PROCESSPERCENT) totalpercent
FROM per_schedule
WHERE projectid = 1;

--1번 프로젝트에 참여하는 멤버의 멤버별 평균 진행 상황(%)
SELECT memberid, AVG(processpercent) avg
FROM per_schedule
WHERE projectid = 1
GROUP BY memberid;

--업무 완료 대기중인 리스트
SELECT *
FROM PER_SCHEDULE
WHERE projectid=1
AND processpercent = 100
AND APPROVALYN = 'n';