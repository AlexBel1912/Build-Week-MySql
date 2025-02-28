CREATE DATABASE vendicose_spa;
USE vendicose_spa;

CREATE TABLE Warehouses (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(50)
);

CREATE TABLE Stores (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Location VARCHAR(50),
    WarehouseID INT,
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

CREATE TABLE Category (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    Description TEXT NOT NULL,
    RestockLevel INT
);

CREATE TABLE Product (
	ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50),
    MaxUnitSalesPrice DECIMAL(10,2),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES Category(ID)
);

CREATE TABLE Sales (
	ID INT,
	StoreID INT,
    LineID	INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (ID, StoreID, LineID),
    FOREIGN KEY (StoreID) REFERENCES Stores(ID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID)
);

CREATE TABLE StockLevels (
	ProductID INT,
    WarehouseID INT,
    Stock INT, -- Quantità di un prodotto in un magazzino specifico
    PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(ID)
);

-- Inserimento dati nei magazzini (Warehouses)
INSERT INTO Warehouses (Location) VALUES 
('Milano'),
('Roma'),
('Napoli'),
('Torino'),
('Firenze'),
('Bologna'),
('Genova'),
('Palermo'),
('Venezia'),
('Verona');

-- Inserimento dati nei negozi (Stores)
INSERT INTO Stores (Location, WarehouseID) VALUES 
('Negozio Centrale Milano', 1),
('Negozio Duomo Milano', 1),
('Negozio Navigli Milano', 1),
('Negozio Porta Roma', 2),
('Negozio Trastevere Roma', 2),
('Negozio Termini Roma', 2),
('Negozio Vesuvio Napoli', 3),
('Negozio Centro Storico Napoli', 3),
('Negozio Chiaia Napoli', 3),
('Negozio Mole Torino', 4),
('Negozio Porta Nuova Torino', 4),
('Negozio Quadrilatero Torino', 4),
('Negozio Ponte Vecchio Firenze', 5),
('Negozio Santa Croce Firenze', 5),
('Negozio Uffizi Firenze', 5),
('Negozio Due Torri Bologna', 6),
('Negozio Lanterna Genova', 7),
('Negozio Quattro Canti Palermo', 8),
('Negozio Canal Grande Venezia', 9),
('Negozio Arena Verona', 10);

-- Inserimento dati nelle categorie di prodotti (Category)
INSERT INTO Category (Name, Description, RestockLevel) VALUES 
('Elettronica', 'Dispositivi elettronici e accessori', 50),
('Abbigliamento', 'Vestiti e accessori di moda', 30),
('Alimentari', 'Cibo e bevande', 100),
('Giocattoli', 'Giochi per bambini di tutte le età', 20),
('Casa', 'Prodotti per la casa e arredamento', 40),
('Sport', 'Attrezzature e abbigliamento sportivo', 35),
('Bellezza', 'Prodotti per la cura della persona', 25);

-- Inserimento dati nei prodotti (Product)
INSERT INTO Product (Name, MaxUnitSalesPrice, CategoryID) VALUES 
('Smartphone', 799.99, 1),
('Laptop', 1299.99, 1),
('Auricolari Bluetooth', 99.99, 1),
('Jeans', 49.99, 2),
('Giacca in pelle', 199.99, 2),
('Scarpe da ginnastica', 89.99, 2),
('Pasta Artigianale', 5.99, 3),
('Vino Chianti', 15.99, 3),
('Olio oliva', 12.99, 3),
('Lego Set', 89.99, 4),
('Puzzle 1000 pezzi', 24.99, 4),
('Macchinina telecomandata', 39.99, 4),
('Lampada da Tavolo', 29.99, 5),
('Divano Moderno', 499.99, 5),
('Tavolino da caffè', 149.99, 5),
('Bicicletta da corsa', 799.99, 6),
('Pallone da calcio', 29.99, 6),
('Racchetta da tennis', 129.99, 6),
('Crema viso idratante', 19.99, 7),
('Shampoo biologico', 9.99, 7),
('Profumo di lusso', 79.99, 7);

-- Inserimento dati nei livelli di stock (StockLevels)
INSERT INTO StockLevels (ProductID, WarehouseID, Stock) VALUES 
(1, 1, 100),
(2, 1, 80),
(3, 1, 150),
(4, 2, 200),
(5, 2, 90),
(6, 2, 120),
(7, 3, 300),
(8, 3, 180),
(9, 3, 220),
(10, 4, 150),
(11, 4, 140),
(12, 4, 160),
(13, 5, 250),
(14, 5, 60),
(15, 5, 110),
(16, 6, 90),
(17, 6, 130),
(18, 6, 70),
(19, 7, 200),
(20, 7, 150),
(21, 7, 100);

