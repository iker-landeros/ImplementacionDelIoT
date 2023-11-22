const express = require('express');
const mysqlConfig = require('./helpers/mysql-config.js');
const mysql = require('mysql2');

const app = express();
const port = 3000;

// Se encarga de que el app pueda recibir datos en formato JSON
app.use(express.json())

// Recurso

app.get('/branch', (req, res) => {
    const sql = 'SELECT * FROM branch'
    const conexion = mysql.createConnection(mysqlConfig)
    conexion.query(sql, (error, result, fields) => {
        if(error)
            res.json(error)
        res.json(result)
    })
})

app.use('/branch', branch)
app.use('/login', login)

// INSERCIÓN ESTÁTICA
/*app.post('/branch', (req, res) => {
    const sql = `INSERT INTO branch(branchNo, city, street, postcode)
    VALUES(?, ?, ?, ?)`
    const conexion = mysql.createConnection(mysqlConfig)
    conexion.query(sql, ["B009", "Liverpool", "24 Croak Rd", "ABC 768"],
    (error, result, fields) => {
        if(error)
            res.json(error)
        res.json(result)
    })
})*/

// INSERCIÓN DINÁMICA
app.post('/branch', (req, res) => {
    const body = req.body
    const sql = `INSERT INTO branch(branchNo, city, street, postcode)
    VALUES(?, ?, ?, ?)`
    const conexion = mysql.createConnection(mysqlConfig)
    conexion.query(sql, [body.branchNo, body.city, body.street, body.postcode],
    (error, result, fields) => {
        if(error)
            res.json(error)
        res.json(result)
    })
})


app.get('/', (req,res) => {
    res.send('Hola Mundo!');
})

app.get('/temperatura', (req,res) => {
    res.send('Este es el endpoint GET de la temperatura');
})

// CRUD -> POST/GET/PUT|PATCH/DELETE

app.post('/temperatura', (req, res) => {
    res.send('Este es el endpoint POST de la temperatura');
})

app.put('/temperatura', (req, res) => {
    res.send('Este es el endpoint PUT de la temperatura');
})

app.delete('/temperatura', (req, res) => {
    res.send('Este es el endpoint DELETE de la temperatura');
})



app.listen(port, () => {
    console.log(`servidor iniciado en el puerto ${port}`)
})

