-- CREATE DATABASE demand_forecasting_system;
USE demand_forecasting_system;

-- buat tabel demand
CREATE TABLE demand_data (
    id INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL,
    Kategori VARCHAR(100) NOT NULL,
    Tipe_Model VARCHAR(100) NOT NULL,
    Demand INT NOT NULL,
    Past_Demand_1 INT,
    Past_Demand_2 INT,
    Moving_Average DECIMAL(10, 2),
    Sales_Trend DECIMAL(10, 2),
    Event VARCHAR(100),
    Event_Multiplier DECIMAL(5, 2),
    Safety_Percentage DECIMAL(5, 2),
    Event_Demand_Estimated INT,
    Location VARCHAR(100) NOT NULL,
    Latitude DECIMAL(10, 8),
    Longitude DECIMAL(11, 8),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX (Date),
    INDEX (Kategori),
    INDEX (Tipe_Model),
    INDEX (Location)
);

-- masukkan data 
-- Masukkan data pertama (01/01/20 - Dispenser)
INSERT INTO demand_data (
    Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2,
    Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage,
    Event_Demand_Estimated, Location, Latitude, Longitude
) VALUES (
    '2020-01-01', 'Dispenser', 'Dispenser Portable', 200, 190, 150,
    180, 0.052631579, 'New_Year', 1.2, 30,
    515, 'Makassar', -5.1477, 119.4327
);

-- Masukkan data kedua (01/01/20 - Kipas Angin)
INSERT INTO demand_data (
    Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2,
    Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage,
    Event_Demand_Estimated, Location, Latitude, Longitude
) VALUES (
    '2020-01-01', 'Kipas Angin', 'Kipas Berdiri', 100, 90, 85,
    91.66666667, 0.111111111, 'New_Year', 1.2, 30,
    262, 'Surabaya', -7.2575, 112.7521
);

-- Masukkan data ketiga (01/01/20 - Setrika)
INSERT INTO demand_data (
    Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2,
    Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage,
    Event_Demand_Estimated, Location, Latitude, Longitude
) VALUES (
    '2020-01-01', 'Setrika', 'Setrika', 100, 90, 120,
    103.3333333, 0.111111111, 'New_Year', 1.2, 30,
    296, 'Medan', 3.5952, 98.6722
);

-- Masukkan data keempat (02/01/20 - Blender)
INSERT INTO demand_data (
    Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2,
    Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage,
    Event_Demand_Estimated, Location, Latitude, Longitude
) VALUES (
    '2020-01-02', 'Blender', 'Blender Kaca', 385, 160, 100,
    215, 1.40625, 'No_Event', 1, 15,
    495, 'Batam', 1.0456, 104.0305
);

-- Masukkan data kelima (02/01/20 - Kipas Angin)
INSERT INTO demand_data (
    Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2,
    Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage,
    Event_Demand_Estimated, Location, Latitude, Longitude
) VALUES (
    '2020-01-02', 'Kipas Angin', 'Kipas Meja', 150, 125, 100,
    125, 0.2, 'No_Event', 1, 15,
    288, 'Batam', 1.0456, 104.0305
);

-- Insert data for 02/01/20 - Televisi QLED 65"
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-02', 'Televisi', 'QLED 65"', 100, 90, 85, 91.66666667, 0.111111111, 'No_Event', 1, 15, 211, 'Batam', 1.0456, 104.0305);

-- Insert data for 03/01/20 - Vacuum Cleaner Canister Vacuum
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-03', 'Vacuum Cleaner', 'Canister Vacuum', 438, 300, 100, 279.3333333, 0.46, 'No_Event', 1, 15, 642, 'Cibitung', -6.267, 107.1111);

-- Insert data for 03/01/20 - Televisi LED 24"
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-03', 'Televisi', 'LED 24"', 250, 150, 100, 166.6666667, 0.666666667, 'No_Event', 1, 15, 383, 'Jakarta', -6.2088, 106.8456);

-- Insert data for 03/01/20 - Kipas Angin Kipas Meja
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-03', 'Kipas Angin', 'Kipas Meja', 392, 150, 125, 222.3333333, 1.613333333, 'No_Event', 1, 15, 511, 'Makassar', -5.1477, 119.4327);

-- Insert data for 04/01/20 - Microwave Solo Microwave
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-04', 'Microwave', 'Solo Microwave', 100, 75, 50, 75, 0.333333333, 'No_Event', 1, 15, 173, 'Makassar', -5.1477, 119.4327);

-- Insert data for 04/01/20 - Microwave Grill Microwave
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-04', 'Microwave', 'Grill Microwave', 120, 115, 100, 111.6666667, 0.043478261, 'No_Event', 1, 15, 257, 'Batam', 1.0456, 104.0305);

-- Insert data for 04/01/20 - AC (Air Conditioner) Split 0.5 PK
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-04', 'AC (Air Conditioner)', 'Split 0.5 PK', 200, 120, 150, 156.6666667, 0.666666667, 'No_Event', 1, 15, 360, 'Bekasi', -6.2416, 106.9924);

