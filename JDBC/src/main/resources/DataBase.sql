USE db_jbdc;
CREATE TABLE University
(
  NameOfUniver VARCHAR(25) NOT NULL,
  PRIMARY KEY (NameOfUniver)
);

CREATE TABLE  Studik
(
  IDStudika INT NOT NULL AUTO_INCREMENT,
  Surname VARCHAR(25) NOT NULL,
  Name VARCHAR(25) NOT NULL,
  NumOfKomisiy int NOT NULL,
  NameOfUniver VARCHAR(25) NOT NULL,
  Email VARCHAR(45) NULL,
  PRIMARY KEY (IDStudika),
  FOREIGN KEY (NameOfUniver)
  REFERENCES University (NameOfUniver)
);

CREATE TABLE Komisiya
(
  IDKomisiyi INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(45) NOT NULL,
  Student VARCHAR(45) NOT NULL,
  Teacher INT NOT NULL,
  PRIMARY KEY (IDKomisiyi)
);

CREATE TABLE  Vykladach (
  IDStudika INT NOT NULL,
  IDKomisiyi1 INT NOT NULL,
  PRIMARY KEY (IDStudika, IDKomisiyi1),
  FOREIGN KEY (IDStudika)
  REFERENCES  Studik (IDStudika),
  FOREIGN KEY (IDKomisiyi1)
  REFERENCES  Komisiya (IDKomisiyi)
);

  INSERT INTO `Komisiya`  (Name, Student, Teacher) VALUES
('Matan','Chycherskiy',5),
('Bazi dannix','Dyakiv ',4),
('Algoritmi','Andy',1),
('Filosofiya','Pashtet',2);

INSERT INTO `University`(NameOfUniver) VALUES ('Politex'),('Uku'),('Franka'),('Infiz'),('MNS');

INSERT INTO `Studik` (Surname, Name, NumOfKomisiy, NameOfUniver, Email) VALUES
  ('Chycherskiy','Vyacheslav',2,'Politex','koldovsky@gmail.com'),
  ('Melnik','Stanislav',4,'Uku','apavelchak@gmail.com'),
  ('Vit','Roman',1,'Franka','andriansoluk@gmail.com'),
  ('Blyznyik','Andrian',6,'MNS','bohdan.dub@gmail.com');

INSERT INTO `Vykladach` (IDStudika, IDKomisiyi1) VALUES (4,1),(2,1),(1,1),(3,2);


CREATE PROCEDURE InsertVykladach
(
IN SurmanePersonIn varchar(25),
IN BookNameIN varchar(45)
)
BEGIN
	DECLARE msg varchar(40);

  -- checks for present Surname
  IF NOT EXISTS( SELECT * FROM University WHERE Surname=SurmanePersonIn)
  THEN SET msg = 'This Surname is absent';

  -- checks for present Book
	ELSEIF NOT EXISTS( SELECT * FROM Komisiya WHERE Name=BookNameIN)
		THEN SET msg = 'This name is absent';

  -- checks if there are this combination already
	ELSEIF EXISTS( SELECT * FROM Vykladach
		WHERE IDStudika = (SELECT IDStudika FROM Studik WHERE Surname=SurmanePersonIn)
        AND IDKomisiyi = (SELECT IDKomisiyi FROM Komisiya WHERE Name=BookNameIN)
        )
        THEN SET msg = 'This university already has this komisiya';

  -- checks whether there is still such a book
	ELSEIF (SELECT Amount FROM Komisiya WHERE Name=BookNameIN )
    <= (SELECT COUNT(*) FROM Vykladach WHERE IDKomisiyi1=(SELECT IDKomisiyi FROM Komisiya WHERE Name=BookNameIN) )
    THEN SET msg = 'There are no this komisiya already';

    -- makes insert
    ELSE
		INSERT Vykladach (IDStudika, IDKomisiyi1)
        Value ( (SELECT IDStudika FROM Studik WHERE Surname=SurmanePersonIn),
			     (SELECT IDKomisiyi FROM Komisiya WHERE Name=BookNameIN) );
		SET msg = 'OK';

	END IF;

	SELECT msg AS msg;

END

