CREATE DATABASE VendiCose;

USE VendiCose;

CREATE TABLE WAREHOUSES (
	WarehouseID INT AUTO_INCREMENT Primary Key,
	Name varchar (20),
	Location varchar (20),
	Email varchar (45),
	PhoneNo varchar (15)
    );
    
CREATE TABLE Category (
		 CategoryID INT PRIMARY KEY,
         CategoryName varchar (20),
         RestockLevel INT,
         Description TEXT
);

CREATE TABLE PRODUCT (
	ProductID VARCHAR(6) PRIMARY KEY,
    Name Varchar (45) NOT NULL,
    CategoryID INT,
    Description TEXT,
    MaxUnitSalesPrice DECIMAL(10,2),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
    );
    
  
CREATE TABLE STOCKLEVEL (
    ProductID VARCHAR(7) NOT NULL,
    WarehouseID INT,
    Stock INT NOT NULL CHECK (Stock >= 0),
    RestockLevel INT,
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY (ProductID, WarehouseID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

CREATE TABLE STORES (
	StoreID VARCHAR (7) PRIMARY KEY,
    WarehouseID INT,
    StoreName VARCHAR(25) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    ManagerName VARCHAR(255),
    ContactNumber VARCHAR(20),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

CREATE TABLE SALES (
	StoreID VARCHAR (7),
    SalesID INT,
    LineID INT,
    ProductID VARCHAR(6),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    UnitPrice DECIMAL(10,2) NOT NULL,
    TotalPrice DECIMAL(10,2) GENERATED ALWAYS AS (Quantity * UnitPrice) STORED,
    SaleDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PaymentMethod ENUM('Cash', 'Credit Card', 'Debit Card', 'Online') NOT NULL,
    PRIMARY KEY (SalesID, LineID),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
    );

INSERT INTO Warehouses (Name, Location, Email, PhoneNo) 
	VALUES
('Magazzino Nord', 'Milano', 'nord@warehouse.it', '0245678910'),
('Magazzino Sud', 'Napoli', 'sud@warehouse.it', '0815678910'),
('Magazzino Centro', 'Roma', 'centro@warehouse.it', '0645678910'),
('Magazzino Est', 'Venezia', 'est@warehouse.it', '0415678910'),
('Magazzino Ovest', 'Torino', 'ovest@warehouse.it', '0115678910'),
('Magazzino Sicilia', 'Palermo', 'sicilia@warehouse.it', '0915678910'),
('Magazzino Sardegna', 'Cagliari', 'sardegna@warehouse.it', '0705678910');

INSERT INTO Category (CategoryID, CategoryName, RestockLevel, Description) 
	VALUES
(1, 'Elettronica', 150, 'Dispositivi elettronici vari'),
(2, 'Abbigliamento', 185, 'Vestiti e accessori'),
(3, 'Alimentari', 250, 'Prodotti alimentari'),
(4, 'Giocattoli', 214, 'Giochi per bambini'),
(5, 'Mobili', 65, 'Mobili e arredamento'),
(6, 'Libri', 60, 'Libri di vari generi'),
(7, 'Sport', 140, 'Articoli sportivi'),
(8, 'Bellezza', 200, 'Prodotti per la cura della persona'),
(9, 'Automotive', 15, 'Ricambi e accessori auto'),
(10, 'Casa', 65, 'Articoli per la casa'),
(11, 'Musica', 98, 'Strumenti musicali e accessori'),
(12, 'Gioielli', 74, 'Gioielli e orologi'),
(13, 'Ufficio', 32,'Forniture per ufficio'),
(14, 'Farmacia', 210, 'Prodotti farmaceutici'),
(15, 'Giardinaggio', 65,'Articoli per il giardinaggio');

INSERT INTO PRODUCT (ProductID, Name, CategoryID, Description, MaxUnitSalesPrice) 
	VALUES
('A1X3Y9', 'Laptop HP', 1, 'Laptop HP Pavilion 15', 899.99),
('B7Z2W5', 'Samsung Galaxy S21', 1, 'Smartphone Samsung con 128GB', 281.50),
('C3K9M4', 'Monitor Dell 27"', 1, 'Monitor da 27 pollici full HD', 299.99),
('D5P8Q2', 'Stampante Epson', 1, 'Stampante multifunzione', 149.99),
('E9T1V6', 'Mouse Logitech', 1, 'Mouse wireless ergonomico', 39.99),
('F4R7L8', 'Tastiera meccanica', 1, 'Tastiera gaming retroilluminata', 89.99),
('G6N3X1', 'Hard Disk 1TB', 1, 'Hard disk esterno 1TB', 79.99),
('H2B5C7', 'SSD 500GB', 1, 'Unità SSD ad alta velocità', 99.99),
('J8M4T2', 'Router TP-Link', 1, 'Router dual-band con WiFi 6', 129.99),
('K1X9Y5', 'Cuffie Sony', 1, 'Cuffie wireless con riduzione del rumore', 199.99),
('L7Z2W8', 'Altoparlante JBL', 1, 'Cassa Bluetooth portatile', 99.50),
('M3K6N1', 'Smartwatch Garmin', 1, 'Orologio sportivo GPS', 249.99),
('N5P2Q9', 'Tablet Apple iPad', 1, 'Tablet Apple con 10.2 pollici', 349.99),
('P9T3V6', 'Caricabatterie rapido', 1, 'Caricatore USB-C da 30W', 29.99),
('Q4R8L2', 'Power Bank 20000mAh', 1, 'Batteria portatile USB-C', 49.99),
('X2A7P5', 'Smart TV Samsung 50"', 1, 'Smart TV UHD 4K con HDR', 599.99),
('Y5B3M8', 'Frigorifero LG', 1, 'Frigorifero combinato con tecnologia No Frost', 799.99),
('Z9C1L4', 'Lavatrice Bosch', 1, 'Lavatrice 9kg classe A+++', 499.99),
('W3D7T2', 'Aspirapolvere Dyson', 1, 'Aspirapolvere senza fili con filtro HEPA', 449.99),
('V6E9K1', 'Macchina caffè DeLonghi', 1, 'Macchina per caffè espresso con cappuccinatore', 179.99),
('U4F2N8', 'Forno a microonde Whirlpool', 1, 'Microonde con grill e funzione crisp', 129.99),
('T1G5X7', 'Lavastoviglie Siemens', 1, 'Lavastoviglie integrata a basso consumo', 699.99),
('S7H3P9', 'Climatizzatore Daikin', 1, 'Condizionatore inverter con pompa di calore', 1379.99),
('R2J8V6', 'Smartphone Xiaomi', 1, 'Smartphone 5G con display AMOLED', 499.99),
('Q9K5M1', 'Scheda video RTX 4060', 1, 'Scheda grafica gaming con 12GB GDDR6', 549.99),
('P3L7C8', 'Console PlayStation 5', 1, 'Console di ultima generazione con 1TB SSD', 599.99),
('N6M2X9', 'Controller Xbox', 1, 'Gamepad wireless compatibile con PC e Xbox', 59.99),
('M8T4Y1', 'Router Netgear', 1, 'Router WiFi 6E per gaming e streaming', 249.99),
('L5W9K3', 'Set di pentole Tefal', 1, 'Batteria di pentole antiaderenti', 89.99),
('K1Z7N5', 'Stampante 3D Creality', 1, 'Stampante 3D per stampa di precisione', 379.99),
('A1B2C3', 'T-shirt uomo', 2, 'T-shirt in cotone per uomo', 20.99),
('D4E5F6', 'Jeans donna', 2, 'Jeans slim fit per donna', 45.99),
('G7H8I9', 'Giacca uomo', 2, 'Giacca invernale uomo', 120.00),
('J1K2L3', 'Orecchini d\'oro', 12, 'Orecchini in oro 18k', 150.00),
('M4N5O6', 'Bracciale argento', 12, 'Bracciale in argento con pietre preziose', 95.50),
('P7Q8R9', 'Anello diamante', 12, 'Anello con diamante', 450.00),
('S1T2U3', 'Bicchiere vetro', 10, 'Bicchiere di vetro per acqua', 5.00),
('V4W5X6', 'Coperchio pentola', 10, 'Coperchio in vetro per pentola', 15.00),
('Y7Z8A9', 'Tappeto soggiorno', 10, 'Tappeto per soggiorno', 80.00),
('B1C2D3', 'Pasta integrale', 3, 'Pasta integrale di grano duro', 2.50),
('E4F5G6', 'Riso basmati', 3, 'Riso basmati per piatti orientali', 4.20),
('H7I8J9', 'Olio d\'oliva', 3, 'Olio extra vergine d\'oliva', 8.90),
('K1L2M3', 'Pupazzo di neve', 4, 'Pupazzo di neve di peluche', 12.99),
('N4O5P6', 'Macchina per il caffè', 4, 'Macchina per il caffè espresso', 99.00),
('Q7R8S9', 'Giocattolo interattivo', 4, 'Giocattolo elettronico interattivo', 25.50),
('T1U2V3', 'Sedia da ufficio', 13, 'Sedia ergonomica per ufficio', 150.00),
('W4X5Y6', 'Laptop da lavoro', 13, 'Laptop per lavoro con 16GB di RAM', 850.00),
('Z7A8B9', 'Stampante laser', 13, 'Stampante laser per ufficio', 120.00),
('C1D2E3', 'Cassetta per attrezzi', 5, 'Cassetta porta attrezzi in plastica', 30.00),
('F4G5H6', 'Divano moderno', 5, 'Divano in tessuto per soggiorno', 450.00),
('I7J8K9', 'Libreria in legno', 5, 'Libreria in legno massello', 250.00),
('L1M2N3', 'Racchetta tennis', 7, 'Racchetta da tennis professionale', 70.00),
('O4P5Q6', 'Pallone calcio', 7, 'Pallone da calcio professionale', 25.00),
('R7S8T9', 'Zaino da trekking', 7, 'Zaino resistente per escursioni', 45.00),
('U1V2W3', 'Crema viso', 8, 'Crema idratante per il viso', 18.00),
('X4Y5Z6', 'Shampoo anticaduta', 8, 'Shampoo per capelli deboli', 12.50),
('A7B8C9', 'Profumo uomo', 8, 'Profumo maschile di alta qualità', 50.00),
('D1E2F3', 'Sedia da giardino', 15, 'Sedia in ferro per giardino', 40.00),
('G4H5I6', 'Vaso da fiori', 15, 'Vaso grande in ceramica per piante', 20.00),
('J7K8L9', 'Cesoia da potatura', 15, 'Cesoia professionale per potatura', 35.00),
('M1N2O3', 'Lubrificante motore', 9, 'Lubrificante per motore auto', 25.00),
('P4Q5R6', 'Filtro aria auto', 9, 'Filtro aria per auto', 15.00),
('S7T8U9', 'Catene neve', 9, 'Catene da neve per pneumatici auto', 45.00),
('V1W2X3', 'Libro di cucina', 6, 'Libro di cucina italiana', 25.00),
('Y4Z5A6', 'Romanzo thriller', 6, 'Romanzo thriller da leggere', 18.00),
('B7C8D9', 'Manuale di fotografia', 6, 'Guida alla fotografia digitale', 30.00),
('E1F2G3', 'Piumino invernale', 2, 'Piumino per inverno uomo', 120.00),
('H4I5J6', 'T-shirt colorata', 2, 'T-shirt uomo in diverse varianti di colore', 18.50),
('K7L8M9', 'Borsa da viaggio', 2, 'Borsa da viaggio in pelle', 85.00),
('N1O2P3', 'Cuffie Bluetooth', 7, 'Cuffie Bluetooth per sport e tempo libero', 40.00),
('Q4R5S6', 'Scarpe da ginnastica', 7, 'Scarpe da ginnastica leggere per corsa', 60.00),
('T7U8V9', 'Bicicletta da corsa', 7, 'Bicicletta da corsa professionale', 350.00),
('W1X2Y3', 'Contenitore plastica', 10, 'Contenitore in plastica per alimenti', 4.99),
('Z4A5B6', 'Set di piatti', 10, 'Set di piatti in ceramica per 6 persone', 35.00),
('C7D8E9', 'Set di posate', 10, 'Set di posate in acciaio inox', 40.00),
('F1G2H3', 'Trattamento viso', 8, 'Trattamento anti-invecchiamento per viso', 55.00),
('I4J5K6', 'Crema per mani', 8, 'Crema nutriente per mani secche', 10.00),
('L7M8N9', 'Gel per capelli', 8, 'Gel modellante per capelli', 7.00),
('O1P2Q3', 'Sedia da scrivania', 13, 'Sedia ergonomica da scrivania', 100.00),
('R4S5T6', 'Calendario da muro', 13, 'Calendario da muro per ufficio', 12.00);
    
    
INSERT INTO STORES (StoreID, WarehouseID, StoreName, Location, ManagerName, ContactNumber) 
	VALUES
('ST1542', 7, 'Tech Store Milano', 'Milano, Via Torino 12', 'Marco Rossi', '+39 02 1234567'),
('ST2584', 7, 'Casa & Elettrodomestici', 'Milano, Corso Buenos Aires 45', 'Laura Bianchi', '+39 02 9876543'),
('ST8574', 6, 'Digital World Roma', 'Roma, Via del Corso 33', 'Giovanni Verdi', '+39 06 2222333'),
('ST1584', 6, 'Elettronica Centrale', 'Roma, Piazza Venezia 5', 'Francesca Neri', '+39 06 4444555'),
('ST1526', 5, 'MegaTech Napoli', 'Napoli, Via Toledo 99', 'Antonio Esposito', '+39 081 1111222'),
('ST7251', 5, 'Home & Digital', 'Napoli, Corso Umberto I 25', 'Elisa De Luca', '+39 081 5555666'),
('ST9024', 4, 'FuturElettronica Firenze', 'Firenze, Via de Tornabuoni 18', 'Paolo Ricci', '+39 055 7777888'),
('ST4433', 4, 'ElettroPoint Firenze', 'Firenze, Piazza della Repubblica 7', 'Anna Conti', '+39 055 3333444'),
('ST9800', 3, 'Tech Planet Torino', 'Torino, Via Roma 120', 'Luca Martini', '+39 011 6666777'),
('ST3931', 3, 'Domus Elettronica', 'Torino, Corso Vittorio Emanuele 99', 'Giulia Ferri', '+39 011 2222333'),
('ST4121', 3, 'Elettronica Nord Bologna', 'Bologna, Via Indipendenza 55', 'Matteo Galli', '+39 051 9999000'),
('ST7878', 3, 'Best Tech Bologna', 'Bologna, Piazza Maggiore 3', 'Sara Romano', '+39 051 8888777'),
('ST1499', 4, 'SmartStore Palermo', 'Palermo, Via Libertà 88', 'Davide Greco', '+39 091 4444333'),
('ST0518', 4, 'ElettroHouse Palermo', 'Palermo, Corso Calatafimi 102', 'Martina Russo', '+39 091 1111222'),
('ST3474', 1, 'Top Elettro Venezia', 'Venezia, Campo San Polo 17', 'Federico Moretti', '+39 041 6666777'),
('ST2005', 2, 'Hi-Tech Venezia', 'Venezia, Strada Nova 46', 'Valentina Sartori', '+39 041 8888999'),
('ST9747', 2, 'ElettroCity Genova', 'Genova, Via Garibaldi 21', 'Roberto De Santis', '+39 010 7777888'),
('ST8500', 5, 'DigitalHome Genova', 'Genova, Corso Italia 78', 'Alessia Bruno', '+39 010 9999000'),
('ST2140', 7, 'SuperStore Bari', 'Bari, Via Sparano 14', 'Pietro Romano', '+39 080 3333444'),
('ST4178', 2, 'CasaDigitale Bari', 'Bari, Corso Cavour 62', 'Elena Gatti', '+39 080 2222111');

SELECT * FROM WAREHOUSES;
 
INSERT INTO SALES (StoreID, SalesID, LineID, ProductID, Quantity, UnitPrice, PaymentMethod) 
VALUES
('ST1542', 25489, 15686, 'A1X3Y9', 2, 899.99, 'Credit Card'),
('ST2584', 25490, 15687, 'B7Z2W5', 1, 281.50, 'Debit Card'),
('ST8574', 25491, 15688, 'C3K9M4', 3, 299.99, 'Cash'),
('ST1584', 25492, 15689, 'D5P8Q2', 1, 149.99, 'Online'),
('ST1526', 25493, 15690, 'E9T1V6', 5, 39.99, 'Debit Card'),
('ST7251', 25494, 15691, 'F4R7L8', 2, 89.99, 'Credit Card'),
('ST9024', 25495, 15692, 'G6N3X1', 4, 79.99, 'Cash'),
('ST4433', 25496, 15693, 'H2B5C7', 1, 99.99, 'Credit Card'),
('ST9800', 25497, 15694, 'J8M4T2', 2, 129.99, 'Online'),
('ST3931', 25498, 15695, 'K1X9Y5', 3, 199.99, 'Debit Card'),
('ST4121', 25499, 15696, 'L7Z2W8', 1, 99.50, 'Credit Card'),
('ST7878', 25500, 15697, 'M3K6N1', 1, 249.99, 'Cash'),
('ST1499', 25501, 15698, 'N5P2Q9', 2, 349.99, 'Debit Card'),
('ST0518', 25502, 15699, 'P9T3V6', 1, 29.99, 'Online'),
('ST3474', 25503, 15700, 'Q4R8L2', 3, 49.99, 'Credit Card'),
('ST2005', 25504, 15701, 'X2A7P5', 1, 599.99, 'Cash'),
('ST9747', 25505, 15702, 'Y5B3M8', 1, 799.99, 'Debit Card'),
('ST8500', 25506, 15703, 'Z9C1L4', 2, 499.99, 'Credit Card'),
('ST2140', 25507, 15704, 'W3D7T2', 1, 449.99, 'Online'),
('ST4178', 25508, 15705, 'V6E9K1', 2, 179.99, 'Debit Card'),
('ST1542', 25509, 15706, 'U4F2N8', 3, 129.99, 'Cash'),
('ST2584', 25510, 15707, 'T1G5X7', 1, 699.99, 'Credit Card'),
('ST8574', 25511, 15708, 'S7H3P9', 2, 1379.99, 'Online'),
('ST1584', 25512, 15709, 'R2J8V6', 3, 499.99, 'Debit Card'),
('ST1526', 25513, 15710, 'Q9K5M1', 2, 549.99, 'Cash'),
('ST7251', 25514, 15711, 'P3L7C8', 1, 599.99, 'Credit Card'),
('ST9024', 25515, 15712, 'N6M2X9', 2, 59.99, 'Online'),
('ST4433', 25516, 15713, 'M8T4Y1', 1, 249.99, 'Debit Card'),
('ST9800', 25517, 15714, 'L5W9K3', 3, 89.99, 'Cash'),
('ST3931', 25518, 15715, 'K1Z7N5', 2, 379.99, 'Credit Card'),
('ST4121', 25519, 15716, 'A1B2C3', 4, 20.99, 'Online'),
('ST7878', 25520, 15717, 'D4E5F6', 3, 45.99, 'Debit Card'),
('ST1499', 25521, 15718, 'G7H8I9', 5, 120.00, 'Credit Card'),
('ST0518', 25522, 15719, 'J1K2L3', 1, 150.00, 'Cash'),
('ST3474', 25523, 15720, 'M4N5O6', 3, 95.50, 'Online'),
('ST2005', 25524, 15721, 'P7Q8R9', 2, 450.00, 'Debit Card'),
('ST9747', 25525, 15722, 'S1T2U3', 4, 5.00, 'Credit Card'),
('ST8500', 25526, 15723, 'V4W5X6', 1, 15.00, 'Online'),
('ST2140', 25527, 15724, 'Y7Z8A9', 2, 80.00, 'Cash'),
('ST4178', 25528, 15725, 'B1C2D3', 5, 2.50, 'Debit Card'),
('ST1542', 25529, 15726, 'E4F5G6', 3, 4.20, 'Credit Card'),
('ST2584', 25530, 15727, 'H7I8J9', 4, 8.90, 'Online'),
('ST8574', 25531, 15728, 'K1L2M3', 1, 12.99, 'Debit Card'),
('ST1584', 25532, 15729, 'N4O5P6', 3, 99.00, 'Cash'),
('ST1526', 25533, 15730, 'Q7R8S9', 2, 25.50, 'Online'),
('ST7251', 25534, 15731, 'T1U2V3', 3, 150.00, 'Debit Card'),
('ST9024', 25535, 15732, 'W4X5Y6', 2, 850.00, 'Credit Card'),
('ST4433', 25536, 15733, 'Z7A8B9', 1, 120.00, 'Cash'),
('ST9800', 25537, 15734, 'C1D2E3', 2, 30.00, 'Debit Card'),
('ST3931', 25538, 15735, 'F4G5H6', 3, 450.00, 'Online'),
('ST4121', 25539, 15736, 'I7J8K9', 2, 250.00, 'Credit Card'),
('ST7878', 25540, 15737, 'L1M2N3', 5, 70.00, 'Debit Card'),
('ST1499', 25541, 15738, 'O4P5Q6', 2, 25.00, 'Online'),
('ST0518', 25542, 15739, 'R7S8T9', 3, 45.00, 'Cash'),
('ST3474', 25543, 15740, 'U1V2W3', 4, 18.00, 'Credit Card'),
('ST2005', 25544, 15741, 'X4Y5Z6', 1, 12.50, 'Debit Card'),
('ST9747', 25545, 15742, 'A7B8C9', 3, 50.00, 'Online'),
('ST8500', 25546, 15743, 'D1E2F3', 2, 40.00, 'Cash'),
('ST2140', 25547, 15744, 'G4H5I6', 1, 20.00, 'Credit Card'),
('ST4178', 25548, 15745, 'J7K8L9', 2, 35.00, 'Debit Card'),
('ST2584', 25550, 15747, 'P4Q5R6', 4, 15.00, 'Cash');

SELECT * FROM WAREHOUSES;

INSERT INTO STOCKLEVEL (ProductID, WarehouseID, Stock, RestockLevel)
VALUES
('A1X3Y9', 7, 50, 2),  -- Laptop HP nel Magazzino 8
('B7Z2W5', 6, 30, 1),  -- Samsung Galaxy S21 nel Magazzino 9
('C3K9M4', 5, 20, 2), -- Monitor Dell 27" nel Magazzino 10
('D5P8Q2', 4, 15, 2), -- Stampante Epson nel Magazzino 11
('E9T1V6', 2, 40, 5), -- Mouse Logitech nel Magazzino 12
('F4R7L8', 3, 25, 2), -- Tastiera meccanica nel Magazzino 13
('G6N3X1', 4, 35, 2), -- Hard Disk 1TB nel Magazzino 14
('H2B5C7', 7, 10, 2),  -- SSD 500GB nel Magazzino 8
('J8M4T2', 2, 5, 3),   -- Router TP-Link nel Magazzino 9
('K1X9Y5', 1, 22, 6), -- Cuffie Sony nel Magazzino 10
('L7Z2W8', 1, 18, 9), -- Altoparlante JBL nel Magazzino 11
('M3K6N1', 2, 12, 6), -- Smartwatch Garmin nel Magazzino 12
('N5P2Q9', 3, 9, 2),  -- Tablet Apple iPad nel Magazzino 13
('P9T3V6', 4, 7, 15),  -- Caricabatterie rapido nel Magazzino 14
('Q4R8L2', 5, 16, 5),  -- Power Bank 20000mAh nel Magazzino 8
('X2A7P5', 6, 14, 2),  -- Smart TV Samsung 50" nel Magazzino 9
('Y5B3M8', 7, 6, 1),  -- Frigorifero LG nel Magazzino 10
('Z9C1L4', 1, 11, 1), -- Lavatrice Bosch nel Magazzino 11
('W3D7T2', 2, 8, 1),  -- Aspirapolvere Dyson nel Magazzino 12
('V6E9K1', 3, 20, 2), -- Macchina caffè DeLonghi nel Magazzino 13
('U4F2N8', 4, 5, 1),  -- Forno a microonde Whirlpool nel Magazzino 14
('T1G5X7', 5, 13, 1),  -- Lavastoviglie Siemens nel Magazzino 8
('S7H3P9', 6, 4, 1),   -- Climatizzatore Daikin nel Magazzino 9
('R2J8V6', 1, 7, 3),  -- Smartphone Xiaomi nel Magazzino 10
('Q9K5M1', 1, 9, 6),  -- Scheda video RTX 4060 nel Magazzino 11
('P3L7C8', 2, 10, 6), -- Console PlayStation 5 nel Magazzino 12
('N6M2X9', 3, 6, 8),  -- Controller Xbox nel Magazzino 13
('M8T4Y1', 4, 15, 5), -- Router Netgear nel Magazzino 14
('L5W9K3', 5, 20, 6),  -- Set di pentole Tefal nel Magazzino 8
('K1Z7N5', 6, 8, 2),   -- Stampante 3D Creality nel Magazzino 9
('A1B2C3', 1, 50, 15), -- T-shirt uomo nel Magazzino 10
('D4E5F6', 1, 40, 16), -- Jeans donna nel Magazzino 11
('G7H8I9', 2, 30, 12), -- Giacca uomo nel Magazzino 12
('J1K2L3', 3, 25, 23), -- Orecchini d'oro nel Magazzino 13
('M4N5O6', 4, 15, 22), -- Bracciale argento nel Magazzino 14
('P7Q8R9', 7, 5, 6),   -- Anello diamante nel Magazzino 8
('S1T2U3', 6, 100, 6), -- Bicchiere vetro nel Magazzino 9
('V4W5X6', 5, 50, 5), -- Coperchio pentola nel Magazzino 10
('Y7Z8A9', 1, 12, 2), -- Tappeto soggiorno nel Magazzino 11
('B1C2D3', 2, 200, 22),-- Pasta integrale nel Magazzino 12
('E4F5G6', 3, 180, 22),-- Riso basmati nel Magazzino 13
('H7I8J9', 4, 90, 20), -- Olio d'oliva nel Magazzino 14
('K1L2M3', 7, 20, 1),  -- Pupazzo di neve nel Magazzino 8
('N4O5P6', 6, 15, 2),  -- Macchina per il caffè nel Magazzino 9
('Q7R8S9', 1, 25, 2), -- Giocattolo interattivo nel Magazzino 10
('T1U2V3', 1, 30, 2), -- Sedia da ufficio nel Magazzino 11
('W4X5Y6', 2, 10, 3), -- Laptop da lavoro nel Magazzino 12
('Z7A8B9', 3, 12, 1), -- Stampante laser nel Magazzino 13
('C1D2E3', 4, 40, 2), -- Cassetta per attrezzi nel Magazzino 14
('F4G5H6', 5, 8, 1);   -- Divano moderno nel Magazzino 8


DELIMITER //
CREATE TRIGGER before_insert_sales
BEFORE INSERT ON SALES
FOR EACH ROW
BEGIN
    IF NEW.LineID IS NULL THEN
        SET NEW.LineID = (SELECT COALESCE(MAX(LineID), 15685) + 1 FROM SALES);
    END IF;
END;
//
DELIMITER ;

ALTER TABLE `vendicose`.`sales` 
CHANGE COLUMN `SalesID` `SalesID` INT NOT NULL ,
CHANGE COLUMN `LineID` `LineID` INT NOT NULL ,
ADD UNIQUE INDEX `SalesID_UNIQUE` (`SalesID` ASC) VISIBLE
;


ALTER TABLE `vendicose`.`sales` 
CHANGE COLUMN `SalesID` `SalesID` INT AUTO_INCREMENT NOT NULL
;


-- Ogni qual volta un prodotto viene venduto in un negozio, qual è la query da eseguire per aggiornare le tabelle di riferimento?

SELECT *
FROM StockLevel JOIN Warehouses ON StockLevel.WarehouseID = Warehouses.WarehouseID
JOIN Stores ON Stores.WarehouseID = Warehouses.WarehouseID
WHERE Stores.StoreID = 'ST2140';

-- viene effetuata la vendita 25552 nello store ST2140 del prodotto Pupazzo di neve(K1L2M3)
INSERT INTO SALES (StoreID, ProductID, Quantity, UnitPrice, PaymentMethod) 
	VALUES
		('ST2140', 'K1L2M3', 3, 12.99, 'Credit Card');
        
DELETE FROM SALES  
	WHERE StoreID = 'ST2140'  
		AND ProductID = 'E4F5G6'  
			AND Quantity = 3  
				AND UnitPrice = 12.99  
					AND PaymentMethod = 'Credit Card'  
	ORDER BY SalesID DESC  
	LIMIT 1;

        
SELECT * FROM SALES;
SELECT * FROM STOCKLEVEL WHERE ProductID = 'K1L2M3';

  -- Aggiornamento con una sola query per mezzo di un id vendita e di un store id
START TRANSACTION;
UPDATE STOCKLEVEL
SET STock = Stock - (SELECT Quantity FROM Sales WHERE Sales.SalesID = 25552 AND Sales.ProductID = StockLevel.ProductID)
WHERE ProductID IN 
(SELECT ProductID FROM Sales WHERE Sales.SalesID = 25552) AND WarehouseID = (SELECT WarehouseID	FROM Stores WHERE StoreID = 'ST2140'); 

 -- Aggiornamento con una sola query per mezzo di un id vendita
UPDATE StockLevel
SET Stock = Stock - (SELECT Quantity FROM Sales WHERE Sales.SalesID = 25552 AND Sales.ProductID = StockLevel.ProductID)
WHERE ProductID IN (SELECT ProductID FROM Sales WHERE Sales.SalesID = 25552) 
AND WarehouseID = (	SELECT Warehouses.WarehouseID FROM Warehouses 
					JOIN Stores ON Warehouses.WarehouseID = Stores.WarehouseID
					JOIN Sales ON Stores.StoreID = Sales.StoreID
					WHERE Sales.SalesID = 25552 LIMIT 1);
                    
SELECT *
FROM StockLevel JOIN Warehouses ON StockLevel.WarehouseID = Warehouses.WarehouseID
JOIN Stores ON Stores.WarehouseID = Warehouses.WarehouseID
WHERE Stores.StoreID = 'ST2140';

UPDATE STOCKLEVEL
JOIN warehouses ON Stocklevel.warehouseID = warehouses.warehouseid
		JOIN Stores ON warehouses.warehouseid = stores.WarehouseID
			 JOIN sales ON sales.storeID = stores.storeid
SET stocklevel.Stock = stocklevel.Stock - sales.quantity
WHERE Stocklevel.ProductID IN (SELECT ProductID FROM SALES WHERE SalesID = '25552')
	AND Warehouses.WarehouseID  = (SELECT WarehouseID 
				FROM STORES 
					WHERE StoreID = 'ST2140'
                    LIMIT 1);
                    
 
  -- Aggiornamento dello stock con una sola query per mezzo dell'id vendita 14
UPDATE StockLevel
SET Stock = Stock - (SELECT Quantity FROM Sales WHERE Sales.SalesID = 25552 AND Sales.ProductID = StockLevel.ProductID)
WHERE ProductID IN (SELECT ProductID FROM Sales WHERE Sales.SalesID = 25552) 
AND WarehouseID = (	SELECT Warehouses.WarehouseID FROM Warehouses 
					JOIN Stores ON Warehouses.WarehouseID = Stores.WarehouseID
					JOIN Sales ON Stores.StoreID = Sales.StoreID
					WHERE Sales.SalesID = 25552 LIMIT 1);

SELECT Stock FROM Stocklevel WHERE ProductID = 'N6M2X9';

SELECT * FROM Stocklevel;
-- Quali sono le query da eseguire per verificare quante unità di un prodotto ci sono in un dato magazzino e per monitorare le soglie di restock?

CREATE VIEW ProductsToRestock AS 
SELECT DISTINCT
    Product.ProductID AS ProductID, 
    Product.Name AS Product, 
    Product.CategoryID AS CategoryID, 
    Stores.WarehouseID AS WarehouseID, 
    Stocklevel.Stock AS LowStock, 
    Stocklevel.RestockLevel AS RestockThreshold
FROM Stocklevel
JOIN Product ON Stocklevel.ProductID = Product.ProductID
JOIN Stores ON Stocklevel.WarehouseID = Stores.WarehouseID
LEFT JOIN Sales ON Sales.ProductID = Stocklevel.ProductID AND Sales.StoreID = Stores.StoreID
WHERE Stocklevel.Stock <= Stocklevel.RestockLevel;


SELECT * FROM Stocklevel;

SELECT * FROM ProductsToRestock;

CREATE VIEW RestockNeed AS
SELECT 
    Category.CategoryName AS CategoryName,
    SUM(stocklevel.Stock) AS TotalStockInWarehouses,
    Category.RestockLevel AS RestockLevel,
    (Category.RestockLevel - SUM(StockLevel.Stock)) AS NeedForRestock
FROM 
    Category
JOIN 
    Product ON Category.CategoryID = Product.CategoryID
JOIN 
    StockLevel ON Product.ProductID = StockLevel.ProductID
GROUP BY 
    Category.CategoryID;
    
    SELECT * FROM RestockNeed;
    
    CREATE VIEW Products AS 
SELECT DISTINCT
    Product.ProductID AS ProductID, 
    Product.Name AS Product, 
    Stores.WarehouseID AS WarehouseID, 
    Stocklevel.Stock AS InStock, 
    Stocklevel.RestockLevel AS RestockThreshold
FROM Stocklevel
JOIN Product ON Stocklevel.ProductID = Product.ProductID
JOIN Stores ON Stocklevel.WarehouseID = Stores.WarehouseID;

SELECT * FROM Products;

DROP VIEW Products;

   -- Verificare 
   UPDATE STOCKLEVEL
SET Stock = Stock - (
    SELECT SUM(Quantity) FROM Sales 
    WHERE Sales.SalesID IN (25555, 25554) 
    AND Sales.ProductID = StockLevel.ProductID
)
WHERE ProductID IN (
    SELECT ProductID FROM Sales WHERE Sales.SalesID IN (25555, 25554)
) 
AND WarehouseID = (
    SELECT WarehouseID FROM Stores WHERE StoreID = 'ST2140'
);

   INSERT INTO SALES (StoreID, ProductID, Quantity, UnitPrice, PaymentMethod) 
	VALUES
		('ST2140', 'K1L2M3', 6, 12.99, 'Credit Card'),
        ('ST2584', 'K1L2M3', 2, 12.99, 'Cash');

DELIMITER //								 	-- Serve a modificare temporaneamente il simbolo che indica il termine di un comando, così che SQL non interpreti ; come la fine del comando ma usi //
CREATE TRIGGER update_stock_after_insert 		-- Definiamo un trigger con un nome
AFTER INSERT ON Sales 							-- Il trigger si attiverà ogni volta che viene effettuata una insert nella tabella Sales
FOR EACH ROW 									-- Il trigger verrà eseguito per ogni riga inserita nella tabella Sales
BEGIN											-- Identifica l'inizio del blocco di istruzioni
	UPDATE StockLevel							-- Update utilizzato per diminuire lo stock
    SET Stock = Stock - NEW.Quantity			-- NEW.Quantity identifica la quantità appena inserita nella tabella Sales nella riga per cui si è stato attivato il trigger
    WHERE ProductID = NEW.ProductID				-- NEW.ProductID identifica l'ID del prodotto appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
    AND WarehouseID = (							
		SELECT Warehouses.WarehouseID					-- Subquery per recuperare il magazzino correlato allo store che è stato inserito nella vendita
        FROM Warehouses
        JOIN Stores ON Warehouses.warehouseID = Stores.WarehouseID
        WHERE Stores.StoreID = NEW.StoreID			-- NEW.StoreID identifica l'ID dello store appena inserito nella tabella Sales nella riga per cui si è attivato il trigger
	);
END;											-- Fine del blocco di istruzioni
//												-- Delimitatore di fine comando temporaneo impostato prima
DELIMITER ; -- Ripristina il delimitatore di fine comando a ;

SELECT * FROM StockLevel;


INSERT INTO SALES (StoreID, ProductID, Quantity, UnitPrice, PaymentMethod) 
	VALUES
		('ST2005', 'N6M2X9', 2, 59.99, 'Credit Card');
     
   