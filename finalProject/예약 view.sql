CREATE VIEW RESERVATION_MYPAGE
AS SELECT r.no, r.amount, r.meetingno, r.startdate, r.enddate, r.refund, r.regdate, m.roomname, m.capacity, m.latitude, m.longitude, m.ADDRESS, m.DETAILADDRESS, m.JUSONO, m.PRICEPERDAY, a.filename, a.uploadpath
FROM reservation r, meetingroominfo m , meetingroomattachfile a
WHERE r.meetingno = m.no
AND m.no = a.roomno
AND refund = 'N'
AND SYSDATE < r.startdate;
