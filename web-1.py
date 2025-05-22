import streamlit as st
import pandas as pd
import joblib 
import pickle as pkl 
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime 
from xgboost import XGBRegressor
import xgboost as xgb

# load data
data_path = "/Users/asyzyni/Documents/COLLEGE👩🏻‍🏫/_SEMESTER 4/Warehouse-Demand-Website/Warehouse-Demand-Website/Quantity-Prediction Data.xlsx"
df = pd.read_excel(data_path)

# config page 
st.set_page_config(page_title="Warehouse Demand Prediction", layout="centered")
st.title("Warehouse Demand Prediction")

# load model 
try : 
    model = joblib.load("/Users/asyzyni/Documents/COLLEGE👩🏻‍🏫/_SEMESTER 4/Warehouse-Demand-Website/Warehouse-Demand-Website/Model Xgboost/xgboost.joblib")
    st.success("Model Load Success")
except Exception as e :
    st.error(f"Error load model : {str(e)}")
    st.stop()

# input form 
locations = [
    "Batam", "Bekasi", "Cibitung", "Jakarta", "Makassar", 
    "Medan", "Semarang", "Sidoarjo", "Surabaya", "Tangerang"
]
selected_location = st.selectbox("Select Location", locations)

months = [
    "January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"
]
selected_month = st.selectbox("Select Month", months)
month_number = months.index(selected_month) + 1

demand = st.number_input("Input Base Demand Value", min_value=0, value=100)

# event detector
def detect_event(date):
    if date.month == 1 and date.day == 1:
        return "New_Year", 1.2, 0.30
    elif date.month == 1 and date.day == 29:  # Tahun Baru Imlek 2025 (29 Januari 2025)
        return "Imlek", 1.3, 0.35
    elif date.month == 3 and date.day == 29:  # Hari Raya Nyepi 2025 (29 Maret 2025)
        return "Nyepi", 1.1, 0.25
    elif date.month == 4 and date.day == 2:  # Idul Fitri 1446 H (2 April 2025 - perkiraan)
        return "Idul_Fitri", 1.5, 0.45
    elif date.month == 6 and date.day == 7:  # Idul Adha 1446 H (7 Juni 2025 - perkiraan)
        return "Idul_Adha", 1.3, 0.35
    elif date.month == 8 and date.day == 17:
        return "Kemerdekaan", 1.2, 0.30
    elif date.month == 12 and date.day == 25:
        return "Natal", 1.4, 0.40
    elif date.month == 2 and date.day == 2:   # 02-02
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 3 and date.day == 3:   # 03-03
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 4 and date.day == 4:   # 04-04
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 5 and date.day == 5:   # 05-05
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 6 and date.day == 6:   # 06-06
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 7 and date.day == 7:   # 07-07
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 8 and date.day == 8:   # 08-08
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 9 and date.day == 9:   # 09-09
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 10 and date.day == 10: # 10-10
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 11 and date.day == 11: # 11-11
        return "Tanggal_Kembar", 1.3, 0.35
    elif date.month == 12 and date.day == 12: # 12-12
        return "Tanggal_Kembar", 1.3, 0.35
    else:
        return "No_Event", 1.0, 0.15 
        
def event():
        # Date input
    selected_date = st.date_input("Pilih tanggal", datetime.today())
    
    # Extract month and day
    month = selected_date.month
    day = selected_date.day
            
    # Detect event
    event_name, multiplier, bonus = detect_event(month, day)
    
    # Display results
    st.subheader("Hasil Deteksi Event")
    st.write(f"Tanggal: {selected_date.strftime('%d %B %Y')}")
    st.write(f"Event: **{event_name.replace('_', ' ')}**")
    
    if event_name != "No_Event":
        st.write(f"Tanggal: {selected_date.strftime('%d %B %Y')}")
        st.write(f"Event: **{event_name.replace('_', ' ')}**")
    
        





# ##
# # Filter data based on location and month
# # filtered_data = df[(df['Location'] == selected_location) & 
#                    (df['Date'].dt.month == month_number)] if 'Location' in df.columns else pd.DataFrame()

# if not filtered_data.empty:
#     # Take the first row's values if multiple entries exist
#     multiplier = float(filtered_data["Moving_Average"].values[0])
#     safety_percent = filtered_data["Safety Percentage"].values[0] / 100
#     event = filtered_data["Event"].values[0]
# else:
#     event, multiplier, safety_percent = detect_event(month_number)

# # Calculate predicted demand
# predicted_demand = demand * multiplier
# safety_stock = predicted_demand * safety_percent
# total_demand = predicted_demand + safety_stock

# # Display results
# st.subheader("Prediction Results")
# st.write(f"Location: {selected_location}")
# st.write(f"Month: {selected_month}")
# st.write(f"Event: {event.replace('_', ' ')}")
# st.write(f"Base Demand: {demand:,.0f}")
# st.write(f"Predicted Demand (with multiplier): {predicted_demand:,.0f}")
# st.write(f"Safety Stock ({safety_percent*100:.0f}%): {safety_stock:,.0f}")
# st.write(f"Total Predicted Demand: {total_demand:,.0f}")

# # Visualization
# fig, ax = plt.subplots(figsize=(10, 6))
# categories = ['Base Demand', 'Predicted Demand', 'Safety Stock', 'Total Demand']
# values = [demand, predicted_demand, safety_stock, total_demand]

# ax.bar(categories, values, color=['blue', 'orange', 'green', 'red'])
# ax.set_title('Demand Prediction Breakdown')
# ax.set_ylabel('Quantity')
# for i, v in enumerate(values):
#     ax.text(i, v + max(values)*0.05, f"{v:,.0f}", ha='center')

# st.pyplot(fig)

# #