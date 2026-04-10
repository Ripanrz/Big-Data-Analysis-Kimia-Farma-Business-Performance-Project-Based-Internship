CREATE OR REPLACE TABLE `rakamin-kf-analytics-01062024.kf_analytics.kf_final_task_dataset` AS
SELECT
    t.transaction_id,
    t.date,
    c.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,
    t.customer_name,
    p.product_id,
    p.product_name,
    p.price AS actual_price,
    t.discount_percentage,
    -- Logika Laba
    CASE
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
        WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
        WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,
    -- Nett Sales (Harga setelah diskon)
    (p.price * (1 - t.discount_percentage)) AS nett_sales,
    -- Nett Profit (Laba Kotor - Nominal Diskon)
    ((p.price * (CASE 
        WHEN p.price <= 50000 THEN 0.10
        WHEN p.price > 50000 AND p.price <= 100000 THEN 0.15
        WHEN p.price > 100000 AND p.price <= 300000 THEN 0.20
        WHEN p.price > 300000 AND p.price <= 500000 THEN 0.25
        ELSE 0.30 
    END)) - (p.price * t.discount_percentage)) AS nett_profit,
    t.rating AS rating_transaksi
FROM `project_id.kf_analytics.kf_final_transaction` t
LEFT JOIN `project_id.kf_analytics.kf_kantor_cabang` c ON t.branch_id = c.branch_id
LEFT JOIN `project_id.kf_analytics.kf_product` p ON t.product_id = p.product_id;
