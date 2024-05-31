import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                ),
                Text(
                  "subtitle",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 110, 45),
              borderRadius: BorderRadius.circular(15)),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_bag_outlined, 
                color: Colors.white,
                size: 30,),
            ),
          ),
        ],
      ),
    );
  }
}
