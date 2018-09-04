DROP DATABASE IF EXISTS bb_db;
CREATE DATABASE bb_db;
USE bb_db;



 
CREATE TABLE Grain (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    GrainName VARCHAR(40) NOT NULL,
    LoviBond VARCHAR(2.2) NOT NULL
);
  
CREATE TABLE GrainBill (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    BaseGrain INT,
    AdjunctGrain1 INT,
    AdjunctGrain2 INT,
    AdjunctGrain3 INT,
    FOREIGN KEY (BaseGrain)
        REFERENCES Grain (ID),
    FOREIGN KEY (AdjunctGrain1)
        REFERENCES Grain (ID),
    FOREIGN KEY (AdjunctGrain2)
        REFERENCES Grain (ID),
    FOREIGN KEY (AdjunctGrain3)
        REFERENCES Grain (ID)
);
  
CREATE TABLE Hop (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    HopName VARCHAR(10) NOT NULL,
    AlphaAcid VARCHAR(2.2) NOT NULL,
    Flavor VARCHAR(225)
);
  
CREATE TABLE HopProfile (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    FirstWort INT,
    Hop1 INT,
    Hop2 INT,
    Hop3 INT,
    Hop4 INT,
    Dry1 INT,
    Dry2 INT,
    FOREIGN KEY (FirstWort)
        REFERENCES Hop (ID),
    FOREIGN KEY (Hop1)
        REFERENCES Hop (ID),
    FOREIGN KEY (Hop2)
        REFERENCES Hop (ID),
    FOREIGN KEY (Hop3)
        REFERENCES Hop (ID),
    FOREIGN KEY (Hop4)
        REFERENCES Hop (ID),
    FOREIGN KEY (Dry1)
        REFERENCES Hop (ID),
    FOREIGN KEY (Dry2)
        REFERENCES Hop (ID)
);


CREATE TABLE Yeast (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    YeastName VARCHAR(25) NOT NULL,
    Style VARCHAR(12) NOT NULL,
    Attenuation VARCHAR(4) NOT NULL,
    Floculation VARCHAR(4) NOT NULL,
    CellDesity VARCHAR(25) NOT NULL,
    AlcoholVol VARCHAR(4) NOT NULL
);

CREATE TABLE ADDITIVE (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    AdditiveID INT,
    Purpose VARCHAR(100)
);

CREATE TABLE MASH (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Duration VARCHAR(2.2) NOT NULL,
    Temperature INT(3.2) NOT NULL,
    StikeTemp INT(3.2) NOT NULL,
    StrikeVolume INT(2.2) NOT NULL,
    SpargeTemp INT(3.2) NOT NULL,
    SpargeVolume INT(2.2) NOT NULL,
    MashOutVolume INT(2.2) NOT NULL,
    MashThickness INT(1.2) NOT NULL
);

CREATE TABLE Boil (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    WortVolume INT(2.2) NOT NULL,
    Duration VARCHAR(2.2) NOT NULL,
    Additions VARCHAR(25) NOT NULL
);

CREATE TABLE FERMENTATION (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    YeastName INT,
    PitchRate INT,
    Attenuation INT,
    Temperature INT,
    OriginalGravity INT,
    FinalGravity INT
);

CREATE TABLE Recipe (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Recipe_Name VARCHAR(100) NOT NULL UNIQUE,
    STYLE VARCHAR(12),
    IBU INT(3.2),
    ABV INT(2.1),
    SRM INT(2.1),
    GrainBill_ID INT,
    HopProfile_ID INT,
    Yeast INT,
    OtherIng INT,
    FOREIGN KEY (GrainBill_ID)
        REFERENCES GrainBill (ID),
    FOREIGN KEY (OtherIng)
        REFERENCES Additive (ID),
    FOREIGN KEY (HopProfile_ID)
        REFERENCES HopProfile (ID),
    FOREIGN KEY (Yeast)
        REFERENCES Yeast (ID)
);

INSERT INTO RECIPE VALUES
(1,'RHINEGIEST TRUTH CLONE','IPA','72.3','7.2','6.54','7','4','2','1'
);

INSERT INTO GRAIN VALUES
(1,'Page 2 Row','30');

INSERT INTO GRAIN_BILL VALUES
(1,'2 ROW PALE MALT','AMERICAN VIENNA','CARA RED','0');

INSERT INTO HOP VALUES 
(1,'Citra','11','Intense citrus flavor');

INSERT INTO HOP_PROFILE VALUES
(1,'FIRSTWORT','HOP1','HOP2','HOP3','HOP4','DRY1','DRY2');

INSERT INTO YEAST VALUES
(1,'Wyeast 1056','American Ale','High','High','1million,gram','High');

INSERT INTO ADDITIVE VALUES
(1,'Yeast Nutrient','Used to promote growth of cell walls in yeast. Add at the last 15 minutes of the boil');

INSERT INTO MASH VALUES
(1,'60','1','2','3','4','5','6','7');

INSERT INTO BOIL VALUES
(1,'7','60','8');

INSERT INTO FERMENTATION VALUES
(1,'Wyeast 1056','1 Billion','High','68','10.58','10.10');




-- create a user and grant privileges to that user
-- GRANT SELECT, INSERT, DELETE, UPDATE
-- ON bank_db

-- IDENTIFIED BY 'sesame';