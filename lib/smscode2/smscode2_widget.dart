import '../repeat/repeat_theme.dart';
import '../repeat/repeat_util.dart';
import '../repeat/repeat_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Smscode2Widget extends StatefulWidget {
  const Smscode2Widget({Key key}) : super(key: key);

  @override
  _Smscode2WidgetState createState() => _Smscode2WidgetState();
}

class _Smscode2WidgetState extends State<Smscode2Widget> {
  TextEditingController phoneNumberController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    phoneNumberController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: RepEatTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.chevron_left_rounded,
          color: Color(0xFF8CC63F),
          size: 32,
        ),
        title: Text(
          'Code Verification',
          style: RepEatTheme.of(context).title2.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF8CC63F),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: RepEatTheme.of(context).primaryBackground,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: RepEatTheme.of(context).primaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: TextFormField(
                  controller: phoneNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Enter the 6 digit code',
                    labelStyle: RepEatTheme.of(context).bodyText1.override(
                          fontFamily: 'Lexend Deca',
                          color: Color(0x98FFFFFF),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                    hintText: '000000',
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF7941E),
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
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: REButtonWidget(
                  onPressed: () {
                    print('Button-Login pressed ...');
                  },
                  text: 'Verify Code',
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
            ],
          ),
        ),
      ),
    );
  }
}
