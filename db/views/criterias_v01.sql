SELECT 
        1 as `id`,
        entity_name, 
        last_name, 
        first_name, 
        invest_date, 
        email, 
        broker, 
        rep,
        note_type, 
        dollar_invest,
        DATE_SUB(DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY) AS `NOTIFY_DATE`,
        DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY) AS `MATURITY_DATE`
FROM notes 
LEFT JOIN investors on `notes`.`investor_id` = `investors`.`id` 
where 
        date(now()) >= DATE_SUB(DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY), INTERVAL 30 DAY)
        and date(now()) <= DATE_ADD(date(invest_date), INTERVAL (note_type * 12)*30 DAY)
ORDER BY DATE_SUB(DATE_ADD(date(invest_date), INTERVAL (note_type * 12) * 30 DAY), INTERVAL 30 DAY) ASC;