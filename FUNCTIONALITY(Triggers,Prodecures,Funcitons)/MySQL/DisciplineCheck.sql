DELIMITER //
CREATE TRIGGER дисципліни_чек
BEFORE INSERT ON дисципліни
FOR EACH ROW
  BEGIN
    IF (NEW.НомерСеместру) > 10 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'WRONG VALUE';
    END IF;
  END //
DELIMITER ;