import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:isdpsample/model/boilerplate_inventory.dart';
import '../auth/admin_authentication_service.dart';
import '../repeat/repeat_theme.dart';
import 'boilerplate_inventory.dart';

class InventoryItem extends StatefulWidget {
  final InventoryItems inventory;
  var num;
  InventoryItem({Key key, this.inventory, this.num}) : super(key: key);
  // const InventoryItem({Key key}) : super(key: key);

  @override
  State<InventoryItem> createState() => _InventoryItemState();
}

class _InventoryItemState extends State<InventoryItem> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
          child: Column(
            children: [
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.96,
                      // height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x3A000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.white,
                          width: 0,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${this.widget.inventory.name}",
                                // this.widget.inventory.name,
                                style: RepEatTheme.of(context)
                                    .bodyText1
                                    .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFFF7941E),
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    if (this.widget.inventory.quantity > 0) {
                                      setState(() {
                                        // counter--;
                                        this.widget.inventory.quantity--;
                                        // inventoryList
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove_circle_outline,
                                    color: Color(0xFFF7941E),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    '${this.widget.inventory.quantity}',
                                    style: RepEatTheme.of(context).bodyText1,
                                  ),
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      // counter++;
                                      this.widget.inventory.quantity++;
                                    });
                                  },
                                  child: Icon(
                                    Icons.add_circle_outline,
                                    color: Color(0xFFF7941E),
                                  )),
                              TextButton(
                                onPressed: () {
                                  counter++;
                                  if (counter == 3) {
                                    AdminSupabaseServices().updateInventory(
                                        this.widget.inventory.id,
                                        this.widget.inventory.quantity);
                                    counter = 0;
                                    Fluttertoast.showToast(
                                      msg: "DataUpdated Successful!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 2,
                                      backgroundColor: Color(0xFFD26F39),
                                      textColor: Color(0xFFFFFFFF),
                                    );
                                  }
                                },
                                child: Center(
                                  child: Text(
                                    'in KGs/Liters',
                                    style: RepEatTheme.of(context).bodyText1,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
            ],
          )),
    );
  }
}
