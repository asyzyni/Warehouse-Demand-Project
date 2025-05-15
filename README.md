# 📦 Warehouse Demand Forecasting

Proyek ini bertujuan untuk memprediksi permintaan gudang berdasarkan data historis dan faktor eksternal seperti event nasional, promosi, musim, dan tren penjualan.

## 📊 Dataset

Dataset terdiri dari fitur-fitur berikut:

| Kolom | Deskripsi |
|-------|-----------|
| `Date` | Tanggal pengamatan |
| `Kategori` | Kategori produk |
| `Tipe/Model` | Jenis model produk |
| `Season` | Musim saat pengamatan (Kemarau/Hujan) |
| `Demand` | Permintaan aktual (nilai target) |
| `Past_Demand_1` | Permintaan bulan sebelumnya |
| `Past_Demand_2` | Permintaan dua bulan sebelumnya |
| `Moving_Average` | Rata-rata permintaan 3 periode |
| `Sales_Trend` | Tren perubahan penjualan |
| `Event` | Event khusus (Idul Fitri, Natal, dll.) |
| `Event_Multiplier` | Pengali dampak event |
| `Safety Percentage` | Persentase tambahan untuk stok aman |
| `Event_Demand_Estimated` | Estimasi permintaan akibat event |
| `Location` | Lokasi gudang/distribusi |
| `Latitude`, `Longitude` | Koordinat lokasi |

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

### Moving Average (3 Periode)
```latex
Moving\ Average = \frac{Past\_Demand\_1 + Past\_Demand\_2 + Demand}{3}
```

### 2. **Sales Trend:**
```latex
Sales\ Trend = \frac{Past\_Demand\_1}{Past\_Demand\_2}
```

### 3. **Estimated Demand (Optional Formula):**
```latex
Estimated\ Demand = Moving\ Average \times Sales\ Trend \times Event\ Multiplier \times (1 + Safety\ Percentage)
```

## 🤖 Model Machine Learning

Berikut model yang digunakan untuk regresi permintaan:

- XGBoost 🧠


## 🧪 Evaluasi Model

- **MAE** (Mean Absolute Error)
- **RMSE** (Root Mean Squared Error)
- **R² Score**



