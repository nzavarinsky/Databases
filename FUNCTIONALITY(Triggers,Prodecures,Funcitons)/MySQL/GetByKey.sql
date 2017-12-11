DELIMITER //


CREATE FUNCTION getDiscipliceCodeName(_Код INT)
  RETURNS VARCHAR(100)
  BEGIN
    DECLARE _Назва VARCHAR(100);
    SELECT Назва INTO _Назва FROM дисципліни WHERE Код = _Код;

    RETURN _Назва;
  END//
DELIMITER ;


SELECT Назва, Код, НомерСеместру,getDiscipliceCodeName(2) AS job_level from Дисципліни;