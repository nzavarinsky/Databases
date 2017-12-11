DELIMITER //

CREATE FUNCTION GetAvg()
    RETURNS int(250)
    BEGIN
        DECLARE average int(250);
        SELECT AVG(ТрудовийСтаж) INTO average from Співробітники;
        RETURN average;
    END //

DELIMITER ;

SELECT Прізвище, Імя, Побатькові, ТрудовийСтаж, ПІБ from Співробітники WHERE ТрудовийСтаж > GetAvg();