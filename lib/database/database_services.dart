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

  void fetchTables() async {
    try {
      var response = await Supabase.instance.client
          .from("tables")
          .select("id")
          .eq("reserved", 0)
          .execute();
      tables = [];
      List dataList = await response.data
          .map((tableElement) => TablesAvailable.fromJson(tableElement))
          .toList();
      for (int i = 0; i < dataList.length; i++) {
        tables.add(dataList[i].id.toString());
      }
      print(tables);
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
