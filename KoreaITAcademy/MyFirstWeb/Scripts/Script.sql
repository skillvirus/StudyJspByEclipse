
SELECT		ROW_NUMBER() OVER () AS [UserRowNum],
			*
FROM		UserInfo
WHERE		UserName LIKE '%사용자%'
ORDER BY	ROW_NUMBER() OVER () DESC

SELECT 	ROW_NUMBER() OVER () AS [UserRowNum],
		UserID,
		UserName,
		UserPhoneNum
FROM 	UserInfo
ORDER BY	ROW_NUMBER() OVER () DESC
LIMIT 	10 OFFSET 




SELECT 	COUNT(*) COUNT 
FROM 	UserInfo 
WHERE 	UserID = UserID
		AND UserName LIKE '%조%'          
		AND UserPhoneNum LIKE '%%'
				
		
DELETE
FROM	UserInfo
WHERE	UserID >= 12





INSERT INTO UserInfo (UserID, UserName, UserPhoneNum) VALUES
(12,'사용자12','010-0000-0000'),
(13,'사용자13','010-0000-0000'),
(14,'사용자14','010-0000-0000'),
(15,'사용자15','010-0000-0000'),
(16,'사용자16','010-0000-0000'),
(17,'사용자17','010-0000-0000'),
(18,'사용자18','010-0000-0000'),
(19,'사용자19','010-0000-0000'),
(20,'사용자20','010-0000-0000'),
(21,'사용자21','010-0000-0000'),
(22,'사용자22','010-0000-0000'),
(23,'사용자23','010-0000-0000'),
(24,'사용자24','010-0000-0000'),
(25,'사용자25','010-0000-0000'),
(26,'사용자26','010-0000-0000'),
(27,'사용자27','010-0000-0000'),
(28,'사용자28','010-0000-0000'),
(29,'사용자29','010-0000-0000'),
(30,'사용자30','010-0000-0000'),
(31,'사용자31','010-0000-0000'),
(32,'사용자32','010-0000-0000'),
(33,'사용자33','010-0000-0000'),
(34,'사용자34','010-0000-0000'),
(35,'사용자35','010-0000-0000'),
(36,'사용자36','010-0000-0000'),
(37,'사용자37','010-0000-0000'),
(38,'사용자38','010-0000-0000'),
(39,'사용자39','010-0000-0000'),
(40,'사용자40','010-0000-0000'),
(41,'사용자41','010-0000-0000'),
(42,'사용자01','010-0000-0012'),
(43,'사용자33','010-0000-0033'),
(44,'사용자35','010-0000-0035'),
(45,'사용자36','010-0000-0036'),
(46,'사용자37','010-0000-0037'),
(47,'사용자38','010-0000-0038'),
(48,'사용자39','010-0000-0039'),
(49,'사용자40','010-0000-0049'),
(50,'사용자41','010-0000-0041'),
(51,'사용자41','010-0000-0042'),
(52,'사용자41','010-0000-0052'),
(53,'사용자41','010-0000-0042'),
(54,'사용자87','010-0000-0042'),
(55,'사용자02','010-0000-0042'),
(56,'사용자41','010-0000-0042'),
(57,'사용자31','010-0000-0042'),
(58,'사용자51','010-0000-0042'),
(59,'사용자11','010-0000-0042'),
(60,'사용자12','010-0000-0042'),
(61,'사용자15','010-0000-0042'),
(62,'사용자10','010-0000-0042'),
(63,'사용자11','010-0000-0042'),
(64,'사용자21','010-0000-0042'),
(65,'사용자31','010-0000-0042'),
(66,'사용자41','010-0000-0043');

