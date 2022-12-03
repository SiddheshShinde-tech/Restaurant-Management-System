// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<MenuItems> fromJson(String str) => List<MenuItems>.from(json.decode(str).map((x) => MenuItems.fromJson(x)));

String toJson(List<MenuItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MenuItems {
  MenuItems({
    this.id,
    this.name,
    this.price,
    this.type,
    this.category,
  });

  int id;
  String name;
  double price;
  String type;
  String category;

  factory MenuItems.fromJson(Map<String, dynamic> json) => MenuItems(
    id: json["id"],
    name: json["name"],
    price: json["price"].toDouble(),
    type: json["type"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "type": type,
    "category": category,
  };
}
