DELIMITER //
DROP PROCEDURE IF EXISTS InsertSpivrobitnyku//

CREATE PROCEDURE InsertSpivrobitnyku(
  IN _Прізвище VARCHAR(100),
  IN _Імя varchar(45),
  IN _Побатькові VARCHAR(45),
  IN _ТрудовийСтаж TINYINT(4),
  IN _РікНародження TINYINT(4),
  IN _СеріяТаНомерПаспорту VARCHAR(150),
  IN _ПІБ VARCHAR(100)
)
  BEGIN
    INSERT INTO співробітники (Прізвище, Імя, Побатькові, ТрудовийСтаж, РікНародження, СеріятТаНомерПаспорту, ПІБ)
    VALUES (_Прізвище, _Імя, _Побатькові, _ТрудовийСтаж, _РікНародження, _СеріяТаНомерПаспорту, _ПІБ);
  END //
execute InsertSpivrobitnyku('q','q','q',1,2,'q','q');
DELIMITER ;