import 'package:flutter/material.dart';
import 'package:food_app/models/dish_model.dart';
import 'package:food_app/screens/dish_details_screen.dart';

class GridWidget extends StatelessWidget {
  final List<Dish> dishes;

  GridWidget({required this.dishes});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
  
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 4/3.1,
      ),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        Dish dish = dishes[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DishDetailsScreen(dishes: dishes,initialIndex: index),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(  
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Image.asset(
                    dish.img,
                    width: double.infinity,
                    height: 170, // Reduced height
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dish.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dish.cuisine,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Text(
                            '\$${dish.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 76, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
