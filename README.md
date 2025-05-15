# 📦 Warehouse Demand Forecasting

Proyek ini bertujuan untuk memprediksi permintaan gudang berdasarkan data historis dan faktor eksternal seperti event nasional, promosi, musim, dan tren penjualan.

## 📊 Dataset

Dataset terdiri dari fitur-fitur berikut:

| Fitur | Tipe Data | Deskripsi |
|------|------------|------------|
| `product_name` | Kategorikal | Nama produk |
| `year` | Numerik | Tahun prediksi |
| `month` | Numerik | Bulan prediksi |
| `season` | Kategorikal | Musim: Panas / Hujan |
| `is_holiday` | Biner | Apakah ada hari libur nasional |
| `holiday_impact` | Numerik | Faktor pengali dampak libur |
| `is_promo` | Biner | Apakah ada promo saat itu |
| `promo_discount` | Numerik | Besaran diskon (0–1) |
| `avg_temp` | Numerik | Suhu rata-rata |
| `last_3months_sales` | Numerik | Total penjualan 3 bulan terakhir |
| `sales_trend` | Numerik | Tren penjualan (0–1 turun, >1 naik) |
| `event` | Kategorikal | Event khusus seperti Idul Fitri, Natal, dll. |
| `event_encoded` | Numerik | Encoding event (manual mapping) |
| `event_multiplier` | Numerik | Pengali khusus untuk event tertentu |
| `moving_average` | Numerik | Rata-rata bergerak dari permintaan sebelumnya |
| `demand` | Numerik | Target permintaan aktual (target variabel) |

### 📌 Event Encoding (Manual)

| Event | Encoding |
|-------|----------|
| Idul Fitri | 1 |
| Natal | 2 |
| Tahun Baru | 3 |
| Idul Adha | 4 |
| Imlek | 5 |
| 17 Agustus | 6 |
| Nyepi | 7 |
| No Event | 8 |

## 🧮 Rumus Perhitungan Penting

### 1. **Moving Average (3 Periode):**

\[
\text{Moving Average} = \frac{{\text{Past\_Demand\_1} + \text{Past\_Demand\_2} + \text{Past\_Demand\_3}}}{3}
\]

### 2. **Sales Trend:**

\[
\text{Sales Trend} = \frac{{\text{Past\_Demand\_1}}}{\text{Past\_Demand\_2}}
\]

### 3. **Estimated Demand (Optional Formula):**

\[
\text{Estimated Demand} = \text{Moving Average} \times \text{Sales Trend} \times \text{Holiday Impact} \times \text{Event Multiplier}
\]

## 🤖 Model Machine Learning

Berikut model yang digunakan untuk regresi permintaan:

- XGBoost 🧠


## 🧪 Evaluasi Model

- **MAE** (Mean Absolute Error)
- **RMSE** (Root Mean Squared Error)
- **R² Score**



