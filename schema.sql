/*BASIC QUESTIONS*/


-- 1. What is the total sales?

SELECT
	SUM("Sales") AS TOTAL_SALES
FROM
	SUPER_STORE;

	
-- 2. How many records do we have in this dataset?

SELECT
	COUNT(*) AS TOTAL_RECORDS
FROM
	SUPER_STORE;

-- Which region generates the highest sales?

SELECT
	"Region",
	SUM("Sales") AS TOTAL_SALES
FROM
	SUPER_STORE
GROUP BY
	"Region"
ORDER BY
	TOTAL_SALES DESC;


-- Which category generates the highest sales?

SELECT
	"Category",
	SUM("Sales") AS TOTAL_SALES
FROM
	SUPER_STORE
GROUP BY
	"Category"
ORDER BY
	TOTAL_SALES DESC;

-- Which segment contributes the most to sales?

SELECT
	"Segment",
	SUM("Sales") AS TOTAL_SALES
FROM
	SUPER_STORE
GROUP BY
	"Segment"
ORDER BY
	TOTAL_SALES DESC;


/* Intermediate level*/

-- What are the top 5 Sub-Categories by sales?

SELECT
	"Sub_Category",
	SUM("Sales") AS TOTAL_SALES
FROM
	SUPER_STORE
GROUP BY
	"Sub_Category"
ORDER BY
	TOTAL_SALES DESC
LIMIT
	5;

-- Window function

SELECT
	*
FROM
	(
		SELECT
			"Sub_Category",
			SUM("Sales") AS TOTAL_SALES,
			RANK() OVER (
				ORDER BY
					SUM("Sales") DESC
			) AS RNK
		FROM
			SUPER_STORE
		GROUP BY
			"Sub_Category"
	) T
WHERE
	RNK <= 5;


-- What is the profit for the highest Sub_Categories sales?

SELECT
	"Sub_Category",
	SUM("Sales") AS TOTAL_SALES,
	SUM("Profit") AS TOTAL_PROFIT
FROM
	SUPER_STORE
GROUP BY
	"Sub_Category"
ORDER BY
	TOTAL_SALES DESC;


