exports.connectDB = function (c, res) {
    async function run(){
        await c.query('SELECT * FROM mc_3e_sensor' ,function(err, rows)
        { if (err) throw err; 
        console.log('---------查看所有的資料庫------------'); 
        console.dir(rows); 
        res.writeHead(200, { 'Content-Type': 'application/json' });
        //movie = await col.findOne(query);
        res.write(JSON.stringify(rows));
           
        res.end();
    });
    }
    run().catch(console.dir);
    
}

