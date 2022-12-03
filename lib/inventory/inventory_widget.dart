import '../auth/admin_authentication_service.dart';
import '../buffer/buffer.dart';
import '../model/model_inventory.dart';
import '../repeat/repeat_count_controller.dart';
import '../repeat/repeat_icon_button.dart';
import '../repeat/repeat_theme.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

String user="";

class InventoryWidget extends StatefulWidget {
  const InventoryWidget({Key key}) : super(key: key);

  @override
  _InventoryWidgetState createState() => _InventoryWidgetState();
}

class _InventoryWidgetState extends State<InventoryWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int countControllerValue;
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFF7941E),
        automaticallyImplyLeading: false,
        leading: RepEatIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          buttonSize: 46,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Color(0xFF090F13),
            size: 24,
          ),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Inventory',
          style: RepEatTheme.of(context).subtitle1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFFF1F4F8),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: Stack(children: [
        Column(mainAxisSize: MainAxisSize.max, children: [
          Expanded(
            child: FutureBuilder(
              future: AdminSupabaseServices().fetchInventory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Buffer();
                }
                if (snapshot.hasData) {
                  List _snapshot = snapshot.data as List;
                  return ListView.builder(
                      itemCount: _snapshot.length,
                      itemBuilder: (((context, index) => InventoryItem(
                            inventory: _snapshot[index],
                            num: index,
                          ))));
                }
                return Buffer();
              },
            ),
            // Padding(
            //   padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * 0.96,
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //           blurRadius: 4,
            //           color: Color(0x3A000000),
            //           offset: Offset(0, 2),
            //         )
            //       ],
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //   ),
            // ),

            // ),
          ),
        ])
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: const Icon(Icons.navigation),
      ),
    );
  }
}
