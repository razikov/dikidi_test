use dikidi;
SELECT t.name, count(m.id) as 'количество'
FROM `types` as t
LEFT JOIN `motorcycles` as m ON m.type_id = t.id and m.in_production = 1
GROUP BY t.name;
