SELECT *
FROM member;

--ȸ������
INSERT INTO member 
VALUES
(SEQ_MEMBER.NEXTVAL, 'drkim', 'drkim', '��������', '����', 50, 'drkim@doldam.com', '010-1234-5678', '������ ����', null, null, SYSDATE, SYSDATE, 110, 401);

COMMIT;


	SELECT mem_id
	FROM member
	WHERE mem_id = 'drkim';
    
    SELECT *
	FROM member
	WHERE mem_id = 'totoro'
	AND mem_pw = '123';
    
    
SELECT mem_nickname
FROM member
WHERE mem_id = 'drkim'
AND mem_pw = 'drkim';
    
SELECT TO_DATE(sysdate)
FROM dual;