
SELECT		*
FROM		UserInfo
WHERE		UserName LIKE '%%'


SELECT 	COUNT(*) COUNT 
FROM 	UserInfo 
WHERE 	UserID = UserID
		AND UserName LIKE '%조%'          
		AND UserPhoneNum LIKE '%%'
		
		SELECT COUNT(*) COUNT 
		FROM UserInfo 
		WHERE UserID = CASE WHEN   = '' THEN UserID ELSE '1' END          
				AND UserName LIKE '%%'          
				AND UserPhoneNum LIKE '%%'
		