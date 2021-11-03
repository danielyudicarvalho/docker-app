const express = require('express');
const mysql = require('mysql');

const app = express();

const connection = mysql.createConnection({
  host: '172.18.0.2',
  user: 'root',
  password: 'root',
  database: 'tre_ms;'
});

connection.connect();

app.get('/servidores', function(req, res) {
  connection.query('SELECT * FROM servidor', function (error, results) {

    if (error) { 
      throw error
    };

    res.send(results.map(item => ({ nome_servidor: item.nome_servidor, cpf: item.cpf, matricula: item.matricula})));
  });
});


app.listen(9001, '0.0.0.0', function() {
  console.log('Listening on port 9001');
})