import 'dart:convert';

List<InventoryItems> fromJson(String str) => List<InventoryItems>.from(
    json.decode(str).map((x) => InventoryItems.fromJson(x)));

String toJson(List<InventoryItems> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryItems {
  InventoryItems({
    this.id,
    this.name,
    this.quantity,
  });

  int id;
  String name;
  int quantity;

  factory InventoryItems.fromJson(Map<String, dynamic> json) => InventoryItems(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
      };
}
