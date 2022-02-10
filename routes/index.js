var express = require('express');
var router = express.Router();
var connection = require('../db.js');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/nosatu', function(req, res, next) {
  var hasil = []
  var n = 5
  for(var i=1; i <= n; i++) {
    var item_i = Array(i)
    // hasil.push(item_i)
    for(var j=1; j<=n-item_i.length; j++) {
      var item = Array(i).fill(i-1)
      hasil.push(item)
    }
  }
  res.send(hasil)
})

router.get('/checkHasil', function(req, res, next) {
  var hasil = {}
  var hasil_aplikasi = []
  var hasil_role = []
  var aplikasi = {}
  var role = {}
  connection.query(`select tp.username, tp.fullname from tbl_pegawai tp 
  where username = '19992008'`, function(err, rows, fields){
    if(err) {
      throw err
    }
    if(rows) {
      hasil["username"] = rows[0]["username"]
      hasil["fullname"] = rows[0]["fullname"]
      hasil["aplikasi"] = []
      connection.query('select id_aplikasi, nama_aplikasi from tbl_aplikasi ta', function(err1, rows1, fields1){
        if(err1) {
          throw err1
        }
        if(rows1) {
          hasil_aplikasi = rows1
          hasil_aplikasi.forEach(element => {
            aplikasi = element
            aplikasi["roles"] = []
            connection.query("select id_role, nama_role from tbl_roles where aplikasi = '"+element['id_aplikasi']+"'", function(err2, rows2, fields2) {
              if(err2) {
                throw err2
              }
              if(rows2){
                hasil_role = rows2
                console.log(hasil_role)
                aplikasi["roles"] = hasil_role
                console.log("Aplikasi : "+ JSON.stringify(aplikasi))
                hasil["aplikasi"].push(aplikasi)
              }
            })
            hasil["aplikasi"].push(aplikasi)
            
          });
          res.send(hasil)
        }
      })
    
    }
  })
})

module.exports = router;
