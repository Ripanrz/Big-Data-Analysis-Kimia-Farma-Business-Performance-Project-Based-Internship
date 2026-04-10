# 💊 Kimia Farma: Big Data Business Performance Analytics (2020-2023)

[![Live Dashboard](https://img.shields.io/badge/Live%20Dashboard-Looker%20Studio-orange?style=for-the-badge&logo=googledata-studio)](LINK_DASHBOARD_KAMU)
[![Partner](https://img.shields.io/badge/Partner-Rakamin%20Academy-blue?style=for-the-badge)](https://www.rakamin.com/)

![SQL](https://img.shields.io/badge/Language-SQL-blue.svg)
![Big Data](https://img.shields.io/badge/Tools-Google%20BigQuery-orange)
![Data Viz](https://img.shields.io/badge/Visualization-Looker%20Studio-purple)
![Industry](https://img.shields.io/badge/Industry-Pharmaceutical-red)

[cite_start]**Mengevaluasi kinerja bisnis di sektor farmasi memerlukan integrasi data yang luas untuk menghasilkan keputusan strategis yang presisi.** Proyek ini mengevaluasi kinerja Kimia Farma periode 2020-2023[cite: 5].

[cite_start]Sebagai **Big Data Analytics Intern**, saya bertanggung jawab untuk membangun pipeline data end-to-end, mulai dari pemrosesan dataset mentah di **Google BigQuery** hingga pengembangan dashboard interaktif di **Google Looker Studio**[cite: 1, 9, 47]. [cite_start]Proyek ini mengintegrasikan data transaksi, inventaris, cabang, dan produk untuk menghasilkan analisis laba kotor yang dinamis [cite: 11-14, 17].

---

## 📸 Tampilan Dashboard

> *Dashboard operasional yang menyajikan metrik keuangan utama dan pemetaan distribusi profit nasional secara real-time.*

![Tampilan Dashboard](GANTI_DENGAN_URL_GAMBAR_SCREENSHOT)

---

## 🚀 Fitur & Analisis Utama

* [cite_start]**Comprehensive Data Ingestion**: Mengonsolidasi dataset transaksi, inventaris, kantor cabang, dan produk ke dalam BigQuery Warehouse [cite: 9-14].
* [cite_start]**Dynamic Gross Profit Engine**: Implementasi logika bisnis menggunakan SQL `CASE WHEN` untuk menghitung persentase laba secara otomatis berdasarkan tier harga produk [cite: 31-36, 215-216].
* [cite_start]**Financial Snapshot**: Visualisasi ringkasan performa yang mencakup Total Nett Sales, Total Laba Bersih, dan Total Transaksi[cite: 53, 58].
* [cite_start]**Regional Performance Tracking**: Analisis mendalam mengenai Top 10 provinsi dengan volume transaksi dan penjualan bersih tertinggi [cite: 55-56].
* [cite_start]**Operational Quality Analytics**: Fitur pemantauan untuk mengidentifikasi Top 5 cabang dengan rating tinggi namun memiliki rating transaksi rendah guna evaluasi layanan[cite: 57].
* [cite_start]**Geographical Mapping**: Visualisasi distribusi profitabilitas di seluruh wilayah Indonesia menggunakan Geo Map[cite: 58].

---

## 🔁 Arsitektur Sistem (Data Pipeline)

```mermaid
graph LR
    A[Raw Datasets CSV] -->|Data Ingestion| B(Google BigQuery)
    B -->|SQL Aggregation| C{Logic Transformation}
    C -->|Output Table| D[final_task_dataset]
    D -->|Direct Connection| E(Google Looker Studio)
    E -->|Visual Report| F[Business Performance Dashboard]
