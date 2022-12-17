import '../buffer/buffer.dart';
import '../models/menu_widget_model.dart';
import '../repeat/repeat_icon_button.dart';
import '../repeat/repeat_theme.dart';
import 'package:flutter/material.dart';
import 'package:isdp/database/database_services.dart';

class OrderallocatedWidget extends StatefulWidget {
  const OrderallocatedWidget({Key key}) : super(key: key);

  @override
  _OrderallocatedWidgetState createState() => _OrderallocatedWidgetState();
}

class _OrderallocatedWidgetState extends State<OrderallocatedWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DatabaseServices databaseServices = new DatabaseServices();

  var data = DatabaseServices().fetchTables();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: RepEatIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF95A1AC),
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Dine-in Status',
          style: RepEatTheme.of(context).subtitle1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      color: Color(0x39000000),
                      offset: Offset(0, 1),
                    )
                  ],
                ),
                // child: Padding(
                //   padding: EdgeInsetsDirectional.fromSTEB(12, 16, 12, 24),
                //   child: Row(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Column(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Padding(
                //             padding:
                //                 EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                //             child: Text(
                //               '12',
                //               style: RepEatTheme.of(context).title1.override(
                //                     fontFamily: 'Lexend Deca',
                //                     color: Color(0xFF090F13),
                //                     fontSize: 24,
                //                     fontWeight: FontWeight.bold,
                //                   ),
                //             ),
                //           ),
                //           Text(
                //             'active tables',
                //             style: RepEatTheme.of(context).bodyText2.override(
                //                   fontFamily: 'Lexend Deca',
                //                   color: Color(0xFF95A1AC),
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.normal,
                //                 ),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Row(
                //             mainAxisSize: MainAxisSize.max,
                //             children: [
                //               Padding(
                //                 padding:
                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                //                 child: Text(
                //                   '5',
                //                   style:
                //                       RepEatTheme.of(context).title1.override(
                //                             fontFamily: 'Lexend Deca',
                //                             color: Color(0xFF090F13),
                //                             fontSize: 24,
                //                             fontWeight: FontWeight.bold,
                //                           ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Text(
                //             'orders in process',
                //             style: RepEatTheme.of(context).bodyText2.override(
                //                   fontFamily: 'Lexend Deca',
                //                   color: Color(0xFF95A1AC),
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.normal,
                //                 ),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Row(
                //             mainAxisSize: MainAxisSize.max,
                //             children: [
                //               Padding(
                //                 padding:
                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                //                 child: Text(
                //                   '2',
                //                   style:
                //                       RepEatTheme.of(context).title1.override(
                //                             fontFamily: 'Lexend Deca',
                //                             color: Color(0xFF090F13),
                //                             fontSize: 24,
                //                             fontWeight: FontWeight.bold,
                //                           ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Text(
                //             'orders left',
                //             textAlign: TextAlign.justify,
                //             style: RepEatTheme.of(context).bodyText2.override(
                //                   fontFamily: 'Lexend Deca',
                //                   color: Color(0xFF95A1AC),
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.normal,
                //                 ),
                //           ),
                //         ],
                //       ),
                //       Column(
                //         mainAxisSize: MainAxisSize.max,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Row(
                //             mainAxisSize: MainAxisSize.max,
                //             children: [
                //               Padding(
                //                 padding:
                //                     EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                //                 child: Text(
                //                   '2',
                //                   style:
                //                       RepEatTheme.of(context).title1.override(
                //                             fontFamily: 'Lexend Deca',
                //                             color: Color(0xFF090F13),
                //                             fontSize: 24,
                //                             fontWeight: FontWeight.bold,
                //                           ),
                //                 ),
                //               ),
                //             ],
                //           ),
                //           Text(
                //             'orders taken',
                //             style: RepEatTheme.of(context).bodyText2.override(
                //                   fontFamily: 'Lexend Deca',
                //                   color: Color(0xFF95A1AC),
                //                   fontSize: 12,
                //                   fontWeight: FontWeight.normal,
                //                 ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          // Expanded(child:
                          // ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Column(
                          //         mainAxisSize: MainAxisSize.max,
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             'Table 1',
                          //             style: RepEatTheme.of(context)
                          //                 .subtitle1
                          //                 .override(
                          //                   fontFamily: 'Lexend Deca',
                          //                   color: Color(0xFF090F13),
                          //                   fontSize: 18,
                          //                   fontWeight: FontWeight.w500,
                          //                 ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // Padding(
                          //   padding:
                          //       EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.max,
                          //     children: [
                          //       Expanded(
                          //         child: Text(
                          //           'Dal Makhni, ',
                          //           style: RepEatTheme.of(context)
                          //               .bodyText2
                          //               .override(
                          //                 fontFamily: 'Lexend Deca',
                          //                 color: Color(0xFF95A1AC),
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.normal,
                          //               ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              //   child: Container(
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       boxShadow: [
              //         BoxShadow(
              //           blurRadius: 4,
              //           color: Color(0x33000000),
              //           offset: Offset(0, 2),
              //         )
              //       ],
              //       borderRadius: BorderRadius.circular(16),
              //     ),
              //     child: Padding(
              //       padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
              //       child: SingleChildScrollView(
              //         child: Column(
              //           mainAxisSize: MainAxisSize.max,
              //           children: [
              //             Padding(
              //               padding:
              //                   EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   Column(
              //                     mainAxisSize: MainAxisSize.max,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         'Table 7',
              //                         style: RepEatTheme.of(context)
              //                             .subtitle1
              //                             .override(
              //                               fontFamily: 'Lexend Deca',
              //                               color: Color(0xFF090F13),
              //                               fontSize: 18,
              //                               fontWeight: FontWeight.w500,
              //                             ),
              //                       ),
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Padding(
              //               padding:
              //                   EdgeInsetsDirectional.fromSTEB(16, 4, 16, 12),
              //               child: Row(
              //                 mainAxisSize: MainAxisSize.max,
              //                 children: [
              //                   Expanded(
              //                     child: Text(
              //                       'Dal Makhni',
              //                       style: RepEatTheme.of(context)
              //                           .bodyText2
              //                           .override(
              //                             fontFamily: 'Lexend Deca',
              //                             color: Color(0xFF95A1AC),
              //                             fontSize: 14,
              //                             fontWeight: FontWeight.normal,
              //                           ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
