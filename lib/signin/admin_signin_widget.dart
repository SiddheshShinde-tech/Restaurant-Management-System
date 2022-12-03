import 'package:fluttertoast/fluttertoast.dart';
import '../auth/admin_authentication_service.dart';
import 'package:isdp/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../optionpage/optionpage_widget.dart';
import '../repeat/repeat_theme.dart';
import '../repeat/repeat_widgets.dart';
import 'package:flutter/material.dart';
import '../signup/admin_sign_up.dart';
import '../validity/validity.dart';

class AdminSignInWidget extends StatefulWidget {
  const AdminSignInWidget({Key key}) : super(key: key);

  @override
  _AdminSignInWidgetState createState() => _AdminSignInWidgetState();
}

class _AdminSignInWidgetState extends State<AdminSignInWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String budgetValue;
  var databaseServices = new AdminSupabaseServices();

  TextEditingController emailAddressController;
  TextEditingController passwordController;
  bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      backgroundColor: RepEatTheme.of(context).primaryBtnText,
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0, 1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Padding(
                          //   padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       if (Theme.of(context).brightness == Brightness.dark ??
                          //           true)
                          //         Image.asset(
                          //           'assets/images/uiLogo_robinLight@3x.png',
                          //           width: 240,
                          //           height: 60,
                          //           fit: BoxFit.fitWidth,
                          //         ),
                          //       if (!(Theme.of(context).brightness == Brightness.dark) ??
                          //           true)
                          //         Image.asset(
                          //           'assets/images/logo.png',
                          //           width: 140,
                          //           height: 140,
                          //           fit: BoxFit.fitWidth,
                          //         ),
                          //     ],
                          //   ),
                          // ),
                          Image.asset(
                            'assets/images/abstract_572.jpg',
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 370,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'Welcome Back,',
                                            style: RepEatTheme.of(context).title1.override(
                                              fontFamily: 'Outfit',
                                              color: Color(0xFF0F1113),
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: emailAddressController,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText: 'Email Address',
                                              labelStyle: RepEatTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintText: 'Enter your email here...',
                                              hintStyle: RepEatTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 24, 0, 24),
                                            ),
                                            style:
                                            RepEatTheme.of(context).bodyText1.override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF2B343A),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: passwordController,
                                            obscureText: !passwordVisibility,
                                            decoration: InputDecoration(
                                              labelText: 'Password',
                                              labelStyle: RepEatTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              hintText: 'Enter your password here...',
                                              hintStyle: RepEatTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xFFE0E3E7),
                                                  width: 2,
                                                ),
                                                borderRadius: BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 24, 0, 24),
                                              suffixIcon: InkWell(
                                                onTap: () => setState(
                                                      () => passwordVisibility =
                                                  !passwordVisibility,
                                                ),
                                                child: Icon(
                                                  passwordVisibility
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 22,
                                                ),
                                              ),
                                            ),
                                            style:
                                            RepEatTheme.of(context).bodyText1.override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF2B343A),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
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
                                        // SIGN UP VAALA ON TAP


                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SignUpWidget(
                                              key: null,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: REButtonWidget(
                                            onPressed: () async {
                                              final emailVal = emailAddressController.text;
                                              final passwordVal = passwordController.text;
                                              final bool isAuthenticated =
                                              await databaseServices.signIn(
                                                  emailVal, passwordVal);

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
                                                sharedPreferences.setString(
                                                    'email', emailVal);

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
                                                      builder: (context) =>
                                                      const OptionpageWidget()),
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
                                              width: 130,
                                              height: 50,
                                              color: Color(0xFFF7941E),
                                              textStyle:
                                              RepEatTheme.of(context).subtitle2.override(
                                                fontFamily: 'Lexend Deca',
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 2,
                                    indent: 20,
                                    endIndent: 20,
                                    color: Color(0xFFE0E3E7),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
