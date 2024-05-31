import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/models/choice.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/models/dish_model.dart';

class ApiService {
  static const baseUrl = 'http://192.168.0.103:3000/api/'; 

  static Future<List<Dish>> fetchDishes() async {
    List<Dish> dishes = [];
    var url = Uri.parse('${baseUrl}get_dish');
    
    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        
        for (var item in data) {
          dishes.add(Dish.fromJson(item));
        }
        
        print(dishes);
        return dishes;
      } else {
        print("Failed fetching dishes");
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static addChoice( data) async {
    var url = Uri.parse('${baseUrl}add_choice');
    try {
      final res = await http.post(url, body: jsonEncode(data), headers: {
        "Content-Type": "application/json",
      });

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);

        return res.statusCode;
      } else {
        print(res.statusCode);
        print("Failed to add choice");
       return res.statusCode;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
