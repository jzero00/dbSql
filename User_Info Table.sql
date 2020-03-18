CREATE TABLE USER_INFO
(userID VARCHAR(20) PRIMARY KEY,
userPassword  VARCHAR(20),
userName VARCHAR(20),
userGender  VARCHAR(20),
userEmail  VARCHAR(20));

SELECT userPassword
FROM user_info
WHERE userID = 'a001';
