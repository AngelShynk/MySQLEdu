use metric_db;


DELIMITER //

CREATE FUNCTION GetFirstDateOfQuarter(input_date DATE) RETURNS DATE
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE first_date_of_quarter DATE;

    -- Calculate the first date of the quarter
    SET first_date_of_quarter = CASE
        WHEN MONTH(input_date) IN (1, 2, 3) THEN DATE_FORMAT(input_date, '%Y-01-01')
        WHEN MONTH(input_date) IN (4, 5, 6) THEN DATE_FORMAT(input_date, '%Y-04-01')
        WHEN MONTH(input_date) IN (7, 8, 9) THEN DATE_FORMAT(input_date, '%Y-07-01')
        WHEN MONTH(input_date) IN (10, 11, 12) THEN DATE_FORMAT(input_date, '%Y-10-01')
    END;

    RETURN first_date_of_quarter;
END //

DELIMITER ;


select GetFirstDateOfQuarter('2024-02-01');