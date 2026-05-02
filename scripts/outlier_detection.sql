-- Statistical Outlier Detection using Z-Score logic
WITH Stats AS (
    SELECT AVG(Average_Order_Value) as mean_val, STDDEV(Average_Order_Value) as std_val
    FROM global_consumer_data
),
ZScores AS (
    SELECT Customer_ID, Average_Order_Value, (Average_Order_Value - mean_val) / std_val as z_score
    FROM global_consumer_data, Stats
)
SELECT * FROM ZScores WHERE ABS(z_score) > 3 ORDER BY z_score DESC;