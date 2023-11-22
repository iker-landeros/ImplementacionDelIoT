-- Iker Landeros De La O | A01423214
-- 21/11/2023

-- CREATE DATABASE userprueba;
USE userprueba;

CREATE TABLE userprueba(
	id INT AUTO_INCREMENT,
    user VARCHAR(8),
    password VARCHAR(56),
    PRIMARY KEY(id)
);

INSERT INTO userprueba(user,password)
VALUES("Hugo", SHA2("1234",224));

SELECT * from userprueba;
