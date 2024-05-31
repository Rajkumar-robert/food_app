import 'package:flutter/material.dart';
import 'package:food_app/models/dish_model.dart';
import 'package:food_app/services/api.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChoiceContainer extends StatefulWidget {
  final List<Rice> riceOptions;
  final List<Topping> toppingOptions;

  ChoiceContainer({required this.riceOptions, required this.toppingOptions});

  @override
  _ChoiceContainerState createState() => _ChoiceContainerState();
}

class _ChoiceContainerState extends State<ChoiceContainer> {
  Rice? selectedRice;
  Topping? selectedTopping;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose your rice',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(
            'Select One:',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
          ),
          ...widget.riceOptions.map((rice) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(rice.img),
              ),
              title: Text(rice.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${rice.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Radio<Rice>(
                    activeColor: Color.fromARGB(255, 255, 100, 45),
                    value: rice,
                    groupValue: selectedRice,
                    onChanged: (value) {
                      setState(() {
                        selectedRice = value;
                      });
                      Color.fromARGB(255, 255, 100, 45);
                    },
                  ),
                ],
              ),
            );
          }).toList(),
          SizedBox(height: 8),
          Text(
            'Choose your Topping',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          Text(
            'Select One',
            style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
          ),
          ...widget.toppingOptions.map((topping) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(topping.img),
              ),
              title: Text(topping.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${topping.price.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Radio<Topping>(
            activeColor: Color.fromARGB(255, 255, 100, 45),
                    value: topping,
                    groupValue: selectedTopping,
                    onChanged: (value) {
                      setState(() {
                        selectedTopping = value;
                      });
                    },
                  ),
                ],
              ),
            );
          }).toList(),
          SizedBox(height: 8),
          Center(
            child: ElevatedButton(
              onPressed: selectedRice != null && selectedTopping != null
                  ? () async {
                      var data = {
                        "rice": selectedRice!.name,
                        "ricePrice": selectedRice!.price,
                        "topping": selectedTopping!.name,
                        "toppingPrice": selectedTopping!.price
                      };
                      var res = await ApiService.addChoice(data);
                      if (res == 200) {
                        Fluttertoast.showToast(
                            msg: "Choice added successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Failed to add choice.",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    }
                  : null,
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 255, 110, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
