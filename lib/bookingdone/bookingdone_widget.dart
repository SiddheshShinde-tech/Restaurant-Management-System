import '../repeat/repeat_theme.dart';
import '../repeat/repeat_util.dart';
import '../repeat/repeat_widgets.dart';
import '../home/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BookingdoneWidget extends StatefulWidget {
  const BookingdoneWidget({Key key}) : super(key: key);

  @override
  _BookingdoneWidgetState createState() => _BookingdoneWidgetState();
}

class _BookingdoneWidgetState extends State<BookingdoneWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF8CC63F),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_xlkxtmul.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                      frameRate: FrameRate(60),
                      repeat: false,
                      animate: true,
                    ),
                  ],
                ),
              ),
              Text(
                'Booked!',
                style: RepEatTheme.of(context).title2.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                child: Text(
                  'Thanks for booking a table',
                  style: RepEatTheme.of(context).subtitle2.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                child: REButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: HomeWidget(),
                      ),
                    );
                  },
                  text: 'Go Home',
                  options: REButtonOptions(
                    width: 130,
                    height: 50,
                    color: Colors.white,
                    textStyle: RepEatTheme.of(context).subtitle2.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFFF7941E),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 30,
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
