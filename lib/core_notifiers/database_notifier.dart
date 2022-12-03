// import 'dart:convert';
// import 'dart:html';

// import 'package:flutter/cupertino.dart';
// import 'package:isdp/database/database_services.dart';
// import 'package:isdp/models/menu_boiler_plate.dart';
// import '../database/database_services.dart';

// class DatabaseNotifier extends ChangeNotifier {
//   final DatabaseServices _databaseServices = new DatabaseServices();

//   Future fetchData() async {
//     List data = await _databaseServices.fetchData();
//     // print(data.map((menuElement) => MenuItems.fromJson(menuElement)).toList());
//     return data.map((menuElement) => MenuItems.fromJson(menuElement)).toList();

//     // MenuItems menuModelledData = MenuItems.fromJson(jsonDecode(data));
//     // return menuModelledData;
//   }
// }
