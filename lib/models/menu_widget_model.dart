import 'package:flutter/material.dart';
import 'package:isdp/repeat/repeat_theme.dart';
import 'package:isdp/models/menu_boiler_plate.dart';

import 'menu_boiler_plate.dart';

class MenuItemm extends StatefulWidget {
  final MenuItems menu;
  const MenuItemm({Key key, this.menu}) : super(key: key);

  @override
  State<MenuItemm> createState() => _MenuItemmState();
}

class _MenuItemmState extends State<MenuItemm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 2, 0, 0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Shahi-Paneer.jpeg',
                            width: 74,
                            height: 74,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 1, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                this.widget.menu.name,
                                style: RepEatTheme.of(context).subtitle1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF15212B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                this.widget.menu.category,
                                style: RepEatTheme.of(context).bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 60, 4, 0),
                        child: Text(
                          this.widget.menu.price.toString(),
                          style: RepEatTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
