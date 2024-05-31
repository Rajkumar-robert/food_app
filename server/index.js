const express = require('express');
const mongoose = require('mongoose');
const Dish = require('./models/dish');
const Choice = require('./models/choice');

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

console.log(process.env.MONGODB_URL);

try {
    mongoose.connect("mongodb://localhost:27017/food_app", { useNewUrlParser: true, useUnifiedTopology: true });

    const db = mongoose.connection;
    db.on('error', console.error.bind(console, 'connection error:'));
    db.once('open', function () {
        console.log("Connected to MongoDB database");
    });

    app.post("/api/add_dish", async (req, res) => {
        console.log(req.body);
        try {

            let data = new Dish(req.body);
            let dataStore = await data.save();
            res.status(200).json(dataStore);
        } catch (e) {
            res.status(400).json({
                'status': e.message
            });
        }
    });

    app.get("/api/get_dish",async (req,res)=>{
    try{
        let data =await Dish.find()
        res.status(200).json(data)
    }catch(e){
        res.status(500).json(e.message)
    }    
    })


    app.post("/api/add_choice",async (req,res)=>{
        try{
            console.log(req.body);
            let data = new Choice(req.body);
            let dataChoice = await data.save();
            res.status(200).json(dataChoice);
        }catch(e){
            res.status(400).json({
                'status': e.message
            });
        }
    })


    
} catch (e) {
    console.error(e);
}


app.listen(3000, () => {
        console.log('Server is running on http://localhost:3000');
    });