-- Inserimento dati nelle vendite (Sales)
INSERT INTO Sales (ID, StoreID, LineID, ProductID, Quantity) VALUES 
(1, 1, 1, 1, 10),
(1, 1, 2, 3, 5),
(1, 1, 3, 5, 8),
(2, 2, 1, 2, 15),
(2, 2, 2, 5, 7),
(2, 2, 3, 8, 6),
(3, 3, 1, 3, 20),
(3, 3, 2, 6, 10),
(3, 3, 3, 9, 12),
(4, 4, 1, 4, 5),
(4, 4, 2, 8, 3),
(4, 4, 3, 10, 9),
(5, 5, 1, 5, 12),
(5, 5, 2, 10, 6),
(5, 5, 3, 12, 14),
(6, 6, 1, 6, 8),
(6, 6, 2, 12, 4),
(6, 6, 3, 14, 7),
(7, 7, 1, 7, 14),
(7, 7, 2, 14, 9),
(7, 7, 3, 16, 11),
(8, 8, 1, 8, 18),
(8, 8, 2, 16, 11),
(8, 8, 3, 18, 5),
(9, 9, 1, 9, 6),
(9, 9, 2, 18, 7),
(9, 9, 3, 20, 4),
(10, 10, 1, 10, 10),
(10, 10, 2, 20, 5),
(10, 10, 3, 21, 9);

INSERT INTO Sales (ID, StoreID, LineID, ProductID, Quantity) VALUES 
(11, 1, 1, 1, 10),
(11, 1, 2, 3, 5),
(11, 1, 3, 5, 8),
(12, 5, 1, 5, 12),
(12, 5, 2, 10, 6),
(12, 5, 3, 12, 14);

-- Ogni qual volta un prodotto viene venduto in un negozio, qual è la query da eseguire per aggiornare le tabelle di riferimento? 
-- Viene effettuata la vendita 13 nello store 'Negozio Centrale Milano', che comprende 5 smartphone, 3 laptop

INSERT INTO Sales (ID, StoreID, LineID, ProductID, Quantity) VALUES
(13, 1, 1, 1, 5),
(13, 1, 2, 2, 3);

-- Lista dei prodotti venduta con la vendita 13 nello store 1
SELECT ProductID
FROM Sales
WHERE Sales.ID = 13 AND Sales.StoreID = 1;

-- Aggiornamento stock del prodotto 1
UPDATE StockLevels
SET Stock = Stock - 
	(SELECT Quantity FROM Sales WHERE Sales.ID = 13 AND Sales.ProductID = 1)
WHERE ProductID = 1 AND WarehouseID = (SELECT Warehouses.ID
	FROM Warehouses JOIN Stores ON Warehouses.ID = Stores.WarehouseID
	JOIN Sales ON Stores.ID = Sales.StoreID
	WHERE Sales.ID = 13 AND Sales.StoreID = 1 LIMIT 1);
    
    SELECT Warehouses.ID
	FROM Warehouses JOIN Stores ON Warehouses.ID = Stores.WarehouseID
	JOIN Sales ON Stores.ID = Sales.StoreID
	WHERE Sales.ID = 13 AND Sales.StoreID = 1 LIMIT 1;
    
    SELECT * FROM StockLevels;
    
-- Aggiornamento stock del prodotto 2
UPDATE StockLevels
SET Stock = Stock - 
	(SELECT Quantity FROM Sales WHERE Sales.ID = 13 AND Sales.ProductID = 2)
WHERE ProductID = 2 AND WarehouseID = (SELECT Warehouses.ID
	FROM Warehouses JOIN Stores ON Warehouses.ID = Stores.WarehouseID
	JOIN Sales ON Stores.ID = Sales.StoreID
	WHERE Sales.ID = 13 AND Sales.StoreID = 1 LIMIT 1);
 
 -- Aggiornamento con una sola query per mezzo di un id vendita e di un store id
UPDATE StockLevels
SET Stock = Stock - (SELECT Quantity FROM Sales WHERE Sales.ID = 13 AND Sales.ProductID = StockLevels.ProductID)
WHERE ProductID IN 
(SELECT ProductID FROM Sales WHERE Sales.ID = 13) AND WarehouseID = (SELECT WarehouseID	FROM Stores WHERE ID = 1);

 -- Aggiornamento con una sola query per mezzo di un id vendita
UPDATE StockLevels
SET Stock = Stock - (SELECT Quantity FROM Sales WHERE Sales.ID = 13 AND Sales.ProductID = StockLevels.ProductID)
WHERE ProductID IN (SELECT ProductID FROM Sales WHERE Sales.ID = 13) 
AND WarehouseID = (	SELECT Warehouses.ID FROM Warehouses 
					JOIN Stores ON Warehouses.ID = Stores.WarehouseID
					JOIN Sales ON Stores.ID = Sales.StoreID
					WHERE Sales.ID = 13 LIMIT 1);

-- Numero vendita 14 nello store 5
-- Che prodotti ci sono nello store 5?
SELECT StockLevels.ProductID 
FROM StockLevels JOIN Warehouses ON StockLevels.WarehouseID = Warehouses.ID
JOIN Stores ON Stores.WarehouseID = Warehouses.ID
WHERE Stores.ID = 2;

-- Vengono venduti i prodotti 4 e 6
INSERT INTO Sales (ID, StoreID, LineID, ProductID, Quantity) VALUES
(14, 5, 1, 4, 10),
(14, 5, 2, 6, 5);

 -- Aggiornamento dello stock con una sola query per mezzo dell'id vendita 14