-- Insert data for 05/01/20 - Vacuum Cleaner Handheld Vacuum
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-05', 'Vacuum Cleaner', 'Handheld Vacuum', 300, 100, 50, 150, 2, 'No_Event', 1, 15, 345, 'Medan', 3.5952, 98.6722);

-- Insert data for 05/01/20 - Dispenser Top Loading
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-05', 'Dispenser', 'Top Loading', 150, 75, 50, 91.66666667, 1, 'No_Event', 1, 15, 211, 'Batam', 1.0456, 104.0305);

-- Insert data for 05/01/20 - Vacuum Cleaner Robot Vacuum
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-05', 'Vacuum Cleaner', 'Robot Vacuum', 100, 120, 96, 105.3333333, -0.166666667, 'No_Event', 1, 15, 242, 'Surabaya', -7.2575, 112.7521);

-- Insert data for 06/01/20 - Televisi LED 43"
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-06', 'Televisi', 'LED 43"', 180, 150, 100, 143.3333333, 0.2, 'No_Event', 1, 15, 330, 'Medan', 3.5952, 98.6722);

-- Insert data for 06/01/20 - Blender Blender Plastik
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-06', 'Blender', 'Blender Plastik', 295, 100, 90, 161.6666667, 1.95, 'No_Event', 1, 15, 372, 'Bekasi', -6.2416, 106.9924);

-- Insert data for 06/01/20 - Setrika Setrika
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-06', 'Setrika', 'Setrika', 150, 120, 170, 146.6666667, 0.25, 'No_Event', 1, 15, 337, 'Sidoarjo', -7.4478, 112.7181);

-- Insert data for 07/01/20 - Blender Blender Plastik
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-07', 'Blender', 'Blender Plastik', 192, 150, 120, 154, 0.28, 'No_Event', 1, 15, 354, 'Surabaya', -7.2575, 112.7521);

-- Insert data for 07/01/20 - AC (Air Conditioner) Portable AC 1 PK
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-07', 'AC (Air Conditioner)', 'Portable AC 1 PK', 500, 350, 210, 353.3333333, 0.428571429, 'No_Event', 1, 15, 813, 'Bekasi', -6.2416, 106.9924);

-- Insert data for 07/01/20 - AC (Air Conditioner) Cassette 2 PK
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-07', 'AC (Air Conditioner)', 'Cassette 2 PK', 250, 230, 300, 260, 0.086956522, 'No_Event', 1, 15, 598, 'Tangerang', -6.1783, 106.6319);

-- Insert data for 08/01/20 - Televisi LED 43"
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-08', 'Televisi', 'LED 43"', 449, 250, 250, 316.3333333, 0.796, 'No_Event', 1, 15, 728, 'Tangerang', -6.1783, 106.6319);

-- Insert data for 08/01/20 - Setrika Setrika
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-08', 'Setrika', 'Setrika', 304, 295, 100, 233, 0.030508475, 'No_Event', 1, 15, 536, 'Semarang', -6.9667, 110.4167);

-- Insert data for 08/01/20 - Dispenser Hot & Cool
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-08', 'Dispenser', 'Hot & Cool', 140, 130, 200, 156.6666667, 0.076923077, 'No_Event', 1, 15, 360, 'Bekasi', -6.2416, 106.9924);

-- Insert data for 09/01/20 - Vacuum Cleaner Canister Vacuum
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-09', 'Vacuum Cleaner', 'Canister Vacuum', 358, 140, 130, 209.3333333, 1.557142857, 'No_Event', 1, 15, 481, 'Medan', 3.5952, 98.6722);

-- Insert data for 09/01/20 - Mesin Cuci Twin Tub 9kg
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-09', 'Mesin Cuci', 'Twin Tub 9kg', 115, 100, 95, 103.3333333, 0.15, 'No_Event', 1, 15, 238, 'Tangerang', -6.1783, 106.6319);

-- Insert data for 09/01/20 - Microwave Inverter Microwave
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-09', 'Microwave', 'Inverter Microwave', 95, 80, 70, 81.66666667, 0.1875, 'No_Event', 1, 15, 188, 'Jakarta', -6.2088, 106.8456);

-- Insert data for 10/01/20 - Microwave Digital Microwave
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-10', 'Microwave', 'Digital Microwave', 30, 50, 25, 35, -0.4, 'No_Event', 1, 15, 81, 'Sidoarjo', -7.4478, 112.7181);

-- Insert data for 10/01/20 - Dispenser Top Loading
INSERT INTO demand_data (Date, Kategori, Tipe_Model, Demand, Past_Demand_1, Past_Demand_2, Moving_Average, Sales_Trend, Event, Event_Multiplier, Safety_Percentage, Event_Demand_Estimated, Location, Latitude, Longitude)
VALUES ('2020-01-10', 'Dispenser', 'Top Loading', 200, 175, 150, 175, 0.142857143, 'No_Event', 1, 15, 403, 'Sidoarjo', -7.4478, 112.7181); 

