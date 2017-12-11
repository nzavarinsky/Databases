DELIMITER $$
CREATE PROCEDURE getRandDataToTwoTables1()
  BEGIN
    DECLARE ІмяСпів VARCHAR(100) DEFAULT NULL;
    DECLARE ІмяСпівроб NVARCHAR(50); 
      DECLARE flag INT DEFAULT 0;
      DECLARE counter SMALLINT; 
      DECLARE rand INT ;
    DECLARE sqlCommand VARCHAR(400);
    DECLARE smh VARCHAR(400); 

    DECLARE tCursor CURSOR FOR SELECT Імя FROM співробітники;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET flag = 1;

    OPEN tCursor;
	
    
  
      FETCH tCursor INTO ІмяСпів;
	  SET @counter = (SELECT Round(8*Rand()+1,0));
      SET @sqlCommand = concat('CREATE TABLE',@ІмяСпівроб,'(');
      WHILE @counter >=2
      DO
      BEGIN
      SET @smh = concat('Column',Cast(@counter AS CHAR(1)));
      SET @sqlCommand = concat(@sqlCommand,@smh,'int');
      SET @counter = @counter - 1;
      END;
      
      SET @sqlCommand = concat(@sqlCommand,'Column',Cast(@counter AS CHAR(1)),'int)');


      END WHILE;
		SET @flag = 1;

    CLOSE tCursor;

  END$$

CALL getRandDataToTwoTables1();