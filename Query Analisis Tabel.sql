CREATE OR REPLACE TABLE `rakamin-kf-analytics-02062024.kimia_farma.kf_analyst` AS

WITH base_calculations AS (
  SELECT
    ft.transaction_id,
    ft.date,
    kc.branch_id,
    kc.branch_name,
    kc.kota,
    kc.provinsi,
    kc.rating AS rating_cabang,
    ft.customer_name,
    ft.product_id,
    pd.product_name,
    ft.price AS actual_price, 
    ft.discount_percentage,
    ft.rating AS rating_transaksi,
    
    CASE
      WHEN ft.price <= 50000 THEN 0.10
      WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
      WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
      WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
      WHEN ft.price > 500000 THEN 0.30
    END AS persentase_gross_laba,
    
    (ft.price - (ft.price * (ft.discount_percentage / 100))) AS nett_sales
    
  FROM
    `rakamin-kf-analytics-02062024.kimia_farma.kf_final_transaction` AS ft
  LEFT JOIN
    `rakamin-kf-analytics-02062024.kimia_farma.kf_kantor_cabang` AS kc
    ON ft.branch_id = kc.branch_id
  LEFT JOIN
    `rakamin-kf-analytics-02062024.kimia_farma.kf_product` AS pd
    ON ft.product_id = pd.product_id
)

SELECT
  *,

  (nett_sales * persentase_gross_laba) AS nett_profit
FROM
  base_calculations;
