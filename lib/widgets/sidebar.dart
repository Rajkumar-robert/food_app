import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.0,
        right: 15.0
      ),
      decoration: BoxDecoration(
        color: Colors.white,
         borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(12),
                  ),
      ),
      width: 230,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: _selectedIndex == index ? Colors.transparent : Colors.grey.shade500,
                ),
                color: _selectedIndex == index ? Color.fromARGB(255, 255, 110, 45) : Colors.transparent,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(0),
                    right: Radius.circular(10),
                  ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
                child: Center(
                  child: Text(
                    _getListTitle(index),
                    style: TextStyle(
                      fontSize: 16,
                      color: _selectedIndex == index ? Colors.white : Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getListTitle(int index) {
    switch (index) {
      case 0:
        return 'Rice bowls';
      case 1:
        return 'Pasta bowls';
      case 2:
        return 'Sides';
      case 3:
        return 'Beverages';
      default:
        return '';
    }
  }
}
