import 'package:fluttertoast/fluttertoast.dart';
import 'package:isdp/database/database_services.dart';

import '../bookingdone/bookingdone_widget.dart';
import '../repeat/repeat_animations.dart';
import '../repeat/repeat_drop_down.dart';
import '../repeat/repeat_icon_button.dart';
import '../repeat/repeat_theme.dart';
import '../repeat/repeat_widgets.dart';
import 'package:flutter/material.dart';
import 'package:isdp/global.dart';

class BookingWidget extends StatefulWidget {
  const BookingWidget({Key key}) : super(key: key);

  @override
  _BookingWidgetState createState() => _BookingWidgetState();
}

class _BookingWidgetState extends State<BookingWidget>
    with TickerProviderStateMixin {
  String budgetValue;
  TextEditingController textController1;
  TextEditingController reasonController;
  // DatabaseNotifier get databaseNotifier => Provider.of(context, listen: false);
  DatabaseServices dbservices = new DatabaseServices();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var idList = DatabaseServices().fetchTables();
  var tableNo;

  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 40),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'dropDownOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 200,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 100),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 230,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 120),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    reasonController = TextEditingController();
    textController1 = TextEditingController();
    // ignore: non_constant_identifier_names
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF7941E),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Book a Table',
                            style: RepEatTheme.of(context).title1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFDBE2E7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: RepEatIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 48,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 100,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.8,
                        ),
                        decoration: BoxDecoration(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                child: RepEatIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30,
                                    buttonSize: 48,
                                    icon: Icon(
                                      Icons.backup_table_rounded,
                                      color: Color(0xFF95A1AC),
                                      size: 30,
                                    ))),
                            Container(
                              child: Text(
                                'Tables Left - ' + tables.length.toString(),
                                style: RepEatTheme.of(context).title1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF95A1AC),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: RepEatDropDown(
                          options: tables,
                          onChanged: (val) => setState(() {
                            budgetValue = val;
                            tableNo = val;
                          }),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 60,
                          textStyle: RepEatTheme.of(context).bodyText1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFF1E2429),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                          hintText: 'table for',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Color(0xFF95A1AC),
                            size: 15,
                          ),
                          fillColor: Colors.white,
                          elevation: 2,
                          borderColor: Color(0xFFDBE2E7),
                          borderWidth: 2,
                          borderRadius: 8,
                          margin:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 12, 20),
                          hidesUnderline: true,
                        ).animated(
                            [animationsMap['dropDownOnPageLoadAnimation']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          controller: reasonController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelStyle: RepEatTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            hintText: 'Occasion',
                            hintStyle: RepEatTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF090F13),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 40, 24, 0),
                          ),
                          style: RepEatTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                          textAlign: TextAlign.start,
                          maxLines: 4,
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation2']]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      REButtonWidget(
                        onPressed: () {

                          DatabaseServices().makeReserved(int.parse(tableNo), reasonController.text);
                          Fluttertoast.showToast(
                            msg: "Table Booked!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Color(0xFF8CC63F),
                            textColor: Color(0xFFFFFFFF),
                          );

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingdoneWidget()),
                          );
                          // DatabaseServices().makeReserved(tableNo, reasonController.text);

                          // DatabaseServices()
                          //     .makeReserved(tableNo, reasonController.text);
                          // ignore: unrelated_type_equality_checks

                          // print(tableNo);
                          // print(reasonController.text);
                        },
                        text: 'Book',
                        options: REButtonOptions(
                          width: 300,
                          height: 70,
                          color: Colors.white,
                          textStyle: RepEatTheme.of(context).title1.override(
                                fontFamily: 'Lexend Deca',
                                color: Color(0xFFF7941E),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Text(
                'Tap above to complete request',
                style: RepEatTheme.of(context).bodyText1.override(
                      fontFamily: 'Lexend Deca',
                      color: Color(0x81000000),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
