const mysql = require('mysql2');

let pool = mysql.createPool({
    connectionLimit: 10,
    host: process.env.DBHOST || 'servidoriot2023.cisvdnwsdecj.us-east-1.rds.amazonaws.com',
    user: process.env.DBUSER || 'admin',
    password: process.env.DBPASSWORD || 'Iklandia1!',
    database: process.env.DATABASE || 'SmartFlex',
    port: process.env.DBPORT || 3006,
    dateStrings: true,
    connectTimeout:60000
});

pool.getConnection((err, connection) => {
    if(err){
        throw err;
    }
    connection.release();
});

module.exports = pool;