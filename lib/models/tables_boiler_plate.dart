import 'dart:convert';

List<TablesAvailable> fromJson(String str) => List<TablesAvailable>.from(json.decode(str).map((x) => TablesAvailable.fromJson(x)));

String toJson(List<TablesAvailable> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TablesAvailable {
  TablesAvailable({
    this.id,
    this.occassion,
  });

  int id;
  String occassion;

  factory TablesAvailable.fromJson(Map<String, dynamic> json) => TablesAvailable(
    id: json["id"],
    occassion: json["occassion"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "occassion":occassion,
  };
}