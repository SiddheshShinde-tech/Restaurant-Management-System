import '../repeat/repeat_animations.dart';
import '../repeat/repeat_theme.dart';
import '../repeat/repeat_util.dart';
import '../repeat/repeat_widgets.dart';
import '../inup/inup_widget.dart';
import '../signin/signin_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({Key key}) : super(key: key);

  @override
  _IntroWidgetState createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 1000,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
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
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1E2429),
      body: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SigninWidget(),
            ),
          );
        },
        child: Stack(
          alignment: AlignmentDirectional(0, 0.3999999999999999),
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/isdp.webp',
                    width: 180,
                    height: 180,
                    fit: BoxFit.fitHeight,
                  ).animated([animationsMap['imageOnPageLoadAnimation']]),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: Text(
                      'Food.io',
                      style: RepEatTheme.of(context).title1.override(
                            fontFamily: 'Itim',
                            color: Color(0xFFF7941E),
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                    ).animated([animationsMap['textOnPageLoadAnimation1']]),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 120),
                    child: Text(
                      'serving happiness',
                      style: RepEatTheme.of(context).title3.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8CC63F),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                    ).animated([animationsMap['textOnPageLoadAnimation2']]),
                  ),
                ],
              ).animated([animationsMap['columnOnPageLoadAnimation']]),
            ).animated([animationsMap['containerOnPageLoadAnimation']]),
            REButtonWidget(
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                    reverseDuration: Duration(milliseconds: 0),
                    child: InupWidget(),
                  ),
                );
              },
              text: 'Get Started',
              options: REButtonOptions(
                width: 150,
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
                borderRadius: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
