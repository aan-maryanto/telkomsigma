var mysql = require('mysql');
var connection = mysql.createConnection({
    host: 'localhost',
    port: 3306,
    user: 'admin',
    password: 'P@ssw0rd',
    database: 'telkom_sigma'
})

connection.connect(function(err){
    if(err) throw err
})

module.exports = connection;