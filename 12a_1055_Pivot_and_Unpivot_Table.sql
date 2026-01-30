CREATE TABLE uay.salesdata_crosstab (
    SaleName VARCHAR(50),
    JAN INT,
    FEB INT,
    MAR INT
);

INSERT INTO uay.salesdata_crosstab (SaleName, JAN, FEB, MAR) VALUES
('SaleA', 100, 150, 200),
('SaleB', 200, 250, 300),
('SaleC', 300, 350, 400);