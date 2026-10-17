SELECT 
	* 
FROM emails AS E
INNER JOIN texts AS T
ON E.email_id=T.email_id
WHERE T.action_date=DATEADD(DAY,1,E.signup_date) AND T.signup_action='Confirmed'