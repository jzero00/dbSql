--PRIMARY KEY 제약 : UNIQUE + NOT NULL

UNIQUE : 해당 컬럼에 동일한 값이 중복될 수 없다.
                (Ex : emp테이블의 empno (사번)
                        dept 테이블의 deptno (부서번호))
                해당 컬럼에 null값은 들어 갈 수 있다.
                
 NOT NULL : 데이터 입력시 해당 컬럼에 값이 반드시 들어와야 한다.
 --컬럼 레벨의 PRIMARY KEY 제약 생성
 --오라클의 제약 조건 이름을 임의로 생성 (SYS-C000701)
 CREATE TABLE dept_test(
        deptno NUMBER (2) PRIMARY KEY;
        
--오라클 제약 조건의 이름을 임의로 명명
--PRIMARY KEY : pk_테이블명
CREATE TABLE dept_test(
        deptno NUMBER(2) CONSTRAINT pk_dept_test PRIMARY KEY;
        
--PAIRWUSE : 쌍의 개념
--상단의 PRIMARY KEY 제약 조건의 경우 하나의 컬럼에 제약조건을 생성
--여러 컬럼을 복합으로 PRIMARY KEY 제약으로 생성할 수 있다.
--해당 방법은 위의 두가지 예시처럼 컬럼 레벨에서는 생성할 수 없다.
--→ TABLE LEVEL 제약조건 생성

--기존에 생성한 DEPT_TSET 테이블 삭제 (drop)
DROP TABLE dept_test;

--컬럼 레벨이 아닌, 테이블 레벨의 제약조건 생성
CREATE TABLE dept_test(
        deptno NUMBER(2),
        dname VARCHAR2 (14),
        loc VARCHAR2(13), --마지막컬럼 선언 후 컴마 빼먹지 않기

--deptno, dname 컬럼이 같을때 동일한 데이터로 인식
CONSTRAINT pk_dept_test PRIMARY KEY (deptno, dname)
        );

INSERT INTO dept_test VALUES(99, 'ddit', 'daejeon');
INSERT INTO dept_test VALUES(99, '대덕', '대전');

--두번째 INSERT 쿼리와 키값이 중복되므로 에러
INSERT INOT dept_test VALUES(99, '대덕', '청주');

--NOT NULL 제약 조건
--해당 컬럼에 NULL 값이 들어오는 것을 제한할 때 사용
--복합 컬럼과는 거리가 멀다

DROP TABLE dept_test;

--컬럼 레벨이 아닌, 테이블 레벨의 제약조건 생성
--dname 컬럼이 null값이 들어오지 못하도록 NOT NULL 제약 조건 생성
CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        dname VARCHAR2 (14) NOT NULL,
        loc VARCHAR2(13)
);

--deptno 컬럼이 primary key 제약에 걸리지 않고
--loc 컬럼은 nullable이기 때문에 null값이 입력될 수 있다.
INSERT INTO dept_test VALUES(99, 'ddit', NULL);

--deptno 컬럼이 primary key 제약에 걸리지 않고 중복된 값이 아니니까
--dname 컬럼의 NOT NULL 제약조건을 위배
INSERT INTO dept_test VALUES(98, NULL , '대전');

--
DROP TABLE dept_test;

CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        --deptno NUMBER(2) CONSTRAINT pk_dept_test PRIMARY KEY,
        --dname VARCHAR2 (14) NOT NULL
        dname VARCHAR2 (14) CONSTRAINT NN_dname NOT NULL,
        loc VARCHAR2(13)
);


DROP TABLE dept_test;

CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        dname VARCHAR2 (14) ,
        loc VARCHAR2(13)
        
        --CONSTRAINT pk_dept_test PRIMARY KEY (deptno, dname)
        --CONSTRAINT NN_dname NOT NULL (dname) :  허용되지 않는다.
);
        

--1. 컬럼 레벨 
--2. 컬럼레벨 제약조건 이름 붙이기
--3. 테이블 레벨
--[4. 테이블 수정시 제약조건 적용]

--UNIQUE 제약조건
--해당 컬럼에 값이 중복되는 것을 제한
--단 null 값은 허용
--GLOBAL solution 의 경우 국가간 법적 적용 사항이 다르기 때문에
--pk 제약보다는 UNIQUE 제약을 사용하는 편이며, 부족한 제약 조건은
--APPLICATION 레벨에서 체크하도록 설계하는 경향이 있다.

--기존 생성된 테이블 삭제(drop)
DROP TABLE dept_test;

--컬럼레벨 unique 제약
CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        dname VARCHAR2 (14) UNIQUE ,
        loc VARCHAR2(13)
        );
        
