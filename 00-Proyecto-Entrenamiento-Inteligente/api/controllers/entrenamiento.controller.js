const pool = require('../helpers/mysql-config');

const getEntrenamientos = (req, res) => {
    const sql = 'SELECT * FROM entrenamiento';
    pool.query(sql, (err, result, fields) => {
        if(err) res.json(err);
        res.json(result);
    });
};

module.exports = {
    getEntrenamientos
};