class Choice{
  final String rice;
  final double ricePrice;
  final String topping;
  final double toppingPrice;

  

  factory Choice.fromJson(Map<String,dynamic> json){
    return Choice(
      rice: json['rice'],
      ricePrice: json['ricePrice'],
      topping: json['topping'], 
      toppingPrice:json['toppingPrice']
      );
  }

  Choice({required this.rice, required this.topping, required this.ricePrice, required this.toppingPrice});
}