--두개의 INSERT 구문을 통해 dname이 같은 값을 입력하기 때문에
--dname 컬럼에 적용된 UNIQUE 제약에 의해 두번째 쿼리는 정상적으로 실행될 수 없다.
INSERT INTO dept_test VALUES (99, 'ddit' , 'daejeon');
INSERT INTO dept_test VALUES (98, 'ddit' , '대전');

--기존 생성된 테이블 삭제(drop)
DROP TABLE dept_test;

--컬럼레벨 unique 제약
CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        dname VARCHAR2 (14) CONSTRAINT IDX_U_dept_test_01 UNIQUE ,
        loc VARCHAR2(13)
        );
        
--두개의 INSERT 구문을 통해 dname이 같은 값을 입력하기 때문에
--dname 컬럼에 적용된 UNIQUE 제약에 의해 두번째 쿼리는 정상적으로 실행될 수 없다.
INSERT INTO dept_test VALUES (99, 'ddit' , 'daejeon');
INSERT INTO dept_test VALUES (98, 'ddit' , '대전');


--기존 생성된 테이블 삭제(drop)
DROP TABLE dept_test;

--테이블 레벨 unique 제약
CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        dname VARCHAR2 (14)  ,
        loc VARCHAR2(13),
        
        CONSTRAINT IDX_U_dept_test_01 UNIQUE (dname)
        );
        
--두개의 INSERT 구문을 통해 dname이 같은 값을 입력하기 때문에
--dname 컬럼에 적용된 UNIQUE 제약에 의해 두번째 쿼리는 정상적으로 실행될 수 없다.
INSERT INTO dept_test VALUES (99, 'ddit' , 'daejeon');
INSERT INTO dept_test VALUES (98, 'ddit' , '대전');


--FOREIGN KEY 제약조건
--다른 테이블에 존재하는 값만 입력될 수 있도록 제한

--emp_test.deptno → dept_test.deptno 컬럼을 참조하도록
--FOREIGN KEY 제약조건

--dept_teat 테이블 삭제 (drop)
DROP TABLE dept_test;

--dept_test 테이블 생성 (deptno컬럼 PRIMARY KEY 제약)
--DEPT 테이블과 컬럼이름, 타입 동일하게 생성

CREATE TABLE dept_test(
        deptno NUMBER(2) PRIMARY KEY,
        dname VARCHAR2(14),
        loc VARCHAR2(13)    );

INSERT INTO dept_test VALUES(99, 'DDIT', 'daejeon');
COMMIT;

DESC emp;
--empno, ename, deptno : emp_test
--rmpno PRIMARY KEY
--deptno dept_test.deptno FOREIGN KEY

--컬럼 레벨 FOREIGN KEY
CREATE TABLE emp_test   (
        empno NUMBER (4) PRIMARY KEY,
        ename VARCHAR (10),
        deptno NUMBER (2) REFERENCES dept_test (deptno) );
        
--dept_test 테이블에 존재하는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9999, 'brown' ,99);

--dept_test 테이블에 존재하지 않는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9998, 'sally' ,98);


--emp_test 삭제
DROP TABLE emp_test;

--컬럼 레벨 FOREIGN KEY (제약조건 명 추가)
CREATE TABLE emp_test   (
        empno NUMBER (4) PRIMARY KEY,
        --empno NUMBER (4) CONSTRAINT 제약조건이름 PRIMARY KEY,
        
        ename VARCHAR (10),
        
        deptno NUMBER (2),
        
        CONSTRAINT FK_dept_test FOREIGN KEY (deptno)
        REFERENCES dept_test (deptno) );
        --deptno NUMBER (2) REFERENCES dept_test (deptno) );
        
--dept_test 테이블에 존재하는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9999, 'brown' ,99);

--dept_test 테이블에 존재하지 않는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9998, 'sally' ,98);


--부서정보 지우려면 지루여고 하는 부서 번호를 참조하는 직원정보를 삭제 또는 deptno 컬럼을 NULL처리
--EMP → DEPT





--기존 테이블 삭제
DROP TABLE emp_test;

--FOREIGN KEY OPTION - SET DELETE CASCADE
CREATE TABLE emp_test   (
        empno NUMBER (4) PRIMARY KEY,
        ename VARCHAR (10),
        deptno NUMBER (2),
        
        CONSTRAINT FK_dept_test FOREIGN KEY (deptno)
        REFERENCES dept_test (deptno) ON DELETE CASCADE);

        
--dept_test 테이블에 존재하는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9999, 'brown' ,99);
COMMIT;

