import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isdp/auth/supabase_credentials.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {
  // static final supaClient = Supabase.instance.client;

  Future<bool> signUp(
      String name, String phone, String email, String password) async {
    final res = await Supabase.instance.client.auth
        .signUp(email, password, userMetadata: {'name': name, 'phone': phone});

    // final res = await Supabase.instance.client.auth
    //     .signUp(email, password);

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
}
