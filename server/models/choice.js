const mongoose = require('mongoose');

let choiceSchema = new mongoose.Schema({
    rice:{
        type: String,
        required: true
    },
    ricePrice:{
        type: Number,
        required: true
    },
    topping:{
        type: String,
        required: true
    },
    toppingPrice:{
        type: Number,
        required: true
    }

});

module.exports = mongoose.model("choice",choiceSchema,"choice_data");
