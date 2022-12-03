import 'package:supabase_flutter/supabase_flutter.dart';

import '../repeat/repeat_theme.dart';
import '../repeat/repeat_widgets.dart';
import '../signin/signin_widget.dart';
import 'package:flutter/material.dart';
import '../security/validity.dart';
import '../auth/authentication_service.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignupWidget extends StatefulWidget {
  const SignupWidget({Key key}) : super(key: key);

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  TextEditingController nameController;
  TextEditingController phoneController;
  TextEditingController emailController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var authenticationServices = new SupabaseServices();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: RepEatTheme.of(context).primaryBackground,
      body: SingleChildScrollView(
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 30),
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
                                    Text(
                                      'Sign Up',
                                      style: RepEatTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFFF7941E),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: TextFormField(
                          controller: nameController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            labelStyle:
                                RepEatTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your name',
                            hintStyle:
                                RepEatTheme.of(context).bodyText1.override(
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
                            focusedBorder: OutlineInputBorder(
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
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: TextFormField(
                          controller: phoneController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Phone No',
                            labelStyle:
                            RepEatTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0x98FFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Phone',
                            hintStyle:
                            RepEatTheme.of(context).bodyText1.override(
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xBDD26F39),
                            contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: RepEatTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ),


                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                        child: TextFormField(
                          controller: emailController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email Id',
                            labelStyle:
                                RepEatTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your email',
                            hintStyle:
                                RepEatTheme.of(context).bodyText1.override(
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
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            filled: true,
                            fillColor: Color(0xBDD26F39),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 20, 24),
                          ),
                          style: RepEatTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
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
                            labelStyle:
                                RepEatTheme.of(context).bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                            hintText: 'Enter your password...',
                            hintStyle:
                                RepEatTheme.of(context).bodyText1.override(
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
                            focusedBorder: OutlineInputBorder(
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
                                  'Existing User? SignIn',
                                  style: RepEatTheme.of(context)
                                      .bodyText1
                                      .override(
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
                                      builder: (context) => SigninWidget(),
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
                            final nameVal = nameController.text;
                            final phoneVal = phoneController.text;
                            final emailVal = emailController.text;
                            final passwordVal = passwordController.text;
                            final bool isAuthenticated = await authenticationServices.signUp(
                                nameVal, phoneVal, emailVal, passwordVal);

                            if (nameVal.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      'Name field is Empty'
                                    )
                                )
                              );
                              return;
                            }

                            if (phoneVal.isEmpty || phoneVal.length != 10) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                      'Phone number Invalid!'
                                    ))
                              );
                              return;
                            }

                            if (!Validity.isValidEmail(emailVal)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Email Invalid'),
                                ),
                              );
                              return;
                            }

                            if (!Validity.isValidPassword(passwordVal)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Password should in this pattern = AlphaNumeric123@#@'),
                                ),
                              );
                              return;
                            }

                            if (isAuthenticated == true && nameVal.isNotEmpty &&
                                phoneVal.isNotEmpty && emailVal.isNotEmpty &&
                            passwordVal.isNotEmpty) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const SigninWidget()),
                              );
                            }
                          },

                          text: 'Signup',
                          options: REButtonOptions(
                            width: 230,
                            height: 60,
                            color: Colors.white,
                            textStyle:
                            RepEatTheme.of(context).subtitle2.override(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
