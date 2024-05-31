
class Rice {
  final String name;
  final String img;
  final double price;

  Rice({
    required this.name,
    required this.img,
    required this.price,
  });

  factory Rice.fromJson(Map<String, dynamic> json) {
    return Rice(
      name: json['name'],
      img: json['img'],
      price: (json['price'] ?? 0.0).toDouble(), // Ensure price is parsed as double
    );
  }
}

class Topping {
  final String name;
  final String img;
  final double price;

  Topping({
    required this.name,
    required this.img,
    required this.price,
  });

  factory Topping.fromJson(Map<String, dynamic> json) {
    return Topping(
      name: json['name'],
      img: json['img'],
      price: (json['price'] ?? 0.0).toDouble(), // Ensure price is parsed as double
    );
  }
}

class Dish {
  final String id;
  final String name;
  final String description;
  final String cuisine;
  final double price;
  final String img;
  final List<Rice> rice;
  final List<Topping> toppings;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.cuisine,
    required this.price,
    required this.img,
    required this.rice,
    required this.toppings,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      cuisine: json['cuisine'],
      price: (json['price'] ?? 0.0).toDouble(), 
      img: json['img'],
      rice: List<Rice>.from(json["rice"].map((x)=>Rice.fromJson(x))),
      toppings: List<Topping>.from(json["toppings"].map((x)=>Topping.fromJson(x))),
    );
  }
}
