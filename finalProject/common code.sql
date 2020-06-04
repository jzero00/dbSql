-- ROLE 테이블 데이터
INSERT INTO ROLE VALUES ('ROLE_USER', '일반사용자', SYSDATE);
INSERT INTO ROLE VALUES ('ROLE_ADMIN', '관리자', SYSDATE);
INSERT INTO ROLE VALUES ('ROLE_SLEEP', '휴면사용자', SYSDATE);
INSERT INTO ROLE VALUES ('ROLE_DISABLED', '탈퇴된사용자', SYSDATE);

-- 멤버 테이블 관리자 INSERT
INSERT INTO MEMBER (EMAIL, PASSWORD, PHONENUMBER, NAME, NICKNAME, POSTCODE, ADDRESS, DETAILADDRESS, ROLE, DELETEYN, REGDATE)
VALUES ('DolphinShark@naver.com', '1234', '01012345678', '상어가된돌고래', '돌고래상어', '548754', '내고향바다', '돌고래도좋고 상어도 좋아', 'ROLE_ADMIN', 'N', SYSDATE);

-- 공통 코드
INSERT INTO commoncode VALUES ('100', '팀원', 'DolphinShark@naver.com', SYSDATE);
INSERT INTO commoncode VALUES ('110', '팀장', 'DolphinShark@naver.com', SYSDATE);

INSERT INTO commoncode VALUES ('401', '권한없음에러', 'DolphinShark@naver.com', SYSDATE);
INSERT INTO commoncode VALUES ('500', '서버에러', 'DolphinShark@naver.com', SYSDATE);
COMMIT;