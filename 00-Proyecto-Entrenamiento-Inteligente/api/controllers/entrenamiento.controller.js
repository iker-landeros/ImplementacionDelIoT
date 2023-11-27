const pool = require('../helpers/mysql-config');

const getEntrenamientos = (req, res) => {
    const sql = 'SELECT * FROM entrenamiento';
    pool.query(sql, (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
};

const getCurrentWorkout = (req, res) => {
    const { id } = req.params;
    const sql = `SELECT s.segundo, s.ECG, s.temperatura, s.humedad
    FROM stats s
    JOIN entrenamiento e ON s.idEntrenamiento = e.id
    WHERE e.id = ${ id }
    ORDER BY segundo DESC
    LIMIT 20;`;
    pool.query(sql, (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
};

module.exports = {
    getEntrenamientos,
    getCurrentWorkout
};