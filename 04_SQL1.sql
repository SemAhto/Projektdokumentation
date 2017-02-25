
SELECT
	BusinessObject.id, BusinessObject.name
FROM
	BusinessObject
JOIN Tag AS tag1
	ON BusinessObject.id = tag1.business_object	
	AND tag1.content = 'stark';
