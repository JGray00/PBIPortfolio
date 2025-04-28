SELECT
name
FROM Customer
WHERE 
1=1
and (referee_id != 2
or referee_id is null)
