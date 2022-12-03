import 'package:isdp/buffer/buffer.dart';
import 'package:isdp/database/database_services.dart';


import '../booking/booking_widget.dart';
import '../repeat/repeat_theme.dart';
import '../repeat/repeat_widgets.dart';
import 'package:flutter/material.dart';
import 'package:isdp/models/menu_widget_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key key}) : super(key: key);

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  DatabaseServices databaseServices = new DatabaseServices();

  var data = DatabaseServices().fetchMenu();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFF7941E),
          automaticallyImplyLeading: false,
          title: Center(child: Text(
            'Menu',
            style: RepEatTheme.of(context).title1.override(
              fontFamily: 'Lexend Deca',
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          )
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        key: scaffoldKey,
        backgroundColor: Color(0xFFF1F4F8),
        body: Stack(children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder(
                  future: DatabaseServices().fetchMenu(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Buffer();
                    }
                    if (snapshot.hasData) {
                      List _snapshot = snapshot.data as List;
                      return ListView.builder(
                          itemCount: _snapshot.length,
                          itemBuilder: (((context, index) => MenuItemm(
                                menu: _snapshot[index],
                              ))));
                    }
                    return Buffer();
                  },
                ),

              ),
              Align(
                alignment: AlignmentDirectional(1, 1),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 16, 20),
                  child: REButtonWidget(
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingWidget(),
                        ),
                      );
                    },
                    text: 'Book a Table',
                    options: REButtonOptions(
                      width: 110,
                      height: 50,
                      color: Color(0xFFF7941E),
                      textStyle: RepEatTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 8,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
