use dikidi;
SELECT t.name, count(m.id) as 'количество'
FROM `motorcycles` as m
LEFT JOIN `types` as t ON m.type_id = t.id 
WHERE m.in_production = 0
GROUP BY m.type_id
