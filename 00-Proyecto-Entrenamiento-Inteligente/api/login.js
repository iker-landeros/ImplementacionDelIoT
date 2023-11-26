let express = require('express')
let mysql = require('mysql')
const { user, password } = require('../../04-EntendiendoAPI/helpers/mysql-config')
let router = express.Router()

const config = {
    host: 'servidoriot2023.cisvdnwsdecj.us-east-1.rds.amazonaws.com',
    user: 'admin',
    password: 'Iklandia1!',
    database: 'SmartFlex',
    port: 3306,
    dateStrings: true
}

let connection = mysql.createConnection(config)

router.get('/info', (req, res) => {
    let sql = 'SELECT * FROM Usuario'
    connection.query(sql, (err, rows, fields) => {
        if(err) throw err
        console.log("throws")
        res.json(rows)
    })
})

router.post('/login', (req, res) => {
    const Id = "2";
    const correo = req.body.correo;
    const password = req.body.password;
    console.log(Id);
    let sql = 'INSERT into Usuario(Id,correo,password) VALUES(?,?,?)'
    connection.query(sql, values, (err, rows, fields) => {
        if(err) throw err
        res.json(rows)
    })
})

/*connection.query(mysql, [body.Id, body.correo, body.password], (error, results, fields) =>{

    if(error){
        return res.status(400).json({
            ok: false,
            mensaje: 'Error al crear usuario',
            errors: error
        })
    }

    res.status(201).json({
        ok: true,
        usuario: results
    })
});*/



module.exports = router;