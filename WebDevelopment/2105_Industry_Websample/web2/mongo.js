const mongoose = require('mongoose');
const dotenv = require('dotenv-defaults');
//dotenv.config();


// i use mongodb://localhost:27017/cardmongo for MONGO_URL

function connectMongo() {
	const uri = "mongodb://localhost:27017";
	mongoose.connect(uri, {
		useNewUrlParser: true,
		useUnifiedTopology: true,
	});

	const db = mongoose.connection;

	db.on('error', console.error.bind(console, 'connection error:'));
	db.once('open', function () {
		console.log('Mongo database connected!');
	});
}

const mongo = {
	connect: connectMongo,
};

module.exports = mongo;
