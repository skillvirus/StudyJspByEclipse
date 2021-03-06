
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


INSERT INTO UserInfo (UserID, UserName, UserPhoneNum) VALUES
(1, '사용자1','010-0000-0001'),
(2, '사용자2','010-0000-0002'),
(3, '사용자3','010-0000-0003'),
(4, '사용자4','010-0000-0004'),
(5, '사용자5','010-0000-0005'),
(6, '사용자6','010-0000-0006'),
(7, '사용자7','010-0000-0007'),
(8, '사용자8','010-0000-0008'),
(9, '사용자9','010-0000-0009'),
(10, '사용자10','010-0000-0010'),
(11, '사용자11','010-0000-0011'),
(12, '사용자12','010-0000-0012'),
(13, '사용자13','010-0000-0013'),
(14, '사용자14','010-0000-0014'),
(15, '사용자15','010-0000-0015'),
(16, '사용자16','010-0000-0016'),
(17, '사용자17','010-0000-0017'),
(18, '사용자18','010-0000-0018'),
(19, '사용자19','010-0000-0019'),
(20, '사용자20','010-0000-0020'),
(21, '사용자21','010-0000-0021'),
(22, '사용자22','010-0000-0022'),
(23, '사용자23','010-0000-0023'),
(24, '사용자24','010-0000-0024'),
(25, '사용자25','010-0000-0025'),
(26, '사용자26','010-0000-0026'),
(27, '사용자27','010-0000-0027'),
(28, '사용자28','010-0000-0028'),
(29, '사용자29','010-0000-0029'),
(30, '사용자30','010-0000-0030'),
(31, '사용자31','010-0000-0031'),
(32, '사용자32','010-0000-0032'),
(33, '사용자33','010-0000-0033'),
(34, '사용자34','010-0000-0034'),
(35, '사용자35','010-0000-0035'),
(36, '사용자36','010-0000-0036'),
(37, '사용자37','010-0000-0037'),
(38, '사용자38','010-0000-0038'),
(39, '사용자39','010-0000-0039'),
(40, '사용자40','010-0000-0040'),
(41, '사용자41','010-0000-0041'),
(42, '사용자42','010-0000-0042'),
(43, '사용자43','010-0000-0043'),
(44, '사용자44','010-0000-0044'),
(45, '사용자45','010-0000-0045'),
(46, '사용자46','010-0000-0046'),
(47, '사용자47','010-0000-0047'),
(48, '사용자48','010-0000-0048'),
(49, '사용자49','010-0000-0049'),
(50, '사용자50','010-0000-0050'),
(51, '사용자51','010-0000-0051'),
(52, '사용자52','010-0000-0052'),
(53, '사용자53','010-0000-0053'),
(54, '사용자54','010-0000-0054'),
(55, '사용자55','010-0000-0055'),
(56, '사용자56','010-0000-0056'),
(57, '사용자57','010-0000-0057'),
(58, '사용자58','010-0000-0058'),
(59, '사용자59','010-0000-0059'),
(60, '사용자60','010-0000-0060'),
(61, '사용자61','010-0000-0061'),
(62, '사용자62','010-0000-0062'),
(63, '사용자63','010-0000-0063'),
(64, '사용자64','010-0000-0064'),
(65, '사용자65','010-0000-0065'),
(66, '사용자66','010-0000-0066'),
(67, '사용자67','010-0000-0067'),
(68, '사용자68','010-0000-0068'),
(69, '사용자69','010-0000-0069'),
(70, '사용자70','010-0000-0070'),
(71, '사용자71','010-0000-0071'),
(72, '사용자72','010-0000-0072'),
(73, '사용자73','010-0000-0073'),
(74, '사용자74','010-0000-0074'),
(75, '사용자75','010-0000-0075'),
(76, '사용자76','010-0000-0076'),
(77, '사용자77','010-0000-0077'),
(78, '사용자78','010-0000-0078'),
(79, '사용자79','010-0000-0079'),
(80, '사용자80','010-0000-0080'),
(81, '사용자81','010-0000-0081'),
(82, '사용자82','010-0000-0082'),
(83, '사용자83','010-0000-0083'),
(84, '사용자84','010-0000-0084'),
(85, '사용자85','010-0000-0085'),
(86, '사용자86','010-0000-0086'),
(87, '사용자87','010-0000-0087'),
(88, '사용자88','010-0000-0088'),
(89, '사용자89','010-0000-0089'),
(90, '사용자90','010-0000-0090'),
(91, '사용자91','010-0000-0091'),
(92, '사용자92','010-0000-0092'),
(93, '사용자93','010-0000-0093'),
(94, '사용자94','010-0000-0094'),
(95, '사용자95','010-0000-0095'),
(96, '사용자96','010-0000-0096'),
(97, '사용자97','010-0000-0097'),
(98, '사용자98','010-0000-0098'),
(99, '사용자99','010-0000-0099'),
(100, '사용자100','010-0000-0100'),
(101, '사용자101','010-0000-0101'),
(102, '사용자102','010-0000-0102');


DELETE
FROM	BookInfo

