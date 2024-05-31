import 'package:flutter/material.dart';
import 'package:food_app/models/dish_model.dart';
import 'package:food_app/widgets/navbar.dart';
import 'package:food_app/widgets/sidebar.dart';
import 'package:food_app/widgets/dish_detail_card.dart';
import 'package:food_app/widgets/choice_container.dart';

class DishDetailsScreen extends StatefulWidget {
  final List<Dish> dishes;
  final int initialIndex;

  DishDetailsScreen({required this.dishes, this.initialIndex = 0});

  @override
  _DishDetailsScreenState createState() => _DishDetailsScreenState();
}

class _DishDetailsScreenState extends State<DishDetailsScreen> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void _showPreviousDish() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  void _showNextDish() {
    setState(() {
      if (currentIndex < widget.dishes.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavbarWidget(),
            SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  Sidebar(),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: DishDetailCard(
                                  dish: widget.dishes[currentIndex]),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              flex: 1,
                              child: ChoiceContainer(
                                riceOptions: widget.dishes[currentIndex].rice,
                                toppingOptions:
                                    widget.dishes[currentIndex].toppings,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 255, 110, 45),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: IconButton(
                                  onPressed: currentIndex > 0
                                      ? _showPreviousDish
                                      : null,
                                  icon: Icon(
                                    Icons.arrow_circle_left_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(255, 255, 110, 45),
                                ),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                child: IconButton(
                                  onPressed:
                                      currentIndex < widget.dishes.length - 1
                                          ? _showNextDish
                                          : null,
                                  icon: Icon(
                                    Icons.arrow_circle_right_outlined,
                                    size: 24,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
