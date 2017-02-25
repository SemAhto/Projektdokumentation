
SELECT
	BusinessObject.id, BusinessObject.name
FROM
	BusinessObject
JOIN Tag AS tag1
	ON BusinessObject.id = tag1.business_object	
	AND tag1.content = 'stark'
JOIN Tag AS tag2
	ON BusinessObject.id = tag2.business_object	
	AND tag2.content = 'mutig'
JOIN Tag AS tag3
	ON BusinessObject.id = tag3.business_object	
	AND tag3.content = 'clever'
WHERE name LIKE '%Munkelt%';
