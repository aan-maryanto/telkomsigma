var express = require('express');
var router = express.Router();
const https = require('https');

/* GET users listing. */
router.get('/', function(req, res, next) {
  let output = ''
  var url = "https://raw.githubusercontent.com/damaryosaaji/freeapi/main/user.json"
  const request = https.get(url, (result) => {
    result.on('data', (data) => {
      output += data
    })

    result.on('end', () => {
      var respon = JSON.parse(output)
      res.render('users', {title: 'Data Users', data: respon})
    })

    result.on('error', (err) => {
      console.log(err)
    })
  })
  request.end()
  // res.send('respond with a resource');
});

module.exports = router;