--데이터 입력 확인
SELECT *
FROM emp_test;


--ON DELETE CASCADE 옵션에 따라 DEPT 데이터를 삭제할 경우
--해당 데이터를 참조하고있는 EMP테이블의 사원 데이터도 삭제된다.
DELETE dept_test
WHERE deptno = 99;


--기존 테이블 삭제(DROP)
DROP TABLE emp_test;

--FOREIGN KEY OPTION - SET DELETE CASCADE
CREATE TABLE emp_test   (
        empno NUMBER (4) PRIMARY KEY,
        ename VARCHAR (10),
        deptno NUMBER (2),
        
        CONSTRAINT FK_dept_test FOREIGN KEY (deptno)
        REFERENCES dept_test (deptno) ON DELETE CASCADE);

        
--dept_test 테이블에 존재하는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9999, 'brown' ,99);
COMMIT;

--데이터 입력 확인
SELECT *
FROM emp_test;


--ON DELETE CASCADE 옵션에 따라 DEPT 데이터를 삭제할 경우
--해당 데이터를 참조하고있는 EMP테이블의 사원 데이터도 삭제된다.
DELETE dept_test
WHERE deptno = 99;
ROLLBACK;



--기존 테이블 삭제(DROP)
DROP TABLE emp_test;

--FOREIGN KEY OPTION - ON DELETE SET NULL
CREATE TABLE emp_test   (
        empno NUMBER (4) PRIMARY KEY,
        ename VARCHAR (10),
        deptno NUMBER (2),
        
        CONSTRAINT FK_dept_test FOREIGN KEY (deptno)
        REFERENCES dept_test (deptno) ON DELETE SET NULL);

        
--dept_test 테이블에 존재하는 deptno로 값을 입력
INSERT INTO emp_test VALUES (9999, 'brown' ,99);
COMMIT;

--데이터 입력 확인
SELECT *
FROM emp_test;


--ON DELETE SET NULL 옵션에 따라 DEPT 데이터를 삭제할 경우
--해당 데이터를 참조하고있는 EMP테이블의 DEPTNO 컬럼을 NULL로 변경한다.
DELETE dept_test
WHERE deptno = 99;
ROLLBACK;


--CHECK 제약조건
--컬럼에 들어가는 값을 검증할때
--Ex : 급여 컬럼에는 값이 0보다 큰값만 들어가도록 체크
--          성별 컬럼에는 남/녀 혹은 F/M 값만 들어가도록 제한

--emp_test 테이블 삭제(DROP)
DROP TABLE emp_test;

--emp_test 테이블 컬럼
--empno NUMBER(4)
--ename VARCHAR2 (10)
--sal NUMBER (7,2)              --0보다 큰 숫자만 입력되도록 제한
--EMP_gb VARCHAR2 (2)   -- 직원 구분 01- 정규직, 02 인턴
CREATE TABLE emp_test (
                empno NUMBER(4) PRIMARY KEY,
                ename VARCHAR2 (10),
                sal NUMBER (7,2) CHECK (sal > 0) ,
                emp_gb VARCHAR2 (2) CHECK (emp_gb IN ('01' , '02')  )   );    
DESC emp;

--emp_test 데이터 입력
--sal컬럼 check 제약조건 (sal > 0)에 의해서 음수 값은 입력될 수 없다.
INSERT INTO emp_test VALUES (9999, 'brown' , -1, '01');

--check 제약조건 위배하지 않으므로 정상 입력 (sal, emp_gb)
INSERT INTO emp_test VALUES (9999, 'brown' , 1000, '01');

--emp_gb check 제약 조건에 위배 (emp_gb IN ('01', '02')    )
INSERT INTO emp_test VALUES (9998, 'sally' , 1000, '03');

INSERT INTO emp_test VALUES (9998, 'sally' , 1000, '02');

--CHECK 제약조건 제약조건 이름 생성
CREATE TABLE emp_test (
                empno NUMBER(4) PRIMARY KEY,
                --empno NUMBER(4) CONSTRAINT 제약조건 명 PRIMARY KEY,
                
                ename VARCHAR2 (10),
                
                
                --sal NUMBER (7,2) CHECK (sal > 0) ,
                sal NUMBER (7,2) CONSTRAINT C_SAL CHECK (sal > 0),
                
                
               -- emp_gb VARCHAR2 (2) CHECK (emp_gb IN ('01' , '02')  )   );    
                emp_gb VARCHAR2 (2) CONSTRAINT C_EMP_GB CHECK (emp_gb IN ('01' , '02')  )   );    

--emp_test 테이블 삭제(DROP)
DROP TABLE emp_test;

