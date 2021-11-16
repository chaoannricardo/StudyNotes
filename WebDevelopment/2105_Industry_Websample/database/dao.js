const { MongoClient } = require("mongodb");
const assert = require('assert');
// Replace the uri string with your MongoDB deployment's connection string.
exports.connectDB = function (card) {
	const uri = "mongodb://ntume:Industry400@220.133.208.39:37369/?authSource=admin&readPreference=primary&appname=MongoDB%20Compass&ssl=false";
	const client = new MongoClient(uri,
	{
		useNewUrlParser: true,
		useUnifiedTopology: true,
	});
	
    async function run() {
        try {
            await client.connect();
            const database = client.db("PLC_config");
            const col = database.collection("PLC");
            // create a document to be inserted
            const doc = card;
            const result = await col.insertOne(doc);
            console.log(
                `${result.insertedCount} documents were inserted with the _id: ${result.insertedId}`,
            );
        } finally {
            // Ensures that the client will close when you finish/error
            await client.close();
        }
    }
    run().catch(console.dir);
};