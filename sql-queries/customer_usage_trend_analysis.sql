-- Customer Usage Trend Analysis
-- Analyze product usage over time to identify declining or growing accounts

SELECT 
    customer_id,
    customer_name,
    MONTH(usage_date) AS month,
    YEAR(usage_date) AS year,
    COUNT(DISTINCT session_id) AS total_sessions,
    SUM(feature_interactions) AS total_feature_clicks,
    AVG(session_duration_minutes) AS avg_session_duration
FROM 
    customer_usage_logs
WHERE 
    usage_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
GROUP BY 
    customer_id, customer_name, YEAR(usage_date), MONTH(usage_date)
ORDER BY 
    customer_id, year, month;
