import 'package:isdp/auth/authentication_service.dart';
import 'package:isdp/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../booking/booking_widget.dart';
import '../database/database_services.dart';
import '../deals/deals_widget.dart';
import '../repeat/repeat_theme.dart';
import '../menu/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageViewController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var authenticationServices = new SupabaseServices();

  // final String name =
  //     Supabase.instance.client.auth.user().userMetadata['name'].toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: Container(
                              width: 60,
                              height: 60,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/hands.jpeg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Welcome,',
                                style: RepEatTheme.of(context).title3.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF1E2429),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  "name",
                                  style: RepEatTheme.of(context).title3.override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFFF7941E),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'What would you like to do',
                                      style:
                                          RepEatTheme.of(context).bodyText1.override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                    ),
                                    Container(child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          45, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          SupabaseServices.signOut();

                                          final SharedPreferences
                                          sharedPreferences =
                                          await SharedPreferences
                                              .getInstance();
                                          sharedPreferences.clear();

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                const SigninWidget()),
                                          );
                                        },

                                        child: Text(
                                          "LogOut",
                                          style: RepEatTheme.of(context)
                                              .title3
                                              .override(
                                            fontFamily: 'Lexend Deca',
                                            color: Color(0xFF8CC63F),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                            // child: Text(
                            //   'What would you like to do',
                            //   style: RepEat.of(context)
                            //       .bodyText1
                            //       .override(
                            //     fontFamily: 'Lexend Deca',
                            //     color: Color(0xFF090F13),
                            //     fontSize: 14,
                            //     fontWeight: FontWeight.normal,
                            //   ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 190,
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(6, 5, 6, 0),
                                child: PageView(
                                  controller: pageViewController ??=
                                      PageController(initialPage: 0),
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    Image.asset(
                                      'assets/images/r1.jpeg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/r2.jpeg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/r3.webp',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Image.asset(
                                      'assets/images/r5.jpg',
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(-0.9, 1),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 0, 0, 8),
                                  child: SmoothPageIndicator(
                                    controller: pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 4,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) {
                                      pageViewController.animateToPage(
                                        i,
                                        duration: Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                    },
                                    effect: ExpandingDotsEffect(
                                      expansionFactor: 2,
                                      spacing: 8,
                                      radius: 0,
                                      dotWidth: 5,
                                      dotHeight: 5,
                                      dotColor: Color(0xFF9E9E9E),
                                      activeDotColor: Colors.white,
                                      paintStyle: PaintingStyle.fill,
                                    ),
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Color(0x4B1A1F24),
                        offset: Offset(0, 2),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [Color(0xFF00968A), Color(0xFFF2A384)],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0.94, -1),
                      end: AlignmentDirectional(-0.94, 1),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x39000000),
                        offset: Offset(0, -1),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Service',
                              style: RepEatTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookingWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 110,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Color(0x3B000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.deck,
                                        color: Color(0xFF1E2429),
                                        size: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          'Booking ',
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MenuWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 110,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Color(0x3A000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.restaurant_menu,
                                        color: Color(0xFF1E2429),
                                        size: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          'Menu',
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DealsWidget(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 110,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: Color(0x39000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4, 4, 4, 4),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.money_off_outlined,
                                        color: Color(0xFF1E2429),
                                        size: 40,
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 0, 0),
                                        child: Text(
                                          'Deals',
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 12),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Top Deals Today',
                              style: RepEatTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF090F13),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.92,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4F5F7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0x6639D2C0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/images/dalmakhni.jpeg',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Dal Makhni',
                                      style:
                                          RepEatTheme.of(context).subtitle1.override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF1E2429),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Text(
                                        '1 full handi',
                                        style: RepEatTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₹200',
                                    textAlign: TextAlign.end,
                                    style:
                                        RepEatTheme.of(context).subtitle2.override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF8CC63F),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        DatabaseServices().fetchTables();
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookingWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Book table',
                                        textAlign: TextAlign.end,
                                        style: RepEatTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF090F13),
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F5F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0x6639D2C0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'assets/images/istockphoto-879661732-612x612.jpeg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Butter Chicken',
                                        style: RepEatTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          '1 full chicken',
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₹350',
                                      textAlign: TextAlign.end,
                                      style:
                                          RepEatTheme.of(context).subtitle2.override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF8CC63F),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Book table',
                                          textAlign: TextAlign.end,
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F5F7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                                child: Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Color(0x6639D2C0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.asset(
                                    'assets/images/33607321-DB22-4B77-8C5D-725202087124.jpeg',
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Chinese',
                                        style: RepEatTheme.of(context)
                                            .subtitle1
                                            .override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF1E2429),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                        child: Text(
                                          'Noodles+manchurian',
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '₹280',
                                      textAlign: TextAlign.end,
                                      style:
                                          RepEatTheme.of(context).subtitle2.override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF8CC63F),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookingWidget(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Book table',
                                          textAlign: TextAlign.end,
                                          style: RepEatTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF090F13),
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
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
                    ],
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
