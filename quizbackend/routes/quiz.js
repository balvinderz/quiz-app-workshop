var express = require('express');
var router = express.Router();
var mysql = require('mysql');
/* GET users listing. */
//myrait
//Rait_myrait

router.get('/', function(req, res, next) {
  var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "quiz"
  });
  
  con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
  });
  
 con.query("select * from quiz", (err, reso) => {
    if (err) throw err;
    
    
    res.json(reso);
 })
  

  // res.send('respond with a resource');
});

module.exports = router;