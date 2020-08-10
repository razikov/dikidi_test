use dikidi;
SELECT t.name, count(m.id) as 'количество'
FROM `motorcycles` as m
LEFT JOIN `types` as t ON m.type_id = t.id 
WHERE m.in_production = 1
GROUP BY t.name
