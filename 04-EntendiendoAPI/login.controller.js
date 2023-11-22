const mySQLconfig = require('../helpers/mysql-config.js');
const mysql = require('mysql2');

const login = (req, res) => {
    const body = req.body;
    const sql = "SELECT COUNT(*) FROM userprueba WHERE user = ? AND password = SHA2(?,223)"
    const conexion = mysql.createConnection(mySQLconfig)
    conexion.query(sql,(error,result,fields)=>{
        if(error)
            res.json(error)
        console.log(result)
        res.json(result)
    })
}


module.exports = login;