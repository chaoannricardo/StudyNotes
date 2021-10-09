const http = require('http');
const fs = require('fs');
const querystring = require('querystring');
const dao = require('./dao');
const dao_2 = require('./dao_2');
const dao_3 = require('./dao_3');
const { MongoClient } = require("mongodb");
const uri ="mongodb://localhost:27017";
const client = new MongoClient(uri, {
        useNewUrlParser: true,
        useUnifiedTopology: true,
    });
var mysql = require('mysql');
//配置相關信息 
var c = mysql.createConnection({ host: '220.133.208.39', user: 'ntume',  password: 'Industry400', database: 'Industry4'});

const hostname = '192.168.50.31';
const port = 3000;
const server = http.createServer((req, res) => {
    //read html file
    if(req.url=='/'){
        if (req.method === 'GET') {    
            dao_2.connectDB(client, res);   
            //dao_3.connectDB(c, res);  
            //res.writeHead(200, { 'Content-Type': 'application/json' });
            //movie = {"key":"value"};
            //movie = await col.findOne(query);
            //res.write(JSON.stringify(movie)); 
            //res.end();
        } else if (req.method === 'POST') {
            var body = '';
            //監聽data事件
            req.on('data', function (chunk) { body += chunk })
                .on('end', function () {
                    // 解析URL查詢字符串
                    body = JSON.parse(body);
                    card = {
                        Device: body.Device, Comm: body.Comm, IP: body.IP, Port: body.Port,
                        Nodes_0: body.Node_0, Info_0: body.Info_0
                    };
                    console.log(card);
                    dao.connectDB(client, card);
                    res.writeHead(200, { 'Content-Type': 'application/json' });
                    res.write(JSON.stringify(body));
                    res.end();
                })
        }
    }
    else if(req.url=='/mariadb'){
        if (req.method === 'GET') {    
            //dao_2.connectDB(client, res);   
            dao_3.connectDB(c, res);  
            //res.writeHead(200, { 'Content-Type': 'application/json' });
            //movie = {"key":"value"};
            //movie = await col.findOne(query);
            //res.write(JSON.stringify(movie)); 
            //res.end();
        }
    }
    /*
    fs.readFile('main.html', (err, data) => {
        if (req.method === 'GET') {
            res.statusCode = 200;
            res.setHeader('Content-Type','multipart/form-data' , 'text/html;charset=utf-8');
            res.end(data);
        } else if (req.method === 'POST') {
            var body = '';
            //監聽data事件
            req.on('data', function (chunk) { body += chunk })
                .on('end', function () {
                    console.log(body);
                    // 解析URL查詢字符串
                    body = querystring.parse(body);
                    console.log(body);
                    card = {
                        Device: body.Device, Comm: body.Comm, IP: body.IP, Port: body.Port,
                        Nodes_0: body.Node_0, Info_0: body.Info_0
                    };
                    console.log(card);
                    dao.connectDB(card);
                    res.statusCode = 200;
                    res.setHeader('Content-Type', 'text/html;charset=utf-8');
                    res.end(data);
                })
        }
    })
});*/
})
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});