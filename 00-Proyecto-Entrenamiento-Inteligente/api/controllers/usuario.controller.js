const pool = require('../helpers/mysql-config');

const getUsuarios = (req, res) => {
    const sql = 'SELECT * FROM usuario';
    pool.query(sql, (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
};

/*const getUsuario = (req, res) => {
    const { id } = req.params;
    const sql = `SELECT * FROM usuario WHERE id = ${id}`;
    pool.query(sql, (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
};*/

const getProfile = (req, res) => {
    const { id } = req.params;
    const sql = `SELECT u.nombre, u.apellido, u.dob, u.peso, u.altura, u.sexo, e.tipo, e.fecha FROM entrenamiento e 
    JOIN usuarioEntrena uE ON e.id = uE.idEntrenamiento
    JOIN usuario u ON uE.idUsuario = u.id
    WHERE u.id = ${ id }
    ORDER BY e.id DESC
    LIMIT 1`;
    pool.query(sql, (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
};

const newProfile = (req, res) => { // email, password, nombre, apellido, sexo, altura, peso, dob
    const body = req.body;
    const sql = `INSERT INTO usuario (email, password, nombre, apellido, sexo, altura, peso, dob) VALUES (?, SHA2(?, 224), ?, ?, ?, ?, ?, ?)`;
    pool.query(sql, [body.email, body.password, body.nombre, body.apellido, body.sexo, body.altura, body.peso, body.dob], (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
}

module.exports = {
    getUsuarios,
    // getUsuario
    getProfile,
    newProfile
};