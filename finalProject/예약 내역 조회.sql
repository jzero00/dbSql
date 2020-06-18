SELECT *
FROM reservation
WHERE register = 'test'
AND refund = 'N'
AND SYSDATE < startdate;

SELECT *
FROM meetingroominfo
WHERE no = (SELECT meetingno
                        FROM reservation
                        WHERE register = 'test');
                        
r.no, r.amount, r.meetingno, r.startdate, r.enddate, r.refund, r.regdate, m.roomname, m.capacity, m.latitude, m.longitude, m.ADDRESS, m.DETAILADDRESS, m.JUSONO, m.PRICEPERDAY
SELECT r.no, r.amount, r.meetingno, r.startdate, r.enddate, r.refund, r.regdate, m.roomname, m.capacity, m.latitude, m.longitude, m.ADDRESS, m.DETAILADDRESS, m.JUSONO, m.PRICEPERDAY
FROM reservation r, meetingroominfo m
WHERE r.meetingno = m.no
AND r.register = 'test'
AND refund = 'N'
AND SYSDATE < startdate;


SELECT a.filename, a.uploadpath
FROM reservation r, meetingroominfo m , meetingroomattachfile a
WHERE r.meetingno = m.no
AND m.no = a.roomno   
AND r.register = 'test'     --입력받는 값
AND refund = 'N'
AND a.profileyn = 'y'
AND SYSDATE < startdate;


SELECT r.no, r.amount, r.meetingno, r.startdate, r.enddate, r.refund, r.regdate, m.roomname, m.capacity, m.latitude, m.longitude, m.ADDRESS, m.DETAILADDRESS, m.JUSONO, m.PRICEPERDAY, a.filename, a.uploadpath
FROM reservation r, meetingroominfo m , meetingroomattachfile a
WHERE r.meetingno = m.no
AND m.no = a.roomno
AND refund = 'N'
AND SYSDATE < r.startdate;


r.register = 'test'
AND refund = 'N'
AND SYSDATE < startdate;


CREATE VIEW RESERVATION_MYPAGE
AS SELECT r.register, r.no, r.amount, r.meetingno, r.startdate, r.enddate, r.refund, r.regdate, m.roomname, m.capacity, m.latitude, m.longitude, m.ADDRESS, m.DETAILADDRESS, m.JUSONO, m.PRICEPERDAY, a.filename, a.uploadpath
FROM reservation r, meetingroominfo m , meetingroomattachfile a
WHERE r.meetingno = m.no
AND m.no = a.roomno;
AND refund = 'N'
AND SYSDATE < r.startdate;

DROP view RESERVATION_MYPAGE;

SELECT *
FROM RESERVATION_MYPAGE
WHERE refund = 'N'
AND SYSDATE < startdate
AND register = 'test';

create view project as
select a.PROJECTID, a.MEMBERID, a.JOB, b.PROJECTNAME,b.PROJECTEXPLAIN,b.STARTDATE,b.ENDDATE,b.REGISTER,b.REGDATE from PRO_TEAM a ,PRO_MASTER b
where b.PROJECTID=a.PROJECTID;
