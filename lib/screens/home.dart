import 'package:flutter/material.dart';
import 'package:food_app/models/dish_model.dart';
import 'package:food_app/services/api.dart';
import 'package:food_app/widgets/sidebar.dart';
import 'package:food_app/widgets/navbar.dart';
import 'package:food_app/widgets/grid_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Dish>> futureDishes;
  String selectedCategory = 'Indian';

  @override
  void initState() {
    super.initState();
    futureDishes = ApiService.fetchDishes();
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        
        child: Column(
          children: [
            NavbarWidget(),
            SizedBox(height: 10.0),
            Expanded(
              child: Row(
                children: [
                  Sidebar(),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Container(
                       decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 18.0,right: 15.0,top: 15.0 ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Select your food",
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: ['Indian', 'Asian', 'Global'].map((category) {
                                    bool isSelected = selectedCategory == category;
                                    return GestureDetector(
                                      onTap: () => selectCategory(category),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                                        padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 10.0),
                                        decoration: BoxDecoration(
                                          color: isSelected ? Colors.white : Colors.transparent,
                                          borderRadius: BorderRadius.circular(30),
                                          border: Border.all(
                                            color: isSelected ? Color.fromARGB(255, 255, 76, 1) : Colors.grey,
                                          ),
                                        ),
                                        child: Text(
                                          category,
                                          style: TextStyle(
                                            color: isSelected ? Color.fromARGB(255, 255, 76, 1) : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 18),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text(selectedCategory,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 255, 100, 45)
                              ),),
                              Text("culpa impedit laudantium",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade400
                              ),),
                            
                            ],),
                          ),
                          SizedBox(height: 10.0),
                          Expanded(
                            child: FutureBuilder<List<Dish>>(
                              future: futureDishes,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(child: Text('Error: ${snapshot.error}'));
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return Center(child: Text('No dishes available'));
                                } else {
                                  return GridWidget(dishes: snapshot.data!);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(width: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
