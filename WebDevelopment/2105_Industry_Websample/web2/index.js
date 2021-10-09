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

const MotorSchema = new Schema({
  Motor_name: {
    type: String,
    required: [true, 'Motor_name field is required.']
  },
  Torque: {
    type: String,
    required: [true, 'Torque field is required.']
  },
  Power: {
    type: String,
    required: [true, 'Power field is required.']
  },
  Rated_Speed: {
    type: String,
    required: [true, 'Rated_Speed field is required.']
  },
  Max_Speed: {
    type: String,
    required: [true, 'Max_Speed field is required.']
  },
  Rated_Current: {
    type: String,
    required: [true, 'Rated_Current field is required.']
  },
  Inertia: {
    type: String,
    required: [true, 'Inertia field is required.']
  },
  Resistance: {
    type: String,
    required: [true, 'Rated_Current field is required.']
  },
  Inductance: {
    type: String,
    required: [true, 'Rated_Current field is required.']
  }
})

// Creating a table within database with the defined schema
const motorSchema = mongoose.model('Motor', MotorSchema)


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
        const{Motor_name,Torque,Power,Rated_Speed,Max_Speed,Rated_Current,Inertia,Resistance,Inductance}=data;
        const messagein = new motorSchema({Motor_name,Torque,Power,Rated_Speed,Max_Speed,Rated_Current,Inertia,Resistance,Inductance});
        await messagein.save();
        break;
      }
      case 'get':{
        const {Motor_name} = data;
        const exist = await motorSchema.findOne({Motor_name});
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
