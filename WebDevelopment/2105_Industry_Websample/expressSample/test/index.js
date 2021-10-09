var http = require('http');
var express = require('express');
var fs = require('fs');
var app = express();
var server = http.createServer(app);
var content = fs.readFileSync('index.html');

//導入css資料夾裡的東西
app.use('/css', express.static('css'));

app.get('/', function(request,response){
  response.writeHeader(200,{'Content-Type':'text/html'});
  response.write(content);
  response.end();
});
server.listen(8080, '127.0.0.1', function(){
  console.log('hello nodejs');
});