WITH CTE AS (
	SELECT * FROM bike_share_yr_0
	UNION
	SELECT * FROM bike_share_yr_1
)

SELECT 
	dteday,
	season,
	B.yr,
	weekday,
	hr,
	rider_type,
	riders,
	price,
	COGS,
	riders*price as revenue,
	riders*price - COGS as profit
FROM CTE AS B
LEFT JOIN cost_table AS C
ON B.yr = C.yr;