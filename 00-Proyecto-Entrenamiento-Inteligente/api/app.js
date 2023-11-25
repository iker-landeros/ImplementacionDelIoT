let express = require('express')
let mysql = require('mysql')
let router = express.Router()

let config = {
    host:'servidoriot2023.cisvdnwsdecj.us-east-1.rds.amazonaws.com',
    user:'admin',
    password:'Iklandia1!',
    database:'SmartFlex'
}

let connection = mysql.createConnection(config)

router.get('/', (req, res) => {
    res.send('Ruta app!')
})

router.get('/login')



module.exports = router;