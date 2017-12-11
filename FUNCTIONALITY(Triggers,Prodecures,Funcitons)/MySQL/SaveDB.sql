DELIMITER //
CREATE TRIGGER save_db_structure1
BEFORE INSERT ON Співробітники
FOR EACH ROW
  BEGIN
    INSERT INTO співробітники(імя) VALUES ('Db structure is failed');
  END//
  DELIMITER ;