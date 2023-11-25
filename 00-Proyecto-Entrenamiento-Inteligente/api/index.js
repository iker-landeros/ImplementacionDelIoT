const express = require('express')
const mysql = require('mysql')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.use('/app', require('./app'))
app.use('/login', require('./login'))

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })