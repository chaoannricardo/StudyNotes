const http = require('http');
const fs = require('fs');
const querystring = require('querystring');
const dao = require('./dao');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res) => {

   //read html file
   fs.readFile('index.html', (err, data) => {
    if (req.method === 'GET') {
        res.statusCode = 200;
        res.setHeader('Content-Type', 'text/html;charset=utf-8');
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
                    Motor_Name: body.Motor_Name, Torque: body.Torque, Power: body.Power, Rated_Speed: body.Rated_Speed,
                    Max_Speed: body.Max_Speed, Rated_Current: body.Rated_Current, Inertial: body.Inertial, Stator_Resistance: body.Stator_Resistance,
                    Stator_Inductance: body.Stator_Inductance
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