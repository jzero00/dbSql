INSERT INTO member VALUES
(SEQ_MEMBER.NEXTVAL,
		#mem_id#, #mem_pw#, #mem_nickname#, #mem_name#, #mem_age#,
		#mem_email#,
		#mem_tel#, #mem_addr#, #mem_profile_image#, SYSDATE,
		SYSDATE, 110, 401);
        
UPDATE member SET CODE_STATE = '404'
WHERE MEM_NO = '14';

--회원정보 수정
UPDATE member SET
mem_nickname = '',
mem_email = '',
mem_profile_image = '',
mem_pw = '',
mem_addr = '';

INSERT INTO ATTACHFILE VALUES
(SEQ_ATFILE.NEXTVAL, 

ATFILE_PATH
ATFILE_TMP_NAME
ATFILE_ORG_NAME
ATFILE_REGDATE
BOARD_NO;

SELECT SEQ_FREEBOARD
FROM dual;

ROLLBACK;