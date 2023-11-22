-- Para aprender a hacer funciones login

-- Cifrado de 56 caracteres
SELECT SHA2("1234",224);

-- Saber que el cifrado es de longitud 56
SELECT length(SHA2("1234",224));

-- Debemos crear password como un VARCHAR(56)

-- INSERT INTO usuario(user, password)
-- VALUES("?", SHA2(?,224));

