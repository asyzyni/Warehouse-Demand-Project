import streamlit as st
import pandas as pd
import joblib 
import pickle as pkl 
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime 

# load data
data_path ="/Users/asyzyni/Documents/COLLEGE👩🏻‍🏫/_SEMESTER 4/Warehouse-Demand-Website/Warehouse-Demand-Website/Quantity-Prediction Data.xlsx"
df = pd.read_excel(data_path)


# config page 
st.set_page_config(page_title="Warehouse Demand Prediction", layout="centered")
st.title("Warehouse Demand Prediction")
st.subheader("Input your data to predict the demand of a warehouse")

# input form 
selected_date = st.date_input("Input Date")
demand = st.number_input("Input Demand Value", min_value=0, value=100)

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
    
row = df[df["Date"] == pd.datetime(selected_date)] 

if not row.empty:
    multiplier = flow(row["Moving_Average"].values[0])
    safety_percent = float(row["Safety Percentage"].values[0].replace("%", "")) / 100 
    event = row["Event"].values[0]
else:
    event, multiplier, safety_percent = detect_event(pd.to_datetime(selected_date))