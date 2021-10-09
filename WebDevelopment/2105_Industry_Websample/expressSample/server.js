const http = require('http');
const fs = require('fs');
const querystring = require('querystring');
const dao = require('./dao');

const hostname = '127.0.0.1';
const port = 3000;
const server = http.createServer((req, res) => {

    if(req.url.indexOf('.css') != -1){ //req.url has the pathname, check if it conatins '.css'

        fs.readFile(__dirname + 'style.css', function (err, data) {
          if (err) console.log(err);
          res.writeHead(200, {'Content-Type': 'text/css'});
          res.write(data);
          res.end();
        });

    //read html file
    fs.readFile('index.html', (err, data) => {
        if (req.method === 'GET') {
            res.statusCode = 200;
            res.setHeader('Content-Type', 'text/html;charset=utf-8');
            res.end(data);

            if(req.url.indexOf('.css') != -1){ //req.url has the pathname, check if it conatins '.css'

                fs.readFile(__dirname + 'style.css', function (err, data) {
                  if (err) console.log(err);
                  res.writeHead(200, {'Content-Type': 'text/css'});
                  res.write(data);
                  res.end();
                });

                
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
                        Motor_Name: body.Motor_Name, Torque: body.Torque, Power: body.Power, Rated Speed: body.Rated_Speed,
                        Max Speed: body.Max_Speed, Rated Current: body.Rated_Current, Inertial: body.Inertial,Stator Resistance: body.Stator_Resistance, 
						Stator Inductance: body.Stator_Inductance
                    };
                    console.log(card);
                    dao.connectDB(card);
                    res.statusCode = 200;
                    res.setHeader('Content-Type', 'text/html;charset=utf-8');
                    res.end(data);
                })
        }
    })
});
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});