UPDATE StockLevels
SET Stock = Stock - (SELECT Quantity FROM Sales WHERE Sales.ID = 14 AND Sales.ProductID = StockLevels.ProductID)
WHERE ProductID IN (SELECT ProductID FROM Sales WHERE Sales.ID = 14) 
AND WarehouseID = (	SELECT Warehouses.ID FROM Warehouses 
					JOIN Stores ON Warehouses.ID = Stores.WarehouseID
					JOIN Sales ON Stores.ID = Sales.StoreID
					WHERE Sales.ID = 14 LIMIT 1);
                    

-- Creazione di un trigger automatico

DELIMITER //								 	-- Serve a modificare temporaneamente il simbolo che indica il termine di un comando, così che SQL non interpreti ; come la fine del comando ma usi //
CREATE TRIGGER update_stock_after_insert 		-- Definiamo un trigger con un nome
AFTER INSERT ON Sales 							-- Il trigger si attiverà ogni volta che viene effettuata una insert nella tabella Sales
FOR EACH ROW 									-- Il trigger verrà eseguito per ogni riga inserita nella tabella Sales
BEGIN											-- Identifica l'inizio del blocco di istruzioni
	UPDATE StockLevels							-- Update utilizzato per diminuire lo stock
    SET Stock = Stock - NEW.Quantity			-- NEW.Quantity identifica la quantità appena inserita nella tabella Sales nella riga per cui si è stato attivato il trigger
    WHERE ProductID = NEW.ProductID				-- NEW.ProductID identifica l'ID del prodotto appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
    AND WarehouseID = (							
		SELECT Warehouses.ID					-- Subquery per recuperare il magazzino correlato allo store che è stato inserito nella vendita
        FROM Warehouses
        JOIN Stores ON Warehouses.ID = Stores.WarehouseID
        WHERE Stores.ID = NEW.StoreID			-- NEW.StoreID identifica l'ID dello store appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
        LIMIT 1
	);
END;											-- Fine del blocco di istruzioni
//												-- Delimitatore di fine comando temporaneo impostato prima
DELIMITER ; -- Ripristina il delimitatore di fine comando a ;

-- Verifichiamo stock pre-vendita
SELECT * FROM StockLevels;

-- Effetuiamo una vendita
INSERT INTO Sales (ID, StoreID, LineID, ProductID, Quantity) VALUES
(25, 1, 5, 5, 10),
(26, 2, 6, 7, 5);

-- Verifichiamo lo stock post-vendita
SELECT * FROM StockLevels;

CREATE VIEW RestockNeed AS
SELECT 
    Category.Name AS CategoryName,
    SUM(stocklevels.Stock) AS TotalStockInWarehouses,
    Category.RestockLevel AS RestockLevel,
    (Category.RestockLevel - SUM(StockLevel.Stock)) AS NeedForRestock
FROM 
    Category
JOIN 
    Product ON Category.ID = Product.CategoryID
JOIN 
    StockLevels ON Product.ID = StockLevels.ProductID
GROUP BY 
    Category.ID;


SELECT * FROM RestockNeed;

SELECT * FROM Category;
    -- 2 - Quali sono le query da eseguire per verificare quante unità di un prodotto ci sono in un dato magazzino e per monitorare le soglie di restock?
-- Per verificare quante unità di prodotto (ID 1) ci sono nel magazzino (ID 2)
SELECT Product.Name AS NomeProdotto, Warehouses.ID AS CodiceMagazzino, StockLevels.Stock, Category.RestockLevel AS SogliaDiRestock
FROM Product JOIN StockLevels ON Product.ID = StockLevels.ProductID
JOIN Warehouses ON Warehouses.ID = StockLevels.WarehouseID
JOIN Category ON Product.CategoryID = Category.ID
WHERE Product.ID = 1 AND Warehouses.ID = 1;


-- Creazione trigger per generazione allarme quando prodotto va sottosoglia
DELIMITER $$

CREATE TRIGGER check_stock_level
AFTER UPDATE ON StockLevels
FOR EACH ROW
BEGIN
	IF NEW.Stock < (SELECT Category.RestockLevel
					FROM Category
					JOIN Product ON Category.ID = Product.CategoryID
                    WHERE Product.ID = NEW.ProductID) THEN
		INSERT INTO StockAlerts (ProductID, AlertMessage, AlertDate)
		VALUES (NEW.ProductID, "La quantità in stock è sottosoglia", NOW());
	END IF;
END;
$$

DELIMITER ;

-- Riapprovigionamento stock
UPDATE StockLevels
SET Stock =	(SELECT Category.RestockLevel
			 FROM Category
             JOIN Product ON Category.ID = Product.CategoryID
			 WHERE Product.ID = StockLevels.ProductID)
WHERE ProductID IN (SELECT ProductID FROM StockAlerts) AND Stock < (SELECT Category.RestockLevel
																	FROM Category
																	JOIN Product ON Category.ID = Product.CategoryID
																	WHERE Product.ID = StockLevels.ProductID);



