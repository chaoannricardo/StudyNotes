const mongoose = require('mongoose');
const http = require('http');
const WebSocket = require('ws');
const express = require('express');
const path = require('path');
const uuid = require('uuid');

const mongo = require('./mongo');

const app = express();

/* -------------------------------------------------------------------------- */
/*                               MONGOOSE MODELS                              */
/* -------------------------------------------------------------------------- */
const { Schema } = mongoose;

const PLCSchema = new Schema({
  Device: {
    type: String,
    required: [true, 'device field is required.']
  },
  Comm: {
    type: String,
    required: [true, 'comm field is required.']
  },
  IP: {
    type: String,
    required: [true, 'IP field is required.']
  },
  Port: {
    type: String,
    required: [true, 'port field is required.']
  },
  Node_0: {
    type: String,
    required: [true, 'node_0 field is required.']
  },
  Info_0: {
    type: String,
    required: [true, 'info_0 field is required.']
  }
})

// Creating a table within database with the defined schema
const plcSchema = mongoose.model('PLC', PLCSchema)


/* -------------------------------------------------------------------------- */
/*                            SERVER INITIALIZATION                           */
/* -------------------------------------------------------------------------- */
const server = http.createServer(app);

const wss = new WebSocket.Server({
  server,
});

app.use(express.static(path.join(__dirname, 'public')));



wss.on('connection', function connection(client) {
  
  client.sendEvent = async(e) => client.send(JSON.stringify(e));
  
  client.on('message', async function incoming(message) {
    message = JSON.parse(message);
    console.log(message);
    const type = message.type;
    const data = message.data;
    switch(type){
      case 'post':{
        const{Device,Comm,IP,Port,Node_0,Info_0}=data;
        const messagein = new plcSchema({Device,Comm,IP,Port,Node_0,Info_0});
        await messagein.save();
        break;
      }
      case 'get':{
        const {Device} = data;
        const exist = await plcSchema.findOne({Device});
        console.log(exist)
          //var item = `[${exist.Device},${exist.Comm}, ${exist.IP} ,${exist.Port},${exist.Node_0},${exist.Info_0}]`
    
        
        client.sendEvent(
          exist
        )
       
      }
    }

   
    

  });
});

mongo.connect();

server.listen(8080, () => {
  console.log('Server listening at http://localhost:8080');
});
