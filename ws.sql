CREATE DATABASE Workshop1;
GO
USE Workshop1;
GO
CREATE TABLE tbl_Mobile (
    mobileId VARCHAR(10) PRIMARY KEY,
    description VARCHAR(250) NOT NULL,
    price FLOAT NOT NULL,
    mobileName VARCHAR(20) NOT NULL,
    yearOfProduction INT NOT NULL,
    quantity INT NOT NULL,
    notSale BIT NOT NULL -- 0: sale, 1: not sale
);
GO
CREATE TABLE tbl_User (
    userId VARCHAR(20) PRIMARY KEY,
    password INT NOT NULL, 
    fullName VARCHAR(50) NOT NULL,
    role INT NOT NULL -- 0: user, 1: manager, 2: staff but not need to create manager
);
GO
-- Insert data for tbl_Mobile
INSERT INTO tbl_Mobile (mobileId, description, price, mobileName, yearOfProduction, quantity, notSale)
VALUES
('MB001', 'Dien thoai thong minh cao cap', 15000000, 'iPhone 15 Pro', 2023, 100, 0),
('MB002', 'Dien thoai Android gia re', 3500000, 'Samsung Galaxy A23', 2022, 250, 0),
('MB003', 'Dien thoai chup anh dep', 12000000, 'Xiaomi 13 Pro', 2023, 80, 0),
('MB004', 'Dien thoai pin khoe', 5000000, 'Oppo A96', 2022, 150, 0),
('MB005', 'Dien thoai man hinh gập', 25000000, 'Samsung Galaxy Z', 2022, 50, 0),
('MB006', 'High-end smartphone', 18000000, 'iPhone 15 Pro Max', 2023, 75, 0),
('MB007', 'Budget-friendly Android phone', 4000000, 'Xiaomi Redmi Note 12', 2023, 200, 0),
('MB008', 'Phone with great camera', 13500000, 'Google Pixel 7 Pro', 2022, 60, 0),
('MB009', 'Phone with long battery life', 6500000, 'Vivo V25 Pro', 2023, 120, 0),
('MB010', 'Folding screen phone', 28000000, 'Huawei Mate X3', 2023, 30, 0),
('MB011', 'Dien thoai choi game', 8000000, 'Poco X5 Pro', 2023, 90, 0),
('MB012', 'Dien thoai thiet ke dep', 10000000, 'Nothing Phone (2)', 2023, 40, 0),
('MB013', 'Dien thoai 5G toc do cao', 16000000, 'OnePlus 11', 2023, 70, 0),
('MB014', 'Dien thoai man hinh lon', 7500000, 'Realme C55', 2023, 180, 0),
('MB015', 'Dien thoai am thanh cuc dinh', 9000000, 'Sony Xperia 1 IV', 2022, 35, 0),
('MB016', 'Smartphone for gaming', 9500000, 'Asus ROG Phone 6', 2022, 55, 0),
('MB017', 'Smartphone with unique design', 11000000, 'Motorola Edge 30', 2022, 45, 0),
('MB018', 'High-speed 5G smartphone', 17500000, 'Samsung Galaxy S23', 2023, 65, 0),
('MB019', 'Smartphone with large display', 8500000, 'Honor Magic5 Pro', 2023, 110, 0),
('MB020', 'Smartphone with excellent audio', 10500000, 'iPhone 14 Pro', 2022, 50, 0);
GO
-- Insertdata for tbl_User
INSERT INTO tbl_User (userId, password, fullName, role)
VALUES
('staff01', 123456, 'Nguyen Van A', 2),
('staff02', 654321, 'Tran Thi B', 2),
('staff03', 111111, 'Le Van C', 2),
('staff04', 222222, 'Pham Thi D', 2),
('staff05', 333333, 'Hoang Van E', 2),
('staff06', 444444, 'Do Thi F', 2),
('staff07', 555555, 'Vu Van G', 2),
('staff08', 666666, 'Phan Thi H', 2),
('staff09', 777777, 'Ngo Van I', 2),
('staff10', 888888, 'Ly Thi J', 2),
('staff11', 999999, 'John Doe', 2),
('staff12', 101010, 'Jane Smith', 2),
('staff13', 202020, 'David Johnson', 2),
('staff14', 303030, 'Emily Brown', 2),
('staff15', 404040, 'Michael Wilson', 2),
('staff16', 505050, 'Olivia Davis', 2),
('staff17', 606060, 'Daniel Taylor', 2),
('staff18', 707070, 'Sophia Anderson', 2),
('staff19', 808080, 'William Thomas', 2),
('staff20', 909090, 'Ava Jackson', 2);
GO
