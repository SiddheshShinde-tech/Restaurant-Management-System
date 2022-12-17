import 'package:isdp/models/menu_boiler_plate.dart';
import 'package:isdp/models/tables_boiler_plate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:isdp/global.dart';

class DatabaseServices {
  // fetch data from menu table
  Future fetchMenu() async {
    try {
      var response =
          await Supabase.instance.client.from("menu").select().execute();
      var dataList = response.data;
      return dataList
          .map((menuElement) => MenuItems.fromJson(menuElement))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchTables() async {
    try {
      var response = await Supabase.instance.client
          .from("tables")
          .select("id")
          .eq("reserved", 1)
          .execute();
      // tables = [];
      List dataList = await response.data;
      print("LIST");
      // print(dataList);
      var store = dataList
          .map((tableElement) => print(tableElement))
          .toList();
      return dataList
          .map((tableElement) => TablesAvailable.fromJson(tableElement))
          .toList();


    } catch (e) {
      print(e.toString());
    }
  }


makeReserved(int id, String occasion,) {
    print("Executing response");
    var response = Supabase.instance.client.from("tables").
    update({"reserved": 1, "occasion": occasion, "uuid": Supabase.instance.client.auth.user().id}).
    eq("id", id).execute();

    print(response.toString());
  }
}
