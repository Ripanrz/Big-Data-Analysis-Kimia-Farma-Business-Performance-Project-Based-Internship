CREATE OR REPLACE TABLE dataset_kimia_farma_rakamin.kf_analisisQ AS
SELECT
  Q.transaction_id,
  Q.date,
  Q.branch_id,
  Q.branch_name,
  Q.kota,
  Q.provinsi,
  Q.rating_cabang,
  Q.customer_name,
  Q.product_id,
  Q.product_name,
  Q.actual_price,
  Q.discount_percentage,
  Q.persentase_gross_laba,
  Q.nett_sales,
  (Q.nett_sales * Q.persentase_gross_laba) AS nett_profit,
  Q.rating_transaksi
FROM (
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
    CASE
      WHEN ft.price <= 50000 THEN 0.10
      WHEN ft.price > 50000 AND ft.price <= 100000 THEN 0.15
      WHEN ft.price > 100000 AND ft.price <= 300000 THEN 0.20
      WHEN ft.price > 300000 AND ft.price <= 500000 THEN 0.25
      WHEN ft.price > 500000 THEN 0.30
    END AS persentase_gross_laba,
    (ft.price - (ft.price * (ft.discount_percentage / 100))) AS nett_sales,
    ft.rating AS rating_transaksi
  FROM
    dataset_kimia_farma_rakamin.kf_final_transaction AS ft
  LEFT JOIN
    dataset_kimia_farma_rakamin.kf_kantor_cabang AS kc ON ft.branch_id = kc.branch_id
  LEFT JOIN
    dataset_kimia_farma_rakamin.kf_product AS pd ON ft.product_id = pd.product_id
) Q;
