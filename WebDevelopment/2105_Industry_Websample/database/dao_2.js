const { MongoClient } = require("mongodb");
const assert = require('assert');
exports.connectDB = function (client, res) {
    async function run() {
        try {
            var movie;
            await client.connect();
            const database = client.db("PLC_config");
            const col = database.collection("PLC");
            
            const query = {Device : "FX5U"};
            res.writeHead(200, { 'Content-Type': 'application/json' });
            movie = await col.find(query).toArray();
            res.write(JSON.stringify(movie)); 
            res.end();
        } finally {
            // Ensures that the client will close when you finish/error
            await client.close();
        }
    }
    run().catch(console.dir);
};