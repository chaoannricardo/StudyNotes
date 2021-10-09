const http = require('http');
const fs = require('fs');
const querystring = require('querystring');
const dao = require('./dao');

const hostname = '192.168.50.31';
const port = 3000;
const server = http.createServer((req, res) => {
    //read html file
    fs.readFile('main.html', (err, data) => {
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
});
server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/`);
});