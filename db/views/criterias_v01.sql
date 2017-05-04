SELECT 
	entity_name, 
	last_name, 
	first_name, 
	invest_date, 
	email, 
	note_type, 
	dollar_invest, 
	DATE_SUB(DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY) AS `NOTIFY_DATE`
FROM notes 
LEFT JOIN investors on `notes`.`investor_id` = `investors`.`id` 
where DATE_SUB(DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY) > DATE_SUB(DATE_SUB(DATE_ADD(date(now()), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY), INTERVAL 30 DAY) and DATE_SUB(DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY) < DATE_ADD(DATE_SUB(DATE_ADD(date(now()), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY), INTERVAL 30 DAY)
ORDER BY DATE_SUB(DATE_ADD(date(now()), INTERVAL (note_type * 12) * 30 DAY), INTERVAL 30 DAY) ASC;