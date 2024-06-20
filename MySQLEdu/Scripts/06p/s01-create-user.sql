use uni_db;


-- CREATE USER

CREATE USER 'schedule_reader'@'localhost' IDENTIFIED BY '123456Aa@';

SHOW GRANTS FOR 'schedule_reader'@'localhost';

GRANT SELECT ON schedules TO 'schedule_reader'@'localhost';



-- CREATE USER reader_user
CREATE USER 'reader_user'@'localhost' IDENTIFIED BY '123456Aa@';


