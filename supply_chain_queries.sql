-- =========================================================================
-- E-Commerce Supply Chain SQL Analytics Scripts
-- Database dialect: PostgreSQL / MySQL
-- =========================================================================

-- 1. OVERALL ON-TIME DELIVERY (OTD) RATE
SELECT 
    COUNT(CASE WHEN delivery_status = 'On-Time' THEN 1 END) * 100.0 / COUNT(*) AS on_time_delivery_rate
FROM cleaned_supply_chain_data
WHERE delivery_status != 'Lost';

-- 2. CARRIER PERFORMANCE REPORT
-- Identifies which carriers are causing the most delays and their average costs
SELECT 
    carrier,
    COUNT(order_id) AS total_shipments,
    ROUND(AVG(shipping_cost), 2) AS avg_cost,
    ROUND(AVG(actual_transit_time_days), 2) AS avg_transit_days,
    SUM(CASE WHEN delivery_status = 'Late' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS late_percentage,
    SUM(CASE WHEN delivery_status = 'Lost' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS lost_percentage
FROM cleaned_supply_chain_data
GROUP BY carrier
ORDER BY late_percentage DESC;

-- 3. WAREHOUSE BOTTLENECK ANALYSIS
-- Evaluates internal operational efficiency before handing off to carriers
SELECT 
    warehouse_id,
    COUNT(order_id) as total_processed,
    ROUND(AVG(processing_time_days), 2) AS avg_processing_days,
    MAX(processing_time_days) AS max_processing_days,
    SUM(CASE WHEN processing_time_days > 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) as slow_processing_rate
FROM cleaned_supply_chain_data
GROUP BY warehouse_id
ORDER BY slow_processing_rate DESC;

-- 4. REGIONAL COST vs. PERFORMANCE MATRIX
-- Assesses shipping profitability and performance by destination region
SELECT 
    destination_region,
    ROUND(SUM(shipping_cost), 2) AS total_freight_spend,
    ROUND(AVG(shipping_cost), 2) AS cost_per_shipment,
    ROUND(AVG(actual_transit_time_days), 2) AS avg_transit_days,
    COUNT(CASE WHEN delivery_status = 'Late' THEN 1 END) * 100.0 / COUNT(*) AS late_rate
FROM cleaned_supply_chain_data
GROUP BY destination_region
ORDER BY total_freight_spend DESC;