--TABLE LEVEL CHECK 제약조건 제약조건 이름 생성
CREATE TABLE emp_test (
                empno NUMBER(4) PRIMARY KEY,              
                ename VARCHAR2 (10),
                sal NUMBER (7,2),
                emp_gb VARCHAR2 (2),
                
                CONSTRAINT nn_ename CHECK (ename IS NOT NULL),
                CONSTRAINT C_SAL CHECK (sal > 0),
                CONSTRAINT C_EMP_GB CHECK (emp_gb IN ('01' , '02')  )
);    


--테이블 생성 : CREATE TABEL 테이블명 (  
--                              컬럼 컬럼타입 ...);

--기존 테이블을 활용해서 테이블 생성하기
-- CREATE TABLE AS : CTAS (씨타스)
--CREATE TABLE 테이블명 (컬럼1, 컬럼2, 컬럼3 ...) AS
--          SELECT col1, col2...
--          FROM 다른 테이블 명
--          WHERE  조건

--emp_test 테이블 삭제 (drop)
DROP TABLE emp_test;

--emp 테이블의 데이터를 포함해서 emp_test 테이블을 생성

CREATE TABLE emp_test AS
        SELECT *
        FROM emp;

SELECT *
FROM emp_test
INTERSECT
SELECT*
FROM emp;

--emp_test 테이블 삭제 (drop)
DROP TABLE emp_test;

--emp 테이블의 데이터를 포함해서 emp_test 테이블을 생성
--컬럼명을 변경하여 생성
CREATE TABLE emp_test (c1, c2, c3, c4, c5, c6, c7,c8) AS
        SELECT *
        FROM emp;

SELECT *
FROM emp_test;

--emp_test 테이블 삭제
DROP TABLE emp_test;

--데이터는 제외하고 테이블의 형체 (컬럼 구성)만 복사하여 테이블 생성

CREATE TABLE emp_test  AS
        SELECT *
        FROM emp
        WHERE 1=2;
      

SELECT *
FROM emp_test;  
        
--emp_test 테이블 삭제
DROP TABLE emp_test;

--empno, ename, deptno 컬럼으로 emp_test 생성
CREATE TABLE emp_test AS
SELECT empno, ename, deptno
FROM emp
WHERE 1=3;

SELECT*
FROM emp_test;

--emp_test 테이블에 신규컬럼 추가
-- HP VARCHAR2(20) DEFAULT '010'
--ALTER TABLE 테이블명 ADD (컬럼명 컬럼타입 [default value]);
ALTER TABLE emp_test ADD (hp VARCHAR2 (20) DEFAULT '010');

--기존컬럼 수정
--ALTER TABLE 테이블명 MODIFY (컬럼 컬럼타입 [default valur]);
--hp 컬럼 타입을 VARCHAR2(20) → VARCHAR2(30)
ALTER TABLE emp_test MODIFY (hp VARCHAR2(30));

--현재 emp_test 테이블에 데이터가 없기 때문에 컬럼 타입을 변경하는 것이 가능하다
--hp 컬럼 타입을 VARCHAR2(20) → NUMBER
ALTER TABLE emp_test MODIFY (hp NUMBER);
DESC emp_test;

--컬럼명 변경
--해당 컬럼이 PK, UNIQUE, NOT NULL, CHECK 제약조건시 기술한 컬럼명에 대해서도
--자동적으로 변경된다.
--hp 컬럼 hp_n
--ALTER TABLE 테이블명 RENAME COLUMN 기존컬럼명 TO 변경컬럼명;
ALTER TABLE emp_test RENAME COLUMN hp TO hp_n;

--컬럼 삭제
--ALTER TABLE 테이블명 DROP (컬럼이름);
--ALTER TABLE 테이블명 DROP COLUMN 컬럼명
ALTER TABLE emp_test DROP (hp_n);
ALTER TABLE emp_test DROP COLUMN hp_n;

--제약조건 추가
--ALTER TABLE 테이블명 ADD          --테이블 레벨 제약조건 스크립트
--emp_test 테이블의 empno 컬럼을 PK 제약조건 추가
ALTER TABLE emp_test ADD CONSTRAINT pk_emp_test
                                                                                PRIMARY KEY (empno);

--제약조건 삭제
--ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건이름;
--emp_test 테이블의 PRIMARY KEY 제약조건 pk_emp_test 제약 삭제
ALTER TABLE emp_test DROP CONSTRAINT pk_emp_test;

--테이블 컬럼, 타입 변경은 제한적으로나마 가능
--테이블의 컬럼 순서를 변경하는 것은 불가능하다
--empno, ename, job →empno, job, ename




