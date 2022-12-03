import 'package:fluttertoast/fluttertoast.dart';
import 'package:isdp/index.dart';

import '../auth/authentication_service.dart';
import '../repeat/repeat_theme.dart';
import '../repeat/repeat_widgets.dart';
import '../home/home_widget.dart';
import 'package:flutter/material.dart';

import '../security/validity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../globals.dart' as globals;

class SigninWidget extends StatefulWidget {
  const SigninWidget({Key key}) : super(key: key);

  @override
  _SigninWidgetState createState() => _SigninWidgetState();
}

class _SigninWidgetState extends State<SigninWidget> {
  TextEditingController passwordController;
  bool passwordVisibility;
  TextEditingController emailController;
  var authenticationServices = new SupabaseServices();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordVisibility = false;
    emailController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFD26F39),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 110, 0, 30),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 220,
                                height: 180,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 10),
                                        child: Text(
                                          'Sign In',
                                          style: RepEatTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFFF7941E),
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: TextFormField(
                            controller: emailController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: RepEatTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0x98FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Enter Email...',
                              hintStyle: RepEatTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0x98FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xC0D26F39),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                            ),
                            style: RepEatTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xA3F1F4F8),
                                ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: RepEatTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0x98FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              hintText: 'Enter password...',
                              hintStyle: RepEatTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0x98FFFFFF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Color(0xC0D26F39),
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () => passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0x98FFFFFF),
                                  size: 20,
                                ),
                              ),
                            ),
                            style: RepEatTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: GestureDetector(
                                  child: Text(
                                    'New User? Signup',
                                    style: RepEatTheme.of(context).bodyText1.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Color(0xFFF7941E),
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupWidget(
                                          key: null,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                          child: REButtonWidget(
                            onPressed: () async {
                              final emailVal = emailController.text;
                              final passwordVal = passwordController.text;
                              final bool isAuthenticated = await authenticationServices.signIn(emailVal, passwordVal);

                              if (!Validity.isValidEmail(emailVal) ||
                                  emailVal.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Email Invalid'),
                                  ),
                                );
                                return;
                              }

                              if (!Validity.isValidPassword(passwordVal) ||
                                  passwordVal.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Password should in this pattern = AlphaNumeric123@#@'),
                                  ),
                                );
                                return;
                              }

                              // ignore: unrelated_type_equality_checks
                              if (isAuthenticated == true) {
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();
                                sharedPreferences.setString('email', emailVal);

                                Fluttertoast.showToast(
                                  msg: "SignIn Successful!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Color(0xFF8CC63F),
                                  textColor: Color(0xFFFFFFFF),
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomeWidget()),
                                );



                              } else {
                                Fluttertoast.showToast(
                                    msg: "Wrong Credentials!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Color(0xFFD26F39),
                                    textColor: Color(0xFFFFFFFF));
                              }
                            },
                            text: 'Login',
                            options: REButtonOptions(
                              width: 230,
                              height: 60,
                              color: Colors.white,
                              textStyle: RepEatTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF8CC63F),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: REButtonWidget(
                            onPressed: () {
                              // print('Button-ForgotPassword pressed ...');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AdminSignInWidget()),
                              );
                            },
                            text: 'Admin SignIn',
                            options: REButtonOptions(
                              width: 170,
                              height: 40,
                              color: Color(0xFFF7941E),
                              textStyle: RepEatTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
