import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:isdpsample/model/boilerplate_inventory.dart';
import '../auth/supabase_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/boilerplate_inventory.dart';

class AdminSupabaseServices {
  // static final supaClient = Supabase.instance.client;

  Future<bool> signUp(
      String name, String phone, String email, String password) async {
    final res = await Supabase.instance.client.auth
        .signUp(email, password, userMetadata: {'name': name, 'phone': phone});

    if (res.user == null) {
      Fluttertoast.showToast(
        msg: "User already registered",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Color(0xFFD26F39),
        textColor: Color(0xFFFFFFFF),
      );
      return false;
    } else {
      Fluttertoast.showToast(
        msg: "SignUp Successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Color(0xFFD26F39),
        textColor: Color(0xFFFFFFFF),
      );
      return true;
    }
  }

  Future<bool> signIn(String email, String password) async {
    final res = await Supabase.instance.client.auth.signIn(
        email: email,
        password: password,
        options: AuthOptions(redirectTo: SupabaseCredentials.APIURL));
    if (res.user != null) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> signOut() async {
    Supabase.instance.client.auth.signOut();
  }

  Future fetchInventory() async {
    try {
      var response =
          await Supabase.instance.client.from("inventory").select().execute();
      var dataList = response.data;
      return dataList
          .map((menuElement) => InventoryItems.fromJson(menuElement))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }

  makeUnReserved(int id) {
    var response = Supabase.instance.client
        .from("tables")
        .update({"reserved": 0, "occasion": Null, "uuid": Null})
        .eq("id", id)
        .execute();

    print(response.toString());
  }

  insertDataToAdmins(String name, String phone, String flag) {
    var response = Supabase.instance.client.from("admins").insert({
      "name": name,
      "phone": phone,
      "uuid": Supabase.instance.client.auth.user().id,
      "flag": flag,
    }).execute();

    print(response.toString());
  }

  updateInventory(int id, int quantity) {
    var response = Supabase.instance.client
        .from("inventory")
        .update({"quantity": quantity})
        .eq("id", id)
        .execute();
    print(response);
  }
}



// insertData(String table, String name, String phone) {
//   var response = Supabase.instance.client.from(table).insert({
//     "name": name,
//     "phone": phone,
//     "uuid": Supabase.instance.client.auth.user().id
//   }).execute();
// }


