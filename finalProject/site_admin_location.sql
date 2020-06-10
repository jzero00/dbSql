INSERT INTO JUSOMASTER VALUES(jusoMaster_seq.nextval, '서울', '강남권', '개포, 대치, 도곡, 논현');
INSERT INTO JUSOMASTER VALUES(jusoMaster_seq.nextval, '서울', '강북권', '성북, 도봉, 노원, 중계');

-- meetingRoomInfo 관련 데이터 
INSERT INTO meetingRoomInfo(no, latitude, longitude, postCode, zibunAddress, detailAddress, regdate, jusoNo, capacity, roomName, register, deleteyn)
					VALUES (meetingRoomInfo_seq.nextval, 100, 100, 12345, '대덕인재개발원', '205호', sysdate, 1, 4, '대덕인재개발원 205호','admin@admin.com' , 'n');
INSERT INTO meetingRoomInfo(no, latitude, longitude, postCode, zibunAddress, detailAddress, regdate, jusoNo, capacity, roomName, register, deleteyn)
					VALUES (meetingRoomInfo_seq.nextval, 100, 100, 12345, '대덕인재개발원', '203호', sysdate, 2, 8, '대덕인재개발원 203호','admin@admin.com' , 'n');
                    
                    COMMIT;
                    
    CREATE TABLE meetingroomattachfile(
		no NUMERIC  NOT NULL,
		roomno NUMERIC NOT NULL,
		filename VARCHAR(100) NOT NULL
);

-- 회의실 첨부파일
ALTER TABLE meetingroomattachfile
		ADD CONSTRAINT PK_meetingroomattachfile -- 회의실 첨부파일 기본키
		PRIMARY KEY(
			no -- 관리번호
		);

select m.no roomNo, latitude, longitude, address, regdate, jusoNo, capacity, roomName, register, deleteyn,
		j.no realJusoNo, city, area, detail
		from meetingRoomInfo m, jusoMaster j
		where m.jusono = j.no;
        
select meetingRoomInfo_seq
		from dual;
        
insert into 
		meetingRoomInfo(no, latitude, longitude, address, regdate,
		jusoNo, capacity, roomName, register, deleteyn)
		values(100, 101.222, 33.5455, 01234, sysdate,
			10, 3, '마포대교', 'admin@admin.com', 'n');
            
            COMMIT;