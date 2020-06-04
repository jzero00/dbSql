UPDATE member
SET nickname = 'modify',
postcode=002255,
address='테스트는 미국가나?',
detailaddress = '안가면 되',
phonenumber = '01098765432'
WHERE email='test';

ROLLBACK;

UPDATE member
SET role = '444'
WHERE email='test';