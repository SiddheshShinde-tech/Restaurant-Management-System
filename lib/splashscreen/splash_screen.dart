import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:isdp/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repeat/repeat_animations.dart';
import '../repeat/repeat_theme.dart';
import 'package:flutter/material.dart';

String finalEmail;

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({Key key}) : super(key: key);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                (finalEmail == null ? SigninWidget() : HomeWidget()),
          ),
        );
      });
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail;
    });
    print(finalEmail);
  }


  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/isdp.webp',
      nextScreen: SigninWidget(),
      splashTransition: SplashTransition.rotationTransition,

    );
    // return Scaffold(
    //     key: scaffoldKey,
    //     backgroundColor: Color(0xFF1E2429),
    //     body: InkWell(
    //       child: Stack(
    //           alignment: AlignmentDirectional(0, 0.3999999999999999),
    //           children: [
    //             Container(
    //               width: double.infinity,
    //               height: double.infinity,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //               ),
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.max,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: [
    //                   Image.asset(
    //                     'assets/images/isdp.webp',
    //                     width: 300,
    //                     height: 300,
    //                     fit: BoxFit.fitHeight,
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
    //                     child: Text(
    //                       'RepEat',
    //                       style: RepEatTheme.of(context).title1.override(
    //                             fontFamily: 'Itim',
    //                             color: Color(0xFFF7941E),
    //                             fontSize: 28,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 120),
    //                     child: Text(
    //                       'serving happiness',
    //                       style: RepEatTheme.of(context).title3.override(
    //                             fontFamily: 'Lexend Deca',
    //                             color: Color(0xFF8CC63F),
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.normal,
    //                           ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ]),
    //     ));
  }
}
