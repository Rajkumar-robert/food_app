const mongoose = require("mongoose");

// Define schema for rice
const riceSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  img: {
    type: String,
    required: true
  },
  price: {
    type: Number,
    required: true
  }
});

// Define schema for toppings
const toppingSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  img: {
    type: String,
    required: true
  },
  price: {
    type: Number,
    required: true
  }
});

// Define schema for dish
const dishSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  cuisine: {
    type: String,
    required: true
  },
  price: {
    type: Number,
    required: true
  },
  img: {
    type: String,
    required: true
  },
  rice: [riceSchema], // Embed rice schema as an array
  toppings: [toppingSchema] // Embed topping schema as an array
});

module.exports = mongoose.model("Dish", dishSchema, "dish_data");