INSERT INTO BookInfo (BookID, BookTitle, BookISBN) VALUES
(1, '도서1','979-11-372-4801-3'),
(2, '도서2','979-11-372-4802-3'),
(3, '도서3','979-11-372-4803-3'),
(4, '도서4','979-11-372-4804-3'),
(5, '도서5','979-11-372-4805-3'),
(6, '도서6','979-11-372-4806-3'),
(7, '도서7','979-11-372-4807-3'),
(8, '도서8','979-11-372-4808-3'),
(9, '도서9','979-11-372-4809-3'),
(10, '도서10','979-11-372-4810-3'),
(11, '도서11','979-11-372-4811-3'),
(12, '도서12','979-11-372-4812-3'),
(13, '도서13','979-11-372-4813-3'),
(14, '도서14','979-11-372-4814-3'),
(15, '도서15','979-11-372-4815-3'),
(16, '도서16','979-11-372-4816-3'),
(17, '도서17','979-11-372-4817-3'),
(18, '도서18','979-11-372-4818-3'),
(19, '도서19','979-11-372-4819-3'),
(20, '도서20','979-11-372-4820-3'),
(21, '도서21','979-11-372-4821-3'),
(22, '도서22','979-11-372-4822-3'),
(23, '도서23','979-11-372-4823-3'),
(24, '도서24','979-11-372-4824-3'),
(25, '도서25','979-11-372-4825-3'),
(26, '도서26','979-11-372-4826-3'),
(27, '도서27','979-11-372-4827-3'),
(28, '도서28','979-11-372-4828-3'),
(29, '도서29','979-11-372-4829-3'),
(30, '도서30','979-11-372-4830-3'),
(31, '도서31','979-11-372-4831-3'),
(32, '도서32','979-11-372-4832-3'),
(33, '도서33','979-11-372-4833-3'),
(34, '도서34','979-11-372-4834-3'),
(35, '도서35','979-11-372-4835-3'),
(36, '도서36','979-11-372-4836-3'),
(37, '도서37','979-11-372-4837-3'),
(38, '도서38','979-11-372-4838-3'),
(39, '도서39','979-11-372-4839-3'),
(40, '도서40','979-11-372-4840-3'),
(41, '도서41','979-11-372-4841-3'),
(42, '도서42','979-11-372-4842-3'),
(43, '도서43','979-11-372-4843-3'),
(44, '도서44','979-11-372-4844-3'),
(45, '도서45','979-11-372-4845-3'),
(46, '도서46','979-11-372-4846-3'),
(47, '도서47','979-11-372-4847-3'),
(48, '도서48','979-11-372-4848-3'),
(49, '도서49','979-11-372-4849-3'),
(50, '도서50','979-11-372-4850-3'),
(51, '도서51','979-11-372-4851-3'),
(52, '도서52','979-11-372-4852-3'),
(53, '도서53','979-11-372-4853-3'),
(54, '도서54','979-11-372-4854-3'),
(55, '도서55','979-11-372-4855-3'),
(56, '도서56','979-11-372-4856-3'),
(57, '도서57','979-11-372-4857-3'),
(58, '도서58','979-11-372-4858-3'),
(59, '도서59','979-11-372-4859-3'),
(60, '도서60','979-11-372-4860-3'),
(61, '도서61','979-11-372-4861-3'),
(62, '도서62','979-11-372-4862-3'),
(63, '도서63','979-11-372-4863-3'),
(64, '도서64','979-11-372-4864-3'),
(65, '도서65','979-11-372-4865-3'),
(66, '도서66','979-11-372-4866-3'),
(67, '도서67','979-11-372-4867-3'),
(68, '도서68','979-11-372-4868-3'),
(69, '도서69','979-11-372-4869-3'),
(70, '도서70','979-11-372-4870-3'),
(71, '도서71','979-11-372-4871-3'),
(72, '도서72','979-11-372-4872-3'),
(73, '도서73','979-11-372-4873-3'),
(74, '도서74','979-11-372-4874-3'),
(75, '도서75','979-11-372-4875-3'),
(76, '도서76','979-11-372-4876-3'),
(77, '도서77','979-11-372-4877-3'),
(78, '도서78','979-11-372-4878-3'),
(79, '도서79','979-11-372-4879-3'),
(80, '도서80','979-11-372-4880-3'),
(81, '도서81','979-11-372-4881-3'),
(82, '도서82','979-11-372-4882-3'),
(83, '도서83','979-11-372-4883-3'),
(84, '도서84','979-11-372-4884-3'),
(85, '도서85','979-11-372-4885-3'),
(86, '도서86','979-11-372-4886-3'),
(87, '도서87','979-11-372-4887-3'),
(88, '도서88','979-11-372-4888-3'),
(89, '도서89','979-11-372-4889-3'),
(90, '도서90','979-11-372-4890-3'),
(91, '도서91','979-11-372-4891-3'),
(92, '도서92','979-11-372-4892-3'),
(93, '도서93','979-11-372-4893-3'),
(94, '도서94','979-11-372-4894-3'),
(95, '도서95','979-11-372-4895-3'),
(96, '도서96','979-11-372-4896-3'),
(97, '도서97','979-11-372-4897-3'),
(98, '도서98','979-11-372-4898-3'),
(99, '도서99','979-11-372-4899-3'),
(100, '도서100','979-11-372-48100-3'),
(101, '도서101','979-11-372-48101-3'),
(102, '도서102','979-11-372-48102-3');


SELECT		*
FROM		BookInfo





