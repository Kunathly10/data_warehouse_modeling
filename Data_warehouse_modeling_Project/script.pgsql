
-- Dimensions
CREATE TABLE dim_Customer (
    Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_email VARCHAR(255),
    Customer_phone VARCHAR(25)
);

CREATE TABLE dim_Car (
    Car_id INT PRIMARY KEY,
    Car_model VARCHAR(255),
    Car_type VARCHAR(255),
    Car_cost_price DECIMAL(10,2),
    Car_availability BOOLEAN,
    Car_rating DECIMAL(3,2),        
    Price_per_hour DECIMAL(10,2)    
);
--To alter the dim_Car table
ALTER TABLE dim_Car
DROP COLUMN Car_type
-- Facts
CREATE TABLE ft_CarRentalTransaction (
    Transaction_id INT PRIMARY KEY,
    Customer_id INT,
    Car_id INT,
    Pick_up_date TIMESTAMP,
    Return_date TIMESTAMP,
    Return_status VARCHAR(50),
    FOREIGN KEY (Customer_id) REFERENCES dim_Customer(Customer_id),
    FOREIGN KEY (Car_id) REFERENCES dim_Car(Car_id)
);

UPDATE ft_CarRentalTransaction
SET Pick_up_date = TO_TIMESTAMP(TO_CHAR(Pick_up_date, 'YYYY-MM-DD'), 'YYYY-MM-DD'),
    Return_date = TO_TIMESTAMP(TO_CHAR(Return_date, 'YYYY-MM-DD'), 'YYYY-MM-DD')
;

CREATE TABLE ft_RentalInvoice (
    Invoice_id INT PRIMARY KEY,
    Transaction_id INT,
    Total_rent_hour INT,
    Total_price DECIMAL(10, 2),
    FOREIGN KEY (Transaction_id) REFERENCES ft_CarRentalTransaction(Transaction_id)
);

-- To alter the table

ALTER TABLE ft_RentalInvoice
DROP COLUMN Total_price;

;

-- To start populating the TABLES

INSERT INTO dim_Customer (Customer_id, Customer_name, Customer_email, Customer_phone)
VALUES
    (1, 'Chris Lucas', 'chris.lucas@mail.co', '345-500-992276'),
    (2, 'Ben Reels', 'ben4reel@yahoo.com', '442-211-144566'),
    (3,'Karen Shipsman', 'k.shipsman@yahoo.co.uk','656-344-343456'),
    (4, 'Loren Thomas', 'nowyouknow@mail.com','345-687-989898'),
    (5, 'Karen Shipsman', 'k.shipsman@yahoo.co.uk','656-344-343456')
;
INSERT INTO dim_Car (Car_id, Car_model, Car_cost_price, Car_availability, Car_rating, Price_per_hour)
VALUES
    (101, 'Toyota Vios 1.5 GAT White Pearl', 38000, TRUE, 3.5, 50),
    (102, 'Toyota Yaris 1.3 E MT', 42000, TRUE, 5, 42),
    (103, 'Toyota FJ Cruiser 4.0 V6', 35000, TRUE, 5, 25),
    (104, 'Toyota Yaris 1.3 E MT', 42000, FALSE, 5, 42),
    (105, 'Toyota Vios 1.5 GAT White Pearl', 38000, TRUE, 4, 50)
;
INSERT INTO ft_CarRentalTransaction (Transaction_id, Customer_id, 
                    Car_id, Pick_up_date, Return_date, Return_status)
VALUES
    (1001, 1, 101, '2022-10-03', '2022-10-04', 'Returned'),
    (1002, 2, 102, '2022-10-03', '2022-10-04', 'Returned'),
    (1003, 3, 103, '2022-10-06', '2022-10-06', 'Returned'),
    (1004, 4, 104, '2022-10-08', NULL, 'Not Returned'),
    (1005, 5, 105, '2022-10-08', '2022-10-09', 'Returned')
;

INSERT INTO ft_RentalInvoice(Invoice_id, Transaction_id, Total_rent_hour)
VALUES
    (10001, 1001, 16),
    (10002, 1002, 20),
    (10003, 1003, 5),
    (10004, 1004, 12), 
    (10005, 1005, 14)
